# 📦 RetailMasterDB – SQL Server in Docker

Welcome to **RetailMasterDB** – a containerized Microsoft SQL Server 2022 setup for managing and testing a retail-focused database system.

This project provides a reproducible environment for development, testing, and documentation of SQL Server schema and data operations using **Docker**. Ideal for database developers who want clean automation, structured testing, and version-controlled scripts. 👨‍💻🧪

---

## 🐳 SQL Server Setup in Docker

- **Base Image**: `ubuntu:24.04`
- **Edition**: Developer (Free, full-featured for dev/testing)
- **Port**: `1433` exposed locally
- **Initialization**:
  - SQL scripts from `/init-db` are auto-run at container start
  - Waits 15 seconds before executing `99_master_init.sql` to ensure DB is ready
- **Data Persistence**:
  - Mounted volume `./data` ensures DB state survives restarts

You can configure environment variables like the `SA_PASSWORD` through the `.env` file for security and flexibility.

## 🛠️ **Docker Commands for RetailMasterDB**:

🚧 Build the Docker Container

```bash
docker-compose up --build
```

🏗️ Initialize the Already Built Container

```bash
docker-compose up
```

To acces to the docker terminal
```bash
docker exec -it RetailMasterDB bash
```

To get out from the docker terminal, use Cntrl+P and then Cntrl+Q

🛑 Stop the Running Container

```bash
docker-compose down
```

🧼 Remove the Container (But Keep Files)

```bash
docker rm -f RetailMasterDB
```

📋 Check Running Containers

```bash
docker ps
```

🧠 View Logs
```bash
docker logs -f RetailMasterDB
```

---

## 📁 Project Folder Structure

```text
RetailMasterDB/
│
├── Dockerfile # Docker image definition using SQL Server 2022
│
├── .env # Environment variables (e.g. SA_PASSWORD)
│
├── docker-compose.yml # Docker Compose setup with volumes & startup script
│
├── scripts/ # Docker Compose setup with volumes & startup script
│ ├── install.sh # Install MySQL server and setup tables
│ └── init.sh    # Initialize MySQL server 
│
├── data/ # 📦 Persistent database data (mounted volume)
│ └── ...
│
├── init-db/ # 🛠️ SQL scripts to initialize the database
│ ├── ...
│ └── 99_master_init.sql # Entry point for DB initialization
│
├── test/ # 🧪 All test definitions in .sql format
│ └── ...
│
├── test-logs/ # 🧾 Output folder for logs and test results
│ └── ...
│
├── TODO.md # ✅ Development checklist and notes
│
└── README.md # 📘 You are here!
```
## 🗂️ Database Initialization Structure

```text
init-db/
│
├── 00_create_database.sql                      # 🎯 Creates the RetailMasterDB instance
│
├── 01_core_tables/                             # 🧱 Core entity definitions
│   ├── 01_items.sql
│   ├── 02_locations.sql
│   ├── 03_employing_categories.sql
│   ├── 04_building_types.sql
│   ├── 05_building_type_stock_capacity.sql
│   └── 06_building_type_minimum_employees.sql
│
├── 02_business_entities/                       # 🏢 Stores & Warehouses
│   ├── 01_stores.sql
│   ├── 02_store_prices.sql
│   ├── 03_store_workers.sql
│   ├── 04_warehouses.sql
│   ├── 05_warehouse_prices.sql
│   ├── 06_warehouse_min_sell_qty.sql
│   ├── 07_warehouse_workers.sql
│   ├── 08_warehouse_stores.sql
│   └── 09_workplaces.sql
│
├── 03_stock_tables/                            # 📦 Inventory tracking
│   ├── 01_store_stock.sql
│   └── 02_warehouse_stock.sql
│
├── 04_payroll/                                 # 💰 Payroll data
│   └── 01_payroll.sql
│
├── 05_triggers/                                # 🔄 Data synchronization triggers
│   ├── 01_store_to_workplaces.sql
│   └── 02_warehouse_to_workplaces.sql
│
├── 06_event_registry/                          # 🧾 Event logging and snapshots
│   ├── 01_store_sales.sql
│   ├── 02_store_snapshots.sql
│   ├── 03_store_inventory_snapshots.sql
│   ├── 04_store_acquisitions_events.sql
│   └── 05_store_acquisitions_items.sql
│
└── 99_master_init.sql                          # 🏁 Final entry point for init sequence
```

## 🧪 Structure of the Test Scripts
```text
test/
│
├── unit/                                     # 🧱 Unit tests (validate individual components)
│   ├── 01_test_employing_categories.sql
│   └── ...
│
├── integration/                              # 🔗 Integration tests (cross-table relationships)
│   └── test_store_to_warehouse_links.sql
│
├── integrity/                                # 🔐 Data integrity checks
│   └── check_foreign_keys.sql
│
└── run_all_tests.sh                          # 🚀 Shell script to run all tests sequentially
```
## 📄 Structure of the Test Logs

```text
test-logs/
│
├── unit/                                     # 🧾 Logs for unit test results
│
├── integration/                              # 🧾 Logs for integration test results
│
├── integrity/                                # 🧾 Logs for data integrity validations
│
└── secutiry/                                 #  🛡️
```