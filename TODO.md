# 🚀 RetailMasterDB TODO

---

## 🐍 ETL Tasks

### 🔴 Populate Empty Tables (Highest Priority)

1. **Fill `StoreInventorySnapshot` table**

   * Implement ETL logic to populate the `StoreInventorySnapshot` table
   * Export result to:

    ```
    tests/Inventory/InventorySnapshot.txt
    ```

2. **Populate all remaining empty tables**

   * Identify empty tables from MySQL
   * Create corresponding ETL functions
   * Follow the existing ETL pattern:

   ```
   update_<table_name>_table()
   ```

   * Export outputs to the `tests/` directory

3. **Verify ETL population order**

   ```
   Core Tables
   → Infrastructure Tables
   → Operational Tables
   ```

---

## 🗄️ MySQL Tasks

### 📂 Rebuild MySQL Directory Tree

Update the **MySQL directory structure** so it matches the **current database schema and ETL order**.

Expected structure example:

```
mysql/
├── init
├── core_tables
├── infrastructure_tables
└── operational_tables
```

Ensure:

* SQL scripts follow the correct dependency order
* Initialization scripts reflect the current schema
* The structure matches the ETL execution order

---

## 🧪 Testing Tasks

### 🧱 Data Integrity Testing

* Validate:

  * Foreign keys
  * Constraints
  * Trigger behavior

### 🔗 Integration Testing

* Verify that:

  * ETL correctly populates the database
  * Tables reference each other correctly
  * `Payroll` records link to valid workplaces

### 🧪 Unit Testing

* Test individual database components:

  * Stored procedures
  * Functions
  * Triggers

### 🔐 Security Testing

* Validate:

  * Database permissions
  * Access control
  * Protection against unauthorized writes

All tests must produce **logs or exported outputs**.