import logging
import pandas as pd

from config import OUTPUT_FOLDER
from config import NUM_ORDERS
from config import MIN_LINES_PER_ORDER
from config import MAX_LINES_PER_ORDER

from generators.sales_order_generator import (
    generate_sales_orders
)

from generators.sales_order_line_generator import (
    generate_sales_order_lines
)

logging.basicConfig(
    level=logging.INFO,
    format="%(levelname)s - %(message)s"
)

logging.info("Loading master data...")

customers = pd.read_csv(
    OUTPUT_FOLDER / "Customers.csv"
)

products = pd.read_csv(
    OUTPUT_FOLDER / "Products.csv"
)

calendar = pd.read_csv(
    OUTPUT_FOLDER / "Calendar.csv"
)

logging.info("Generating Sales Orders...")

orders = generate_sales_orders(
    customers,
    calendar,
    NUM_ORDERS
)

logging.info("Generating Sales Order Lines...")

lines = generate_sales_order_lines(
    orders,
    products,
    MIN_LINES_PER_ORDER,
    MAX_LINES_PER_ORDER
)

orders.to_csv(
    OUTPUT_FOLDER / "SalesOrders.csv",
    index=False
)

lines.to_csv(
    OUTPUT_FOLDER / "SalesOrderLines.csv",
    index=False
)

logging.info(
    f"{len(orders):,} Orders Created"
)

logging.info(
    f"{len(lines):,} Order Lines Created"
)