from pathlib import Path

# ---------------------------------------------------
# Project Paths
# ---------------------------------------------------

BASE_DIR = Path(__file__).resolve().parent

OUTPUT_FOLDER = BASE_DIR / "output"
OUTPUT_FOLDER.mkdir(exist_ok=True)

# ---------------------------------------------------
# Data Generation Settings
# ---------------------------------------------------

NUM_PRODUCTS = 100
NUM_CUSTOMERS = 500
NUM_SUPPLIERS = 20
NUM_WAREHOUSES = 8
NUM_CARRIERS = 5

START_DATE = "2021-01-01"
END_DATE = "2025-12-31"

# Orders
NUM_ORDERS = 50000
MIN_LINES_PER_ORDER = 1
MAX_LINES_PER_ORDER = 5

# Inventory
DEFAULT_MIN_STOCK = 100
DEFAULT_MAX_STOCK = 500
PURCHASE_LEADTIME_MIN = 3
PURCHASE_LEADTIME_MAX = 21

# ---------------------------------------------------
# Master Data
# ---------------------------------------------------

SUPPLIERS = [
    f"SUP{str(i).zfill(3)}"
    for i in range(1, NUM_SUPPLIERS + 1)
]