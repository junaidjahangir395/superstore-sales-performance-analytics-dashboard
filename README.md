# 📊 Superstore Sales Performance Analytics Dashboard

A comprehensive end-to-end data analytics project that analyzes global superstore sales data through Python data cleaning, SQL analytics queries, and interactive dashboard visualizations.

## 🎯 Project Overview

This project demonstrates a complete data analytics pipeline:
- **Data Cleaning**: Python/Pandas for data preprocessing and feature engineering
- **Database Storage**: MySQL for persistent data management
- **Analytics**: Advanced SQL queries for business intelligence
- **Visualization**: Interactive Plotly dashboard for insights exploration

The project analyzes over 51,000 orders across multiple regions, customer segments, and product categories to uncover actionable business insights.

## 📈 Key Analytics & Features

### Dashboard Metrics

1. **Sales Overview**
   - Yearly sales trends and order counts
   - Monthly sales patterns and seasonality
   - Year-to-date (YTD) sales tracking

2. **Category Analysis**
   - Sales performance by product category and sub-category
   - Product category contribution to total revenue
   - Top-performing product lines

3. **Geographic Insights**
   - Regional sales distribution
   - Top-10 cities by sales volume
   - State-level performance rankings
   - Sales share percentages by location

4. **Customer Segmentation**
   - RFM (Recency, Frequency, Monetary) analysis
   - Customer lifetime value clustering
   - Segment behavior comparison
   - New vs. returning customer metrics

5. **Shipping & Operations**
   - Shipping mode performance analysis
   - Average delivery times by mode
   - Order fulfillment metrics

## 📁 Project Structure

```
superstore-sales-performance-analytics-dashboard/
│
├── python/
│   ├── superstore.ipynb          # Jupyter notebook with full analysis
│   ├── superstore.py             # Python script (from notebook)
│   └── superstore.html           # Exported interactive dashboard
│
├── sql/
│   ├── 01_row_count.sql          # Data validation queries
│   ├── 02_yearly_sales.sql       # Annual sales analysis
│   ├── 03_monthly_trend.sql      # Monthly trends with 3-month moving avg
│   ├── 04_category.sql           # Category & sub-category breakdown
│   ├── 05_regional.sql           # Regional performance with ranking
│   ├── 06_cities.sql             # Top 10 cities by sales
│   ├── 07_rfm.sql                # RFM customer segmentation
│   ├── 08_shipping.sql           # Shipping mode analysis
│   ├── 09_top_products.sql       # Top 10 products by sales
│   └── 10_top_states.sql         # Top 10 states by sales
│
├── screenshot/
│   ├── row_count.png             # Data volume snapshot
│   ├── yearly_sales.png          # Annual trends
│   ├── monthly_trend.png         # Seasonal patterns
│   ├── category.png              # Category breakdown
│   ├── regional.png              # Regional distribution
│   ├── cities.png                # City-level performance
│   ├── states.png                # State rankings
│   ├── product.png               # Top products
│   ├── shipping.png              # Shipping analysis
│   └── rfm.png                   # Customer segmentation
│
└── README.md                      # This file
```

## 🛠️ Technologies & Tools

- **Python 3.x** - Data processing and transformation
  - `pandas` - Data manipulation
  - `numpy` - Numerical computing
  - `matplotlib` - Static visualizations
  - `seaborn` - Statistical visualizations
  - `sqlalchemy` - Database ORM
  - `mysql-connector-python` - MySQL connection

- **MySQL** - Relational database storage
  - Database: `portfolio_db`
  - Table: `global_superstore`

- **Plotly** - Interactive dashboard and visualizations
- **Jupyter Notebook** - Interactive analysis environment

## 📊 Data Pipeline

### Step 1: Data Cleaning (Python)
```
Raw CSV → Pandas DataFrame → Data Validation → Feature Engineering → Cleaned CSV
```

Key transformations:
- Column name standardization (snake_case)
- Date parsing and formatting (DD/MM/YYYY)
- Null value handling
- Data type conversion
- Derived features:
  - `order_year`, `order_month`, `order_quarter`
  - `days_to_ship` (calculated from dates)
  - `sales_tier` (sales value bucketing)
  - `shipping_tier` (delivery speed categories)
  - `is_high_value` (top 5% orders)
  - `is_new_customer` (first purchase flag)
  - `customer_order_rank` (purchase history)

### Step 2: Database Loading
```
Cleaned CSV → SQLAlchemy → MySQL Database
```

### Step 3: SQL Analytics
```
Database Queries → Aggregated Metrics → Business Insights
```

### Step 4: Dashboard Visualization
```
Query Results → Plotly Interactive Charts → HTML Dashboard
```

## 📋 Data Schema

### Main Table: `global_superstore`

**Order Information**
- `row_id` - Unique row identifier
- `order_id` - Order identifier
- `order_date` - Order placement date
- `ship_date` - Shipment date
- `days_to_ship` - Fulfillment time (calculated)

**Customer Information**
- `customer_id` - Customer identifier
- `customer_name` - Customer name
- `segment` - Customer segment (Consumer, Corporate, Home Office)

**Geographic Information**
- `country` - Country of delivery
- `city` - City of delivery
- `state` - State/Province of delivery
- `postal_code` - Postal code
- `region` - Region grouping

**Product Information**
- `product_id` - Product identifier
- `product_name` - Product name
- `category` - Product category
- `sub_category` - Product sub-category

**Transaction Information**
- `sales` - Order value ($)
- `ship_mode` - Shipping method

**Derived Features**
- `sales_tier` - Sales value bracket
- `shipping_tier` - Delivery speed category
- `is_high_value` - Top 5% order flag
- `is_new_customer` - First purchase indicator
- `customer_order_rank` - Customer purchase sequence

## 🔍 SQL Queries Overview

| Query | Purpose | Key Metrics |
|-------|---------|------------|
| `01_row_count.sql` | Data validation | Total records in database |
| `02_yearly_sales.sql` | Annual performance | Orders, customers, revenue, AOV |
| `03_monthly_trend.sql` | Seasonal analysis | Monthly sales, 3-month MA, YTD |
| `04_category.sql` | Product performance | Sales by category/sub-category |
| `05_regional.sql` | Geographic analysis | Regional sales, rankings, ship times |
| `06_cities.sql` | City-level insights | Top 10 cities by volume |
| `07_rfm.sql` | Customer segmentation | RFM scores and customer tiers |
| `08_shipping.sql` | Logistics analysis | Shipping mode performance |
| `09_top_products.sql` | Product ranking | Top 10 products by revenue |
| `10_top_states.sql` | State performance | Top 10 states with metrics |

## 🚀 Getting Started

### Prerequisites
- Python 3.7+
- MySQL Server (local or remote)
- Jupyter Notebook or Python IDE
- Global Superstore dataset (`global_superstore.csv`)

### Installation

1. **Clone the repository**
```bash
git clone <repository-url>
cd superstore-sales-performance-analytics-dashboard
```

2. **Install Python dependencies**
```bash
pip install pandas numpy matplotlib seaborn mysql-connector-python sqlalchemy plotly
```

3. **Set up MySQL Database**
```sql
CREATE DATABASE portfolio_db;
USE portfolio_db;
```

4. **Configure database connection**
In `python/superstore.py`, update MySQL credentials:
```python
MYSQL_USER     = 'your_username'
MYSQL_PASSWORD = 'your_password'
MYSQL_HOST     = 'localhost'
MYSQL_PORT     = '3306'
MYSQL_DB       = 'portfolio_db'
```

### Running the Analysis

#### Option 1: Using Jupyter Notebook
```bash
cd python
jupyter notebook superstore.ipynb
```
Run cells sequentially to execute the analysis pipeline.

#### Option 2: Using Python Script
```bash
cd python
python superstore.py
```

#### Step-by-Step Execution:
1. **Data Cleaning Phase** - Loads raw CSV, cleans data, generates features
2. **Validation Phase** - Performs data quality checks
3. **Visualization Phase** - Creates exploratory charts
4. **MySQL Upload** - Loads cleaned data into database
5. **SQL Analytics** - Execute query files (01-10) in MySQL Workbench or CLI

### Running SQL Queries

In MySQL Workbench or MySQL CLI:
```bash
mysql -u root -p portfolio_db < sql/01_row_count.sql
mysql -u root -p portfolio_db < sql/02_yearly_sales.sql
# ... continue for remaining queries
```

Or copy-paste individual query content into MySQL client.

## 📊 Key Insights (Example)

Based on the analysis structure, you can expect to find:

- **Sales Growth**: Year-over-year trends and seasonal patterns
- **Top Performers**: Best-selling products and regions
- **Customer Value**: RFM segmentation identifying high-value customers
- **Operational Efficiency**: Shipping performance by mode
- **Geographic Hotspots**: Cities and states driving majority of revenue

## 📈 Visualizations Included

The project generates 10+ interactive visualizations:
- Bar charts (yearly orders, category sales, regional breakdown)
- Line charts (monthly sales trends, moving averages)
- Horizontal bar charts (regional and city comparisons)
- RFM heatmaps (customer segmentation clusters)
- Shipping performance metrics
- Product rankings
- State-level performance

## 🔧 Customization & Extensions

### Add New Features
1. Add calculations in the Python data cleaning phase
2. Create new derived columns
3. Build new SQL queries for specific metrics

### Modify Thresholds
- Sales tier boundaries (line 218-222 in `superstore.py`)
- Shipping tier classifications (line 232-237)
- High-value order percentile (line 246)

### Expand Dashboard
- Add more SQL queries for different dimensions
- Create additional Plotly visualizations
- Build interactive filters and drill-down capabilities

## 📝 Data Quality Checks

The script includes comprehensive validation:
- Null value detection and handling
- Duplicate row identification
- Data type verification
- Date range validation
- Sales value positivity checks
- Shipping duration consistency

## 📚 Files Reference

| File | Size | Purpose |
|------|------|---------|
| `superstore.ipynb` | ~150KB | Full interactive analysis |
| `superstore.html` | ~650KB | Exportable dashboard |
| `superstore.py` | ~12KB | Executable Python script |

## 🎓 Learning Outcomes

This project demonstrates:
- ✅ Full ETL pipeline implementation
- ✅ SQL aggregations and window functions
- ✅ Data quality and validation practices
- ✅ Feature engineering for analytics
- ✅ Interactive visualization design
- ✅ Database integration with Python
- ✅ Dashboard creation and reporting

## 📝 License

This project is provided as-is for educational and portfolio purposes.

## 🤝 Contributing

To extend this project:
1. Add new analysis dimensions
2. Create additional visualizations
3. Build predictive models (forecasting, segmentation)
4. Develop real-time dashboard capabilities
5. Optimize SQL queries for performance

## 📞 Support

For questions or issues:
- Review the Jupyter notebook for detailed methodology
- Check SQL comments for query logic
- Verify MySQL connection settings
- Ensure all dependencies are installed

## 🔄 Project Status

✅ **Complete** - Full analysis pipeline ready for use and extension

---

**Last Updated**: April 2024  
**Data Period**: Global Superstore Historical Data  
**Records**: 51,290+ orders analyzed
