import logging

from config import OUTPUT_FOLDER
from config import NUM_PRODUCTS
from config import SUPPLIERS

from generators.product_generator import generate_products

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)


def main():

    logging.info("Generating Product Master...")

    df = generate_products(NUM_PRODUCTS, SUPPLIERS)

    output_file = OUTPUT_FOLDER / "Products.csv"

    df.to_csv(output_file, index=False)

    logging.info(f"{len(df)} Products Created")

    logging.info(f"Output File: {output_file}")


if __name__ == "__main__":
    main()