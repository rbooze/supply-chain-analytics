import random
import pandas as pd
from datetime import timedelta


def generate_purchase_orders(inventory,
                             suppliers):

    supplier_codes = suppliers["SupplierCode"].tolist()

    purchase_orders = []

    po = 1

    for _, row in inventory.iterrows():

        available = (
            row["QuantityOnHand"]
            - row["QuantityAllocated"]
        )

        if available < row["ReorderPoint"]:

            supplier = random.choice(supplier_codes)

            lead = random.randint(3, 21)

            purchase_orders.append({

                "PONumber": f"PO{po:06}",

                "SupplierCode": supplier,

                "ProductCode": row["ProductCode"],

                "WarehouseCode": row["WarehouseCode"],

                "QuantityOrdered": row["ReorderQuantity"],

                "LeadTimeDays": lead

            })

            po += 1

    return pd.DataFrame(purchase_orders)