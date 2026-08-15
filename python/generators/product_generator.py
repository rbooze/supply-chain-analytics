import random
import pandas as pd

CATEGORIES = {
    "Electrical": [
        "Electrical Wire",
        "Circuit Breaker",
        "Wall Outlet",
        "Light Switch",
        "Extension Cord"
    ],
    "Power Tools": [
        "Cordless Drill",
        "Impact Driver",
        "Circular Saw",
        "Angle Grinder",
        "Hammer Drill"
    ],
    "Safety": [
        "Safety Glasses",
        "Hard Hat",
        "Safety Vest",
        "Ear Protection",
        "Work Gloves"
    ],
    "HVAC": [
        "Air Filter",
        "Thermostat",
        "Vent Register",
        "Blower Motor",
        "Flexible Duct"
    ],
    "Fasteners": [
        "Wood Screws",
        "Lag Bolts",
        "Hex Nuts",
        "Washers",
        "Concrete Anchors"
    ]
}

CATEGORY_CODES = {
    "Electrical": "ELE",
    "Power Tools": "PWR",
    "Safety": "SAF",
    "HVAC": "HVA",
    "Fasteners": "FAS"
}

BRANDS = [
    "Titan",
    "NorthStar",
    "MasterCraft",
    "SafeGuard",
    "Industrial Plus",
    "Apex",
    "PrimeWorks",
    "ProBuild"
]


def generate_products(num_products, suppliers):

    products = []
    sku_counter = {}

    while len(products) < num_products:

        category = random.choice(list(CATEGORIES.keys()))

        if category not in sku_counter:
            sku_counter[category] = 1

        sku = f"{CATEGORY_CODES[category]}-{sku_counter[category]:04d}"
        sku_counter[category] += 1

        product_name = random.choice(CATEGORIES[category])

        brand = random.choice(BRANDS)

        unit_cost = round(random.uniform(5, 250), 2)

        markup = random.uniform(1.20, 1.60)

        unit_price = round(unit_cost * markup, 2)

        weight = round(random.uniform(0.25, 150.00), 2)

        reorder_point = random.randint(10, 200)

        reorder_quantity = random.choice([25, 50, 75, 100, 250, 500])

        supplier = random.choice(suppliers)

        products.append({
            "ProductCode": sku,
            "ProductName": product_name,
            "Category": category,
            "SubCategory": "",
            "Brand": brand,
            "SupplierCode": supplier,
            "UnitCost": unit_cost,
            "UnitPrice": unit_price,
            "Weight": weight,
            "ReorderPoint": reorder_point,
            "ReorderQuantity": reorder_quantity,
            "IsActive": 1
        })

    return pd.DataFrame(products)