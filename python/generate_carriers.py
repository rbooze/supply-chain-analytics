import logging

from generators.carrier_generator import generate_carriers
from config import OUTPUT_FOLDER

logging.basicConfig(level=logging.INFO)

logging.info("Generating Carriers...")

df = generate_carriers()

df.to_csv(OUTPUT_FOLDER / "Carriers.csv", index=False)

logging.info("Carriers.csv created.")