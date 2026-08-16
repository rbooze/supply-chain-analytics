import logging

from generators.supplier_generator import generate_suppliers
from config import OUTPUT_FOLDER

logging.basicConfig(level=logging.INFO)

logging.info("Generating Suppliers...")

df = generate_suppliers()

df.to_csv(OUTPUT_FOLDER / "Suppliers.csv", index=False)

logging.info("Suppliers.csv created.")