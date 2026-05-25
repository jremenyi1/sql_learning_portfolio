# Conversion and NULL Handling — Notes

![SQL](https://img.shields.io/badge/SQL-Functions-blue)
![Oracle APEX](https://img.shields.io/badge/Oracle-APEX-red)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Level](https://img.shields.io/badge/SCQF-Level%207-lightgrey)

These notes cover SQL conversion functions, NULL handling, and conditional logic from Week 5. The focus is on writing reliable queries that handle messy data properly.

---

## Why Conversion and NULL Handling Matters

Real-world data is rarely clean.

You’ll often deal with:
- numbers stored as text
- inconsistent date formats
- missing values (NULLs)

Without explicit handling:
- calculations fail or return errors
- filters behave inconsistently
- reports become unreliable

SQL conversion and NULL functions keep results consistent and predictable.

---

## Conversion Functions

### TO_CHAR

Converts numbers or dates into text for display and reporting.

Common uses:
- formatting dates
- improving report readability
- controlling numeric output

```sql
TO_CHAR(SYSDATE, 'YYYY-MM-DD')
TO_CHAR(12345.678, '99999.99')
TO_CHAR(1500, 'L9,999')
```

---

### TO_NUMBER

Converts text into numeric values for calculations.

```sql
TO_NUMBER('12345')
TO_NUMBER('12,345', '99,999')
```

---

### TO_DATE

Converts text into a proper DATE type.

```sql
TO_DATE('2026-03-03', 'YYYY-MM-DD')
TO_DATE('03/03/26', 'DD/MM/RR')
```

---

### NULL Handling

NULL means missing or unknown data. It is not zero, not an empty string, and not a value you can compare directly.

#### NVL

Replaces NULL with a fallback value.

```sql
NVL(salary, 0)
NVL(end_date, SYSDATE)
```

---

#### NVL2

Returns different values depending on NULL status.

```sql
NVL2(commission, salary + commission, salary)
```

---

#### COALESCE

Returns the first non-NULL value.

```sql
COALESCE(phone_work, phone_home, phone_mobile, 'N/A')
```

---

#### NULLIF

Returns NULL when two values are equal.

```sql
NULLIF(bonus, 0)
```

Common use case:

```sql
salary / NULLIF(hours_worked, 0)
```

---

### Conditional Logic

#### CASE

Standard SQL way to apply conditions.

##### Simple CASE

```sql
CASE status
    WHEN 'A' THEN 'Active'
    WHEN 'I' THEN 'Inactive'
    ELSE 'Unknown'
END
```

---

##### Searched CASE

```sql
CASE
    WHEN salary > 100000 THEN 'High'
    WHEN salary BETWEEN 50000 AND 100000 THEN 'Medium'
    ELSE 'Low'
END
```

---

#### DECODE (Oracle-specific)

Used for simple equality checks.

```sql
DECODE(status,
    'A', 'Active',
    'I', 'Inactive',
    'Unknown')
```

---

## Key Notes

- Oracle-specific function: DECODE
- Works only with equality comparisons
- NULL = NULL is treated as TRUE in DECODE (unlike standard SQL)