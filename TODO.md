# 🚀 SQL Server Docker TODO

---

## 🛠️ 1. Initialize the Database

- Start up the SQL Server container. A command guide must be added to README.md
- Load the initial schema and seed data if necessary.
- Confirm that the DB is ready for testing ✅.

---

## ✅ 2. Run Database Tests (with Logs!)

> 🎯 All tests must generate a **log file or test result output** — no silent passes!

### 🧪 Unit Testing
- Test individual components like stored procedures, functions, and triggers.

### 🔗 Integration Testing
- Verify that database components work together as expected.

### 🧱 Data Integrity Testing
- Test foreign keys, constraints, and triggers to ensure they protect the data correctly.

### 🔐 Security Testing
- Validate permissions, access control, and test against SQL injection or unauthorized actions.

🧰 *Make these tests repeatable and automatable via scripts!*

---

## 📝 3. Document the `06_event_registry` Folder

- 🗃️ **Word Doc**: Explain table structures, relationships, business logic.
- 🎞️ **PowerPoint**: Create a visual overview (e.g., schema diagrams or flowcharts).

📌 Keep it clean and readable — future you (or teammates) will thank you!

---

💡 *Tip: Consider using tools like dbdiagram.io or SQL Power Architect for schema visuals.*

