import pandas as pd


def generate_inventory_transactions(
        inventory):

    rows = []

    trans = 1

    for _, row in inventory.iterrows():

        rows.append({

            "TransactionID": trans,

            "WarehouseCode": row["WarehouseCode"],

            "ProductCode": row["ProductCode"],

            "TransactionType": "Beginning Balance",

            "Quantity": row["QuantityOnHand"]

        })

        trans += 1

    return pd.DataFrame(rows)