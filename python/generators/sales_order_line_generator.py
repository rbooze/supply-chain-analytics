import random
import pandas as pd


def generate_sales_order_lines(
        orders,
        products,
        min_lines,
        max_lines):

    product_codes = products["ProductCode"].tolist()

    prices = (
        products
        .set_index("ProductCode")["UnitPrice"]
        .to_dict()
    )

    costs = (
        products
        .set_index("ProductCode")["UnitCost"]
        .to_dict()
    )

    weights = (
        products
        .set_index("ProductCode")["Weight"]
        .to_dict()
    )

    rows = []

    line_id = 1

    for _, order in orders.iterrows():

        num_lines = random.randint(
            min_lines,
            max_lines
        )

        selected_products = random.sample(
            product_codes,
            k=min(num_lines, len(product_codes))
        )

        for line_no, product in enumerate(
                selected_products,
                start=1):

            quantity = random.randint(1, 20)

            unit_price = prices[product]

            unit_cost = costs[product]

            sales = round(
                quantity * unit_price,
                2
            )

            cost = round(
                quantity * unit_cost,
                2
            )

            freight = round(
                quantity * weights[product] * 0.18,
                2
            )

            rows.append({

                "SalesLineID": line_id,

                "OrderNumber": order["OrderNumber"],

                "LineNumber": line_no,

                "ProductCode": product,

                "Quantity": quantity,

                "UnitPrice": unit_price,

                "UnitCost": unit_cost,

                "SalesAmount": sales,

                "CostAmount": cost,

                "FreightAmount": freight

            })

            line_id += 1

    return pd.DataFrame(rows)