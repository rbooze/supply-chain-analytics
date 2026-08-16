import random
import pandas as pd


def generate_inventory(products, warehouses):

    inventory = []

    for _, product in products.iterrows():

        for _, warehouse in warehouses.iterrows():

            qty = random.randint(100, 500)

            inventory.append({

                "WarehouseCode": warehouse["WarehouseCode"],

                "ProductCode": product["ProductCode"],

                "QuantityOnHand": qty,

                "QuantityAllocated": random.randint(0, 20),

                "ReorderPoint": product["ReorderPoint"],

                "ReorderQuantity": product["ReorderQuantity"]

            })

    return pd.DataFrame(inventory)