import logging
import pandas as pd

from config import OUTPUT_FOLDER

from generators.shipment_generator import (
    generate_shipments
)

from generators.shipment_line_generator import (
    generate_shipment_lines
)

logging.basicConfig(
    level=logging.INFO,
    format="%(levelname)s - %(message)s"
)

logging.info("Loading master data...")

orders = pd.read_csv(
    OUTPUT_FOLDER / "SalesOrders.csv"
)

sales_lines = pd.read_csv(
    OUTPUT_FOLDER / "SalesOrderLines.csv"
)

products = pd.read_csv(
    OUTPUT_FOLDER / "Products.csv"
)

warehouses = pd.read_csv(
    OUTPUT_FOLDER / "Warehouses.csv"
)

carriers = pd.read_csv(
    OUTPUT_FOLDER / "Carriers.csv"
)

logging.info("Generating Shipments...")

shipments = generate_shipments(
    orders,
    carriers,
    warehouses
)

logging.info("Generating Shipment Lines...")

shipment_lines = generate_shipment_lines(
    shipments,
    sales_lines,
    products
)

shipments.to_csv(
    OUTPUT_FOLDER / "Shipments.csv",
    index=False
)

shipment_lines.to_csv(
    OUTPUT_FOLDER / "ShipmentLines.csv",
    index=False
)

logging.info(f"{len(shipments):,} Shipments Created")

logging.info(f"{len(shipment_lines):,} Shipment Lines Created")