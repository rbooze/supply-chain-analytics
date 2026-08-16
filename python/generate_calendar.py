import logging

from config import START_DATE
from config import END_DATE
from config import OUTPUT_FOLDER

from generators.calendar_generator import generate_calendar

logging.basicConfig(level=logging.INFO)

logging.info("Generating Calendar...")

df = generate_calendar(START_DATE, END_DATE)

df.to_csv(OUTPUT_FOLDER / "Calendar.csv", index=False)

logging.info("Calendar.csv created.")