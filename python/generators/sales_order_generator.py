import random
import pandas as pd


def generate_sales_orders(customers,
                          calendar,
                          num_orders):

    customer_codes = customers["CustomerCode"].tolist()
    calendar_dates = calendar["CalendarDate"].tolist()

    orders = []

    for i in range(1, num_orders + 1):

        order_number = f"SO{i:07}"

        order_date = random.choice(calendar_dates)

        customer = random.choice(customer_codes)

        orders.append({

            "OrderNumber": order_number,

            "OrderDate": order_date,

            "CustomerCode": customer

        })

    return pd.DataFrame(orders)