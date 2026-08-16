import pandas as pd


def generate_kpis(
    sales_lines,
    shipments,
    returns
):

    total_sales = sales_lines["SalesAmount"].sum()

    total_cost = sales_lines["CostAmount"].sum()

    gross_profit = total_sales - total_cost

    freight = sales_lines["FreightAmount"].sum()

    on_time = (
        (~shipments["LateDelivery"])
        .mean() * 100
    )

    return_rate = (
        len(returns)
        / len(sales_lines)
        * 100
    )

    return pd.DataFrame([{

        "TotalSales": round(total_sales,2),

        "TotalCost": round(total_cost,2),

        "GrossProfit": round(gross_profit,2),

        "FreightCost": round(freight,2),

        "OnTimeDeliveryPercent":
            round(on_time,2),

        "ReturnRate":
            round(return_rate,2)

    }])