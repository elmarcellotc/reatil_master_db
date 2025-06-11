# 🚀 SQL Server Docker TODO

---


## FIRST AND MOST IMPORTANT:

- Fix order tree order in master README based in init sql script new version
- Check external apps (external to docker container) can read RetailMasterDB. It may be necessary to create a user with view access.

## ✅ Run Database Tests (with Logs!)

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