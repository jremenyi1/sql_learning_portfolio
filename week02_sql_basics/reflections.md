# Week 02 Reflection — SQL Basics

This week was about getting comfortable with the core mechanics of SQL and,
more importantly, understanding why databases are used instead of spreadsheets
once data grows or becomes shared.

Working in Oracle APEX helped make this concrete. Small changes in a query
often led to very different results, which made it clear that SQL rewards
careful thinking rather than trial-and-error guessing.

---

## What I Learned

### SQL vs Excel

Excel is still useful for quick checks and small datasets, but its limits are
easy to hit. As soon as data grows, gets shared, or needs to be reused
consistently, spreadsheets become fragile.

SQL databases handle these situations much better. The structure is explicit,
rules can be enforced, and the same query always produces the same result.
That reliability is the main difference.

---

### Arithmetic and Operator Precedence

This week made it obvious that SQL is not just about retrieving data.
It is also about getting the logic right.

Adding a value before applying tax produces a different result than doing it
the other way around. The only way to make intent clear is to use brackets.
Once I started doing that consistently, the queries became easier to read and
much easier to reason about.

---

### Filtering with WHERE

I practised filtering data using `LIKE`, comparisons, ranges, sets, and
`NULL` checks. What stood out is how precise SQL can be when conditions are
written carefully.

This also highlighted how easy it is to return the wrong data if conditions
are slightly off.

---

### Data Quality

Poor data quality undermines everything else. Missing values, duplicates, or
inconsistent formats can quietly break queries without throwing errors.

For small datasets, Excel can be enough for cleaning. For larger datasets,
tools like Python are clearly more appropriate.

---

## Challenges

Accessing Oracle APEX took longer than expected at the start of the week.
Not being able to see the required tables slowed things down, but it also felt
realistic. Setup issues are part of working with real systems.

Once access was fixed, the SQL itself was manageable.

---

## Key Points from This Week

- SQL is more reliable than Excel for structured, shared data.
- Calculation order matters, and brackets make intent explicit.
- Clean data is a prerequisite for meaningful results.

---

## What I’ll Focus on Next

I want to get faster at writing queries without needing to second-guess
basic syntax. More practice combining filtering and calculations should help.

Overall, this week felt like laying foundations. Early-stage, but solid.