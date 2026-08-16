import pandas as pd

def generate_carriers():

    carriers = [

        ("CAR001","UPS","Ground"),

        ("CAR002","FedEx","Express"),

        ("CAR003","XPO Logistics","LTL"),

        ("CAR004","Old Dominion","LTL"),

        ("CAR005","DHL","International")

    ]

    return pd.DataFrame(

        carriers,

        columns=[

            "CarrierCode",

            "CarrierName",

            "ServiceLevel"

        ]

    )