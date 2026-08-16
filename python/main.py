import subprocess
import sys

scripts = [

    "generate_warehouses.py",

    "generate_suppliers.py",

    "generate_carriers.py",

    "generate_products.py",

    "generate_customers.py",

    "generate_calendar.py",

    "generate_sales.py",

    "generate_inventory.py",

    "generate_shipments.py",

    "generate_returns.py",

    "generate_kpis.py"

]

for script in scripts:

    print("=" * 60)

    print(f"Running {script}")

    subprocess.run(
        [sys.executable, script],
        check=True
    )

print("=" * 60)

print("COMPLETE!")