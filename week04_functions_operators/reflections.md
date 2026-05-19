# Week 04 Reflection — Functions and Operators

This week pushed me beyond filtering data and into changing it directly inside
queries. Instead of just selecting rows, I started shaping the output itself.
That shift made me think more carefully about what each query is actually doing.

---

## What I Learned

### Using Functions

Functions made it clear that SQL can handle a lot of data cleaning on its own.
Formatting names, adjusting numbers, and creating calculated columns all felt
more efficient than fixing results after the fact.

Seeing clean output straight from the query was a good confidence boost.

---

### Expressions and Precedence

Once calculations and conditions were combined, brackets became essential.
I ran into cases where the logic technically worked, but not in the way I
intended.

Adding brackets early made the intent obvious and saved time debugging later.

---

### Sorting Calculated Results

Sorting on calculated fields helped reinforce the order SQL works in.
Once I saw that calculations are resolved before `ORDER BY` runs, the results
made much more sense.

This made my queries feel closer to proper reports rather than raw data pulls.

---

## Challenges

The main challenge was keeping queries readable as they grew longer.
Long expressions can get messy quickly.

Breaking lines clearly and using sensible aliases made a big difference.

---

## Key Points from This Week

- SQL can clean and format data, not just retrieve it.
- Brackets are critical once logic becomes more complex.
- Clear aliases make queries easier to read and easier to trust.

---

## What I’ll Focus on Next

I want to get more comfortable combining filtering, functions, and sorting in
one query without losing clarity.

This week felt like another step away from trial-and-error SQL and toward
writing queries I actually understand and trust.