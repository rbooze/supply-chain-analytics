from faker import Faker
import pandas as pd
import random

fake = Faker()

INDUSTRIES = [

    "Construction",

    "Manufacturing",

    "Healthcare",

    "Retail",

    "Education",

    "Government"

]

SEGMENTS = [

    "Small",

    "Medium",

    "Enterprise"

]


def generate_customers(count):

    customers = []

    for i in range(1, count + 1):

        customers.append({

            "CustomerCode": f"CUST{i:05}",

            "CustomerName": fake.company(),

            "City": fake.city(),

            "State": fake.state_abbr(),

            "Industry": random.choice(INDUSTRIES),

            "Segment": random.choice(SEGMENTS),

            "CreditLimit": random.choice([10000,25000,50000,100000]),

            "RiskScore": random.randint(1,100)

        })

    return pd.DataFrame(customers)