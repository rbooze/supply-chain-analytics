import random
import pandas as pd

COUNTRIES = [
    "United States",
    "Canada",
    "Mexico"
]

SUPPLIER_NAMES = [
    "Acme Industrial",
    "Global Supply",
    "Titan Components",
    "NorthStar Manufacturing",
    "Precision Parts",
    "Prime Distribution",
    "Rapid Industrial",
    "Summit Supply",
    "Atlas Products",
    "Pioneer Manufacturing",
    "Metro Components",
    "Liberty Industrial",
    "Vertex Manufacturing",
    "Blue Ridge Supply",
    "Evergreen Products",
    "IronWorks Inc.",
    "Keystone Industrial",
    "Continental Supply",
    "Apex Manufacturing",
    "Industrial Plus"
]


def generate_suppliers():

    suppliers = []

    for i, name in enumerate(SUPPLIER_NAMES, start=1):

        suppliers.append({

            "SupplierCode": f"SUP{i:03}",

            "SupplierName": name,

            "Country": random.choice(COUNTRIES),

            "LeadTimeDays": random.randint(3, 21),

            "Rating": round(random.uniform(3.5, 5.0), 2)

        })

    return pd.DataFrame(suppliers)