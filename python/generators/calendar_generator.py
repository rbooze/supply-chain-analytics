import pandas as pd


def generate_calendar(start_date, end_date):

    dates = pd.date_range(start=start_date, end=end_date)

    df = pd.DataFrame()

    df["CalendarDate"] = dates

    df["DateKey"] = df["CalendarDate"].dt.strftime("%Y%m%d").astype(int)

    df["Year"] = df["CalendarDate"].dt.year

    df["Quarter"] = df["CalendarDate"].dt.quarter

    df["Month"] = df["CalendarDate"].dt.month

    df["MonthName"] = df["CalendarDate"].dt.month_name()

    df["Week"] = df["CalendarDate"].dt.isocalendar().week

    df["Day"] = df["CalendarDate"].dt.day

    df["DayName"] = df["CalendarDate"].dt.day_name()

    df["Weekend"] = df["CalendarDate"].dt.dayofweek >= 5

    return df