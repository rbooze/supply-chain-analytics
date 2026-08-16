import logging
import pandas as pd

from config import OUTPUT_FOLDER

from generators.inventory_generator import (
    generate_inventory
)

from generators.purchase_order_generator import (
    generate_purchase_orders
)

from generators.inventory_transaction_generator import (
    generate_inventory_transactions
)

logging.basicConfig(level=logging.INFO)

products = pd.read_csv(
    OUTPUT_FOLDER / "Products.csv"
)

warehouses = pd.read_csv(
    OUTPUT_FOLDER / "Warehouses.csv"
)

suppliers = pd.read_csv(
    OUTPUT_FOLDER / "Suppliers.csv"
)

logging.info("Generating Inventory...")

inventory = generate_inventory(
    products,
    warehouses
)

logging.info("Generating Purchase Orders...")

purchase_orders = generate_purchase_orders(
    inventory,
    suppliers
)

logging.info("Generating Inventory Transactions...")

transactions = generate_inventory_transactions(
    inventory
)

inventory.to_csv(
    OUTPUT_FOLDER / "Inventory.csv",
    index=False
)

purchase_orders.to_csv(
    OUTPUT_FOLDER / "PurchaseOrders.csv",
    index=False
)

transactions.to_csv(
    OUTPUT_FOLDER / "InventoryTransactions.csv",
    index=False
)

logging.info("Finished.")