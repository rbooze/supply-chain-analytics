import logging
import pandas as pd

from config import OUTPUT_FOLDER
from config import RETURN_RATE

from generators.return_generator import (
    generate_returns
)

logging.basicConfig(level=logging.INFO)

order_lines = pd.read_csv(
    OUTPUT_FOLDER / "SalesOrderLines.csv"
)

shipments = pd.read_csv(
    OUTPUT_FOLDER / "Shipments.csv"
)

returns = generate_returns(
    order_lines,
    shipments,
    RETURN_RATE
)

returns.to_csv(
    OUTPUT_FOLDER / "Returns.csv",
    index=False
)

logging.info(
    f"{len(returns):,} Returns Created"
)