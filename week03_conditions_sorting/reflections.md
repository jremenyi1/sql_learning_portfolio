# Week 03 Reflection — Conditions and Sorting

This week pushed me to think more carefully about query logic rather than just
syntax. Most of the SQL I wrote was technically correct, but not always
logically correct on the first attempt.

Seeing that difference was the main lesson.

---

## What I Learned

### Limiting Results

Using `LIMIT` is simple, but very useful. It makes it easier to explore tables
and test queries without being overwhelmed by output.

I found it most helpful when combined with `ORDER BY`, especially when checking
whether sorting logic behaves as expected.

---

### Logical Conditions and Precedence

This was the most important part of the week.

SQL evaluates `AND` before `OR`, which can easily lead to unintended results.
I ran several queries that looked reasonable but returned the wrong rows until
I added brackets.

From now on, I plan to use brackets whenever conditions are combined, even if
they are not strictly required. The clarity is worth it.

---

### Sorting Results

Sorting data made query outputs much easier to read and interpret.
Ordering by multiple columns helped reinforce the idea that SQL results are not
inherently ordered unless explicitly told to be.

---

## Challenges

The main challenge was understanding *why* a query returned unexpected results.
Once I slowed down and stepped through the logic carefully, the behaviour made
sense.

This reinforced the idea that SQL requires the same kind of discipline as
experimental design: assumptions need to be explicit.

---

## Key Points from This Week

- `LIMIT` is useful for safe and focused query testing.
- Logical operator precedence matters more than it first appears.
- Brackets improve both correctness and readability.

---

## What I’ll Focus on Next

I want to become more confident reading complex `WHERE` clauses and spotting
logic issues before running a query.

This week felt like a turning point from “writing SQL that works” to “writing
SQL I actually trust.”