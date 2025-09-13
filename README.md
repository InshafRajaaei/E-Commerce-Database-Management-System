# E-Commerce-Database-Management-System
Capstone E‑Commerce Management System showcasing full DB lifecycle with MariaDB (SQL), PostgreSQL JSONB (NoSQL), and ArangoDB (Graph). Features normalized schema, transactions, optimizations, and hybrid architecture for real‑world e‑commerce.

# E-Commerce Management System - Database Mini Project

![Database](https://img.shields.io/badge/Database-MariaDB-blue) ![NoSQL](https://img.shields.io/badge/NoSQL-PostgreSQL%20%7C%20ArangoDB-green) ![Status](https://img.shields.io/badge/Status-Completed-brightgreen) ![Group](https://img.shields.io/badge/Group-03_01-orange)

A comprehensive database systems project for the University of Ruhuna's **EE4203/EC4203 Database Systems** module. This project involves the full lifecycle of designing, implementing, and optimizing a relational database for an e-commerce platform, followed by an exploration of NoSQL paradigms using multiple technologies.

## 📋 Project Overview

This project is divided into two main parts:
- **Part A:** A traditional Relational Database System implemented in **MariaDB**.
- **Part B:** An exploration of NoSQL databases, using **PostgreSQL** for a key-value/document store and **ArangoDB** for a graph database.

## 🏗️ Part A: Relational Database (MariaDB)

### Chapter 1: Requirement Analysis
Defined the functional and data requirements for an e-commerce platform, identifying core entities like Customer, Product, Order, and Payment.

### Chapter 2: Conceptual Design
Designed an Entity-Relationship (ER) Diagram featuring:
- 6 Strong Entities (Customer, Product, Category, Order, ShoppingCart, Payment)
- 2 Weak Entities (Address, CartItem)
- Special constructs: Recursive relationship (Category), Multivalued attribute (ProductImage), Composite attribute (Customer Name), Derived attribute (OrderItem.UnitPrice)
- (min, max) notation for all relationship cardinalities.

### Chapter 3: Logical Design & Normalization
Mapped the ER diagram to a relational schema and normalized it to Second Normal Form (2NF), ensuring no partial dependencies.

### Chapter 4: Implementation
Implemented the schema in MariaDB with:
- `CREATE TABLE` statements with all constraints.
- `INSERT` operations to populate all tables with sample data.
- `UPDATE` and `DELETE` operations to demonstrate data manipulation.

### Chapter 5: Transactions
Wrote 20 complex SQL queries:
- **7 Simple Queries:** Select, Project, Cartesian Product, View, Rename, Aggregate, LIKE.
- **13 Complex Queries:** Set operations (Union, Intersection, Difference, Division), Joins (Inner, Natural, Left/Right/Full Outer), and Nested queries.

### Chapter 6: Database Tuning
Improved performance of 10 complex queries by creating strategic indexes. Used the `EXPLAIN` statement to prove the reduction in rows scanned before and after tuning.

## 🍃 Part B: NoSQL Databases

### Chapter 1: Aggregate Model (Key-Value Store in PostgreSQL)
- Used PostgreSQL's `JSONB` data type to model a flexible customer entity.
- Created a table `customer_ee00` (where `00` is the group ID), with an integer `customer_id` as the key and a `customer_data` JSONB column as the value.
- Inserted 10 customer aggregates with varying attributes, demonstrating schema flexibility (e.g., some have `phone`, others have `isVIP` or `orders`).
- The database was dumped using `pg_dump` to generate the complete SQL script for reproducibility.

### Chapter 2: Graph Data Model (ArangoDB)
- Modeled a social network of students using **ArangoDB**, a multi-model database.
- Created a graph with:
  - **10 Nodes** in the `Person` collection, each with a unique `_key` and a `name` property.
  - **15 Edges** in the `FriendssWith` collection, representing friendships.
- Each edge contains properties defining the relationship:
  - `since`: The date the friendship started.
  - `chat_count`: The number of chats exchanged.
  - `common_interests`: A list of shared interests.
- Executed AQL queries to:
  1.  Find all people who are friends with a specific person (e.g., "Alice").
  2.  Find the shortest path between two people in the network (e.g., from "Alice" to "Julia").

## 📁 Repository Structure

- E-Commerce-DB-Project/
  - MariaDB_Schema/
    - 01_schema_creation.sql
    - 02_data_insertion.sql
  - NoSQL_Aggregate/
    - Database_Commands.sql
  - NoSQL_Graph/
    - ENCRYPTION-File
    - knows_....data.json
    - persons_....data.json
    - knows_....structure.json
    - persons_....structure.json
    - dump.json
  - README.md
                     
## 🛠️ Technologies Used

- **Relational DBMS:** MariaDB (MySQL)
- **NoSQL DBMS:** PostgreSQL (with JSONB), ArangoDB
- **Design Tools:** draw.io (for ER Diagrams)
- **Documentation:** Microsoft Word, Markdown

## 👥 Group Information

- **Group ID:** 51
- **Module:** EC4203/EE4203 - Database Systems
- **University:** University of Ruhuna, Faculty of Engineering
- **Department:** Department of Electrical & Information Engineering

## 🔄 How to Use This Repository

1.  **Clone the repo:**
    ```bash
    git clone https://github.com/<your-username>/E-Commerce-DB-Project.git
    ```
2.  **Run the SQL scripts** in the `MariaDB_Schema` folder in sequence within a MariaDB client to recreate the database.
3.  **PostgreSQL Aggregate DB:** Restore the dumped database:
    ```bash
    psql -U postgres -f NoSQL_Aggregate/postgres_dump_customer_ee00.sql
    ```
4.  **ArangoDB Graph DB:** Use the ArangoDB web interface or `arangosh` CLI to run the commands in `arangodb_commands.aql` to recreate the graph and run the queries.

---

*This project was completed as a partial requirement for the Database Systems module at the University of Ruhuna. It showcases a collaborative effort exploring both relational and non-relational database paradigms.*
