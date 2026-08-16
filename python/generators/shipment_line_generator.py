import pandas as pd


def generate_shipment_lines(
        shipments,
        sales_lines,
        products):

    weights = (
        products
        .set_index("ProductCode")["Weight"]
        .to_dict()
    )

    shipment_lines = []

    shipment_line_id = 1

    merged = sales_lines.merge(
        shipments,
        on="OrderNumber",
        how="inner"
    )

    for _, row in merged.iterrows():

        freight = round(
            row["Quantity"] *
            weights[row["ProductCode"]] *
            0.22,
            2
        )

        shipment_lines.append({

            "ShipmentLineID": shipment_line_id,

            "ShipmentID": row["ShipmentID"],

            "ProductCode": row["ProductCode"],

            "Quantity": row["Quantity"],

            "FreightCost": freight

        })

        shipment_line_id += 1

    return pd.DataFrame(shipment_lines)