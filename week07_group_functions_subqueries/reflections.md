# Week 07 Reflection — Group Functions and Subqueries

This week pushed me to think beyond filtering rows and towards reasoning about
data as a whole. Many of the queries I wrote worked syntactically, but did not
always express the logic I intended on the first attempt.

Realising that difference was the main lesson.

---

## What I Learned

### Working with Aggregates

Group functions changed how I approach SQL problems. Instead of asking
“which rows match?”, I started asking “what does this data look like when it is
summarised?”

Understanding when to use `WHERE` versus `HAVING` was especially important, as
they operate at different stages of the query.

---

### Subqueries and Evaluation Order

This was the most important part of the week.

Subqueries forced me to slow down and think about evaluation order and intent.
I learned that single-row and multiple-row subqueries require different
operators, and that correlated subqueries are evaluated once per row.

Seeing how `NOT IN` behaves when null values are present helped explain several
unexpected results.

---

### Choosing Safer Patterns

Using `EXISTS` felt more reliable than `IN` or `NOT IN` in many cases.
It made the intent of the query clearer and avoided subtle null-related issues.

This reinforced the idea that clarity is often more important than brevity.

---

## Challenges

The main challenge was predicting query results *before* running them.
Unexpected outcomes usually came from null handling or misunderstanding when
parts of the query were evaluated.

Stepping through the logic carefully made those behaviours easier to understand.

---

## Key Points from This Week

- Aggregate functions answer questions about groups, not individual rows
- `WHERE` and `HAVING` are applied at different stages of a query
- Subqueries often answer one question before another
- Correct SQL can still be logically wrong

---

## What I’ll Focus on Next

I want to get better at recognising when a subquery is needed and when a join
would be clearer.

This week felt like another step towards writing SQL that I trust, not just SQL
that runs.