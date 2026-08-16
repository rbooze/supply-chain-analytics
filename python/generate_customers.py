import logging

from config import NUM_CUSTOMERS
from config import OUTPUT_FOLDER

from generators.customer_generator import generate_customers

logging.basicConfig(level=logging.INFO)

logging.info("Generating Customers...")

df = generate_customers(NUM_CUSTOMERS)

df.to_csv(OUTPUT_FOLDER / "Customers.csv", index=False)

logging.info("Customers.csv created.")