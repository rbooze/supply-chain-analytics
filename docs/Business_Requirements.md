# Supply Chain Analytics Platform

## Business Requirements Document

**Project:** Supply Chain Analytics Platform

**Version:** 1.0

**Author:** Rodney Booze

**Date:** August 2026

---

# Executive Summary

NorthStar Distribution requires an enterprise analytics platform that provides a single source of truth for supply chain operations. The current reporting process relies on multiple operational systems and manually generated Excel reports, resulting in inconsistent metrics, delayed decision-making, and limited visibility into supply chain performance.

The objective of this project is to design and develop an interactive Power BI solution that integrates operational data into a centralized analytics platform, enabling executives and managers to monitor key performance indicators, identify operational risks, and make informed business decisions.

---

# Business Problem

Current reporting suffers from several challenges:

- Multiple versions of the truth
- Manual Excel reporting
- Limited visibility into supplier performance
- Inventory stockouts and excess inventory
- Inconsistent delivery performance
- Difficulty identifying bottlenecks
- Slow executive reporting

---

# Project Objectives

The Supply Chain Analytics Platform will:

- Consolidate data from multiple source systems
- Provide a centralized reporting solution
- Improve inventory visibility
- Monitor supplier performance
- Track warehouse efficiency
- Improve delivery performance
- Reduce manual reporting
- Enable data-driven decision making

---

# Stakeholders

## Executive Leadership

- CEO
- COO
- CFO

Needs:
- Executive KPIs
- Trends
- Strategic insights

---

## Supply Chain Managers

Needs:
- Inventory analysis
- Warehouse performance
- Supplier analysis
- Operational metrics

---

## Procurement Team

Needs:
- Supplier scorecards
- Purchase order analysis
- Lead time monitoring

---

## Warehouse Managers

Needs:
- Inventory levels
- Fulfillment performance
- Stockouts
- Daily operational metrics

---

# Source Systems

| System | Refresh |
|---------|----------|
| ERP | Nightly |
| Warehouse Management System | Every 15 Minutes |
| Transportation Management System | Hourly |
| Supplier Portal | Every 4 Hours |
| Finance System | Nightly |

---

# Key Business Questions

- Which products are at risk of stockout?
- Which suppliers are underperforming?
- Which warehouses are most efficient?
- What is our on-time delivery rate?
- Where are shipping delays occurring?
- How much inventory do we have?
- Which products are overstocked?
- How is supply chain performance changing over time?

---

# Executive KPIs

- Total Orders
- Inventory Value
- Inventory Turnover
- Stockout Rate
- Average Lead Time
- On-Time Delivery %
- Order Fill Rate
- Average Fulfillment Time
- Supplier Performance Score
- Transportation Cost
- Inventory Days on Hand

---

# Success Criteria

The project will be considered successful if:

- Executives can identify operational issues within one minute.
- Managers can drill into warehouse and supplier performance.
- Reports refresh automatically.
- Data is trusted across departments.
- Manual Excel reporting is significantly reduced.

---

# Assumptions

- Source systems provide reliable data.
- Daily and intraday refresh schedules are maintained.
- Business definitions for KPIs are agreed upon.
- Historical data is available for trend analysis.

---

# Constraints

- Initial project uses sample data.
- Future versions will integrate live operational systems.
- Security and row-level access will be added in later phases.