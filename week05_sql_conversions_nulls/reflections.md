# Week 05 Reflection — Conversion Functions and NULL Handling

This week focused on data conversion and handling missing values in SQL.

The main shift for me was understanding how often real data needs cleaning
before it can be used properly in calculations or reporting.

Most of the work came down to choosing the right function for the situation,
not just writing correct syntax.

---

## What I Learned

### Conversion Functions

`TO_CHAR`, `TO_NUMBER`, and `TO_DATE` are mainly about making data usable.

I used `TO_CHAR` to format dates and numbers so they are readable in reports.
I used `TO_NUMBER` when working with numeric values stored as text.
`TO_DATE` helped when working with string-based dates that needed proper
conversion before filtering or calculations.

The key point is that SQL will not fix inconsistent data automatically.

---

### NULL Handling

This was the most important part of the week.

I used `NVL`, `NVL2`, `COALESCE`, and `NULLIF` to deal with missing values.

Each one behaves slightly differently:

- `NVL` replaces NULL with a fixed value
- `NVL2` changes output depending on whether a value exists
- `COALESCE` returns the first available value
- `NULLIF` helps prevent errors by turning matching values into NULL

The biggest takeaway is that NULL is not just "empty" — it changes how queries
behave if you don’t handle it properly.

---

### CASE vs DECODE

I already knew both exist, but this week made the difference clearer.

`CASE` is easier to read and works in more situations.
`DECODE` is shorter, but more limited and harder to follow.

In practice, I now default to `CASE` unless I’m working with older Oracle code.

---

## Challenges

The main issue this week was knowing which function to use in each scenario.

For example, `NVL`, `COALESCE`, and `NVL2` can solve similar problems, but not
in the same way.

I had to slow down and think about what the data was doing before picking a
function, rather than just relying on syntax patterns.

---

## Key Points from This Week

- Conversion functions are essential for clean and consistent data
- NULL values can change query results if ignored
- `CASE` is usually safer and clearer than `DECODE`
- The hardest part is choosing the right function, not writing it

---

## What I’ll Focus on Next

I want to get faster at deciding which function fits a problem.

Right now I understand what each function does, but I still pause too long when
choosing between them in real queries.

Next week I want to focus on combining conversion functions with conditional
logic more naturally, instead of treating them as separate concepts.