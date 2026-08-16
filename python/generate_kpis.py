import pandas as pd

from config import OUTPUT_FOLDER

from generators.kpi_generator import (
    generate_kpis
)

sales = pd.read_csv(
    OUTPUT_FOLDER / "SalesOrderLines.csv"
)

shipments = pd.read_csv(
    OUTPUT_FOLDER / "Shipments.csv"
)

returns = pd.read_csv(
    OUTPUT_FOLDER / "Returns.csv"
)

kpis = generate_kpis(
    sales,
    shipments,
    returns
)

kpis.to_csv(
    OUTPUT_FOLDER / "ExecutiveKPIs.csv",
    index=False
)