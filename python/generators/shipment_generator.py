import random
import pandas as pd


def generate_shipments(
    orders,
    carriers,
    warehouses
):

    carrier_codes = carriers["CarrierCode"].tolist()
    warehouse_codes = warehouses["WarehouseCode"].tolist()

    shipments = []

    shipment_id = 1

    for _, order in orders.iterrows():

        ship_date = pd.to_datetime(order["OrderDate"])

        warehouse = random.choice(warehouse_codes)

        carrier = random.choice(carrier_codes)

        transit_days = random.randint(1, 8)

        weather_delay = False
        late_delivery = False

        if random.random() < 0.03:

            transit_days += random.randint(2,5)
            weather_delay = True

        elif random.random() < 0.08:

            transit_days += random.randint(1,3)
            late_delivery = True

        delivery_date = ship_date + pd.Timedelta(days=transit_days)

        shipments.append({

            "ShipmentID": shipment_id,

            "OrderNumber": order["OrderNumber"],

            "WarehouseCode": warehouse,

            "CarrierCode": carrier,

            "ShipDate": ship_date,

            "DeliveryDate": delivery_date,

            "TransitDays": transit_days,

            "WeatherDelay": weather_delay,

            "LateDelivery": late_delivery

        })

        shipment_id += 1

    return pd.DataFrame(shipments)