from flask import Flask, render_template, request, jsonify
import mysql.connector
from datetime import datetime

app = Flask(__name__)

# Database configuration
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'Password@1',  # Change this to your MySQL password
    'database': 'ecom'
}

def get_db_connection():
    return mysql.connector.connect(**db_config)

@app.route('/')
def index():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    # Get dashboard statistics
    cursor.execute("SELECT COUNT(*) as count FROM customer")
    total_customers = cursor.fetchone()['count']
    
    cursor.execute("SELECT COUNT(*) as count FROM orders")
    total_orders = cursor.fetchone()['count']
    
    cursor.execute("SELECT COUNT(*) as count FROM product")
    total_products = cursor.fetchone()['count']
    
    cursor.execute("SELECT SUM(amount) as total FROM payment")
    total_revenue = cursor.fetchone()['total'] or 0
    
    # Payment method analysis
    cursor.execute("""
        SELECT method, COUNT(*) as transactions, 
               SUM(amount) as total_amount, 
               AVG(amount) as avg_amount
        FROM payment
        GROUP BY method
    """)
    payment_analysis = cursor.fetchall()
    
    # Calculate percentages
    total_transactions = sum(p['transactions'] for p in payment_analysis)
    for p in payment_analysis:
        p['percentage'] = round((p['transactions'] / total_transactions) * 100, 1)
    
    cursor.close()
    conn.close()
    
    return render_template('index.html', 
                         total_customers=total_customers,
                         total_orders=total_orders,
                         total_products=total_products,
                         total_revenue=total_revenue,
                         payment_analysis=payment_analysis)

@app.route('/customers')
def customers():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    search = request.args.get('search', '')
    if search:
        cursor.execute("""
            SELECT * FROM customer 
            WHERE cname LIKE %s OR email LIKE %s
        """, (f'%{search}%', f'%{search}%'))
    else:
        cursor.execute("SELECT * FROM customer")
    
    customers = cursor.fetchall()
    cursor.close()
    conn.close()
    
    return render_template('customers.html', customers=customers, search=search)

@app.route('/customer/<int:cid>')
def customer_detail(cid):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    # Get customer details
    cursor.execute("SELECT * FROM customer WHERE cid = %s", (cid,))
    customer = cursor.fetchone()
    
    # Get order history using stored procedure
    cursor.callproc('get_customer_order_history', [cid])
    orders = []
    for result in cursor.stored_results():
        orders = result.fetchall()
    
    # Get total spent using function
    cursor.execute("SELECT get_customer_total_spent(%s) as total_spent", (cid,))
    total_spent = cursor.fetchone()['total_spent']
    
    # Get order count using function
    cursor.execute("SELECT count_customer_orders(%s) as order_count", (cid,))
    order_count = cursor.fetchone()['order_count']
    
    cursor.close()
    conn.close()
    
    return render_template('customer_detail.html', 
                         customer=customer, 
                         orders=orders,
                         total_spent=total_spent,
                         order_count=order_count)

@app.route('/products')
def products():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    category = request.args.get('category', '')
    if category:
        cursor.callproc('get_products_by_category', [category])
        products = []
        for result in cursor.stored_results():
            products = result.fetchall()
    else:
        cursor.execute("""
            SELECT p.*, c.category_name 
            FROM product p
            JOIN category c ON p.category_id = c.category_id
            ORDER BY p.product_id
        """)
        products = cursor.fetchall()
    
    # Get unique categories
    cursor.execute("SELECT DISTINCT category_name FROM category ORDER BY category_name")
    categories = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('products.html', products=products, categories=categories)

@app.route('/products_discount')
def products_discount():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("""
        SELECT p.product_id, p.product_name, c.category_name, p.type, 
               p.price as original_price,
               CASE 
                   WHEN p.type = 'Luxury' THEN p.price * 0.10
                   WHEN p.type = 'Essential' THEN p.price * 0.05
                   ELSE 0
               END as discount,
               CASE 
                   WHEN p.type = 'Luxury' THEN p.price * 0.90
                   WHEN p.type = 'Essential' THEN p.price * 0.95
                   ELSE p.price
               END as discounted_price
        FROM product p
        JOIN category c ON p.category_id = c.category_id
        WHERE p.type IN ('Luxury', 'Essential')
        ORDER BY discount DESC
    """)
    products = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('products_discount.html', products=products)

@app.route('/orders')
def orders():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("""
        SELECT o.order_id, c.cname as customer_name, c.email,
               o.order_date, p.amount, p.method
        FROM orders o
        JOIN customer c ON o.cid = c.cid
        JOIN payment p ON o.order_id = p.order_id
        ORDER BY o.order_date DESC
    """)
    orders = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('orders.html', orders=orders)

@app.route('/create_order', methods=['GET', 'POST'])
def create_order():
    if request.method == 'POST':
        order_id = int(request.form['order_id'])
        customer_id = int(request.form['customer_id'])
        payment_id = int(request.form['payment_id'])
        amount = float(request.form['amount'])
        method = request.form['method']
        
        conn = get_db_connection()
        cursor = conn.cursor()
        
        try:
            # Call stored procedure with transaction handling
            cursor.callproc('create_order', [order_id, customer_id, payment_id, amount, method])
            conn.commit()
            
            # Check order_audit table to verify trigger worked
            cursor.execute("SELECT * FROM order_audit WHERE order_id = %s", (order_id,))
            audit = cursor.fetchone()
            
            cursor.close()
            conn.close()
            
            return jsonify({'success': True, 'message': 'Order created successfully', 'audit': audit is not None})
        except Exception as e:
            conn.rollback()
            cursor.close()
            conn.close()
            return jsonify({'success': False, 'message': str(e)})
    
    # GET request
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT cid, cname FROM customer ORDER BY cname")
    customers = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('create_order.html', customers=customers)

@app.route('/payments')
def payments():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("""
        SELECT p.payment_id, o.order_id, c.cname as customer_name,
               p.amount, p.method, o.order_date
        FROM payment p
        JOIN orders o ON p.order_id = o.order_id
        JOIN customer c ON o.cid = c.cid
        ORDER BY o.order_date DESC
    """)
    payments = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('payments.html', payments=payments)

@app.route('/suppliers')
def suppliers():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT * FROM supplier ORDER BY supplier_name")
    suppliers = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('suppliers.html', suppliers=suppliers)

@app.route('/sales_report', methods=['GET', 'POST'])
def sales_report():
    report_data = []
    start_date = ''
    end_date = ''
    
    if request.method == 'POST':
        start_date = request.form['start_date']
        end_date = request.form['end_date']
        
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        
        # Call stored procedure
        cursor.callproc('get_sales_report', [start_date, end_date])
        
        for result in cursor.stored_results():
            report_data = result.fetchall()
        
        cursor.close()
        conn.close()
    
    return render_template('sales_report.html', 
                         report_data=report_data,
                         start_date=start_date,
                         end_date=end_date)

@app.route('/top_customers')
def top_customers():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    limit = request.args.get('limit', 10, type=int)
    
    # Call stored procedure
    cursor.callproc('get_top_customers', [limit])
    
    customers = []
    for result in cursor.stored_results():
        customers = result.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('top_customers.html', customers=customers, limit=limit)

@app.route('/customer_offers')
def customer_offers():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    # Call stored procedure with cursor
    cursor.callproc('generate_customer_offers')
    
    offers = []
    for result in cursor.stored_results():
        offers = result.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('customer_offers.html', offers=offers)

@app.route('/category_revenue')
def category_revenue():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    # Call stored procedure with cursor
    cursor.callproc('calculate_category_revenue')
    
    categories = []
    for result in cursor.stored_results():
        categories = result.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('category_revenue.html', categories=categories)

@app.route('/update_product_price', methods=['GET', 'POST'])
def update_product_price():
    if request.method == 'POST':
        product_id = int(request.form['product_id'])
        new_price = float(request.form['new_price'])
        
        conn = get_db_connection()
        cursor = conn.cursor()
        
        # Call stored procedure (this will trigger the price history trigger)
        cursor.callproc('update_product_price', [product_id, new_price])
        conn.commit()
        
        cursor.close()
        conn.close()
        
        return jsonify({'success': True, 'message': 'Price updated successfully'})
    
    # GET request
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT product_id, product_name, price FROM product ORDER BY product_name")
    products = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('update_product_price.html', products=products)

@app.route('/price_history')
def price_history():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("""
        SELECT h.history_id, p.product_name, h.old_price, h.new_price,
               h.changed_date, (h.new_price - h.old_price) as price_change
        FROM product_price_history h
        JOIN product p ON h.product_id = p.product_id
        ORDER BY h.changed_date DESC
    """)
    history = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('price_history.html', history=history)

@app.route('/order_audit')
def order_audit():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("""
        SELECT a.audit_id, a.order_id, c.cname as customer_name,
               a.action, a.action_date
        FROM order_audit a
        LEFT JOIN customer c ON a.cid = c.cid
        ORDER BY a.action_date DESC
    """)
    audits = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('order_audit.html', audits=audits)

@app.route('/platforms')
def platforms():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT * FROM ecom_platform ORDER BY platform_name")
    platforms = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('platforms.html', platforms=platforms)

@app.route('/statistics')
def statistics():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    # Get average order value using function
    cursor.execute("SELECT get_avg_order_value() as avg_value")
    avg_order_value = cursor.fetchone()['avg_value']
    
    # Category-wise product count
    cursor.execute("""
        SELECT c.category_name, COUNT(p.product_id) as product_count
        FROM category c
        LEFT JOIN product p ON c.category_id = p.category_id
        GROUP BY c.category_name
        ORDER BY product_count DESC
    """)
    category_stats = cursor.fetchall()
    
    # City-wise customer count
    cursor.execute("""
        SELECT address as city, COUNT(*) as customer_count
        FROM customer
        GROUP BY address
        ORDER BY customer_count DESC
    """)
    city_stats = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('statistics.html', 
                         avg_order_value=avg_order_value,
                         category_stats=category_stats,
                         city_stats=city_stats)

if __name__ == '__main__':
    app.run(debug=True)