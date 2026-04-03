# 📊 VendasDB — Análise de Dados com Álgebra Relacional & SQL

## 🎓 Projeto Académico | Engenharia Informática (3º Ano)

Sistema completo de análise de dados de vendas utilizando **Álgebra Relacional** e sua equivalência prática em **SQL Server** e **MySQL**.

---

## 🚀 Tecnologias Utilizadas

![SQL Server](https://img.shields.io/badge/SQL_Server-CC2927?logo=microsoftsqlserver&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=white)
![Database](https://img.shields.io/badge/Database-Relational-blue)
![Algebra](https://img.shields.io/badge/Algebra-Relational-green)

---

## 📌 Objetivo

Demonstrar a relação entre:

- 📐 **Álgebra Relacional (Teoria)**
- 💾 **SQL (Prática)**
- ⚙️ **Execução em dois SGBDs diferentes**

---

## 🧠 Conceitos Aplicados

- Seleção (σ)
- Projeção (π)
- Junção (⨝)
- Diferença (-)
- Divisão (÷)
- Agregação (SUM, COUNT)
- Normalização (3FN)

---

## 🗄️ Estrutura da Base de Dados

### 📊 Tabelas

- **Clientes**
- **Produtos**
- **Vendas**
- **DetalhesVenda**

### 🔗 Relacionamentos

Clientes (1) ─── (N) Vendas
Vendas (1) ─── (N) DetalhesVenda
Produtos (1) ─── (N) DetalhesVenda


---

## ⚙️ Funcionalidades do Projeto

✔ Criação completa da base de dados (DDL)  
✔ Inserção de dados reais simulados (DML)  
✔ Consultas avançadas em Álgebra Relacional  
✔ Implementação equivalente em SQL  
✔ Comparação entre SQL Server e MySQL  

---

## 🔍 Consultas Implementadas

### 1️⃣ Clientes que compraram em Lisboa
- Filtro + Junção

### 2️⃣ Produtos Eletrónicos > 100€
- Seleção simples

### 3️⃣ Clientes e produtos comprados
- Múltiplas junções

### 4️⃣ Clientes que compraram TODOS os livros
- ⚠️ Divisão Relacional (avançado)

### 5️⃣ Total gasto por cliente
- Agregação (SUM + GROUP BY)

### 6️⃣ Produtos nunca vendidos
- Diferença de conjuntos

### 7️⃣ Clientes com +5 produtos diferentes
- COUNT DISTINCT + HAVING

---

## ⚖️ SQL Server vs MySQL

| Funcionalidade | SQL Server | MySQL |
|------|--------|--------|
| Diferença de conjuntos | `EXCEPT` | `NOT IN / LEFT JOIN` |
| Limite | `TOP` | `LIMIT` |
| Auto incremento | `IDENTITY` | `AUTO_INCREMENT` |
| Agregação de strings | `STRING_AGG` | `GROUP_CONCAT` |

---

## 🧠 Aprendizados

- SQL é baseado diretamente na Álgebra Relacional  
- Nem todas operações têm equivalente direto (ex: divisão)  
- Cada SGBD tem diferenças importantes  
- Saber teoria = escrever SQL melhor 🚀  

---


---

## 👥 Equipa

- Alípio Joaquim Zambo  
- Domingas Ernesto Francisco Rocha  
- Dulce Rita Manuel Gonçalves  
- **Mendes Eduardo Gouveia Manuel** ⭐  
- Nsimba Alberto Ndosi  

---

## 🎓 Instituição

**Universidade Kimpa Vita**  
Curso: Engenharia Informática  

---

## 📌 Conclusão

Este projeto demonstra como:

👉 A teoria (Álgebra Relacional)  
👉 Se transforma em prática (SQL)  
👉 E é executada em sistemas reais  

---

## 🧾 Licença

MIT

---

## 💡 Extra

Se gostaste do projeto, deixa uma ⭐ no repositório 😉

