# 📈 Lumiere Capital Investments: Automated Investment Pipeline

An enterprise-grade data orchestration pipeline built to automate financial analytics. This project integrates **Polars** for high-performance data manipulation, **Databricks** for scalable cloud compute, and **Apache Airflow 3.0** for sophisticated workflow management.

---

## 🏗️ Architecture
The pipeline follows a modern "Medallion" architecture pattern:
1.  **Ingestion**: Market data is ingested into Databricks via cloud-native connectors.
2.  **Processing (Polars)**: High-speed transformation and alpha-signal generation using Polars' lazy evaluation engine.
3.  **Orchestration (Airflow 3.0)**: A containerized DAG manages the end-to-end lifecycle, handling retries, dependencies, and scheduling.

---

## 🛠️ Tech Stack
* **Language**: Python 3.12+
* **Data Engine**: [Polars](https://pola.rs/) (Optimized for vectorized operations)
* **Compute**: [Databricks](https://www.databricks.com/) (All-Purpose Clusters)
* **Orchestration**: [Apache Airflow 3.0](https://airflow.apache.org/) (via Astro CLI)

---

## 🔧 Setup & Installation

### 1. Initialize Astro Project
This project utilizes the **Astro CLI** to manage the Airflow environment. 
```bash
# Create project directory
mkdir lumiere_capital-orchestrator && cd lumiere_capital-orchestrator

# Initialize Astro project structure
astro dev init
