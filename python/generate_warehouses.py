import pandas as pd
from pathlib import Path

warehouses = [
    ("ATL", "Atlanta Distribution Center", "Atlanta", "GA", "Southeast", 120000),
    ("CHI", "Chicago Distribution Center", "Chicago", "IL", "Midwest", 150000),
    ("DAL", "Dallas Distribution Center", "Dallas", "TX", "South", 110000),
    ("DEN", "Denver Distribution Center", "Denver", "CO", "Mountain", 90000),
    ("LAX", "Los Angeles Distribution Center", "Los Angeles", "CA", "West", 180000),
    ("MIA", "Miami Distribution Center", "Miami", "FL", "Southeast", 85000),
    ("PHX", "Phoenix Distribution Center", "Phoenix", "AZ", "Southwest", 95000),
    ("SEA", "Seattle Distribution Center", "Seattle", "WA", "Northwest", 100000),
]

df = pd.DataFrame(
    warehouses,
    columns=[
        "WarehouseCode",
        "WarehouseName",
        "City",
        "State",
        "Region",
        "Capacity",
    ],
)

output_dir = Path("output")
output_dir.mkdir(exist_ok=True)

df.to_csv(output_dir / "Warehouses.csv", index=False)

print(f"Created {len(df)} warehouses.")