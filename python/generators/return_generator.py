import random
import pandas as pd


RETURN_REASONS = [
    "Damaged",
    "Wrong Item",
    "Customer Changed Mind",
    "Defective",
    "Shipping Damage"
]


def generate_returns(order_lines,
                     shipments,
                     return_rate):

    shipment_lookup = (
        shipments
        .set_index("OrderNumber")
        .to_dict("index")
    )

    returns = []

    return_id = 1

    for _, row in order_lines.iterrows():

        if random.random() > return_rate:
            continue

        shipment = shipment_lookup[row["OrderNumber"]]

        delivery = pd.to_datetime(
            shipment["DeliveryDate"]
        )

        return_date = delivery + pd.Timedelta(
            days=random.randint(3,30)
        )

        qty = random.randint(
            1,
            row["Quantity"]
        )

        returns.append({

            "ReturnID": return_id,

            "OrderNumber": row["OrderNumber"],

            "ShipmentID": shipment["ShipmentID"],

            "ProductCode": row["ProductCode"],

            "ReturnDate": return_date,

            "QuantityReturned": qty,

            "Reason": random.choice(
                RETURN_REASONS
            )

        })

        return_id += 1

    return pd.DataFrame(returns)