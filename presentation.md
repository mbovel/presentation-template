---
title: Towards nicer slides
author: "[Matt Bovel](mailto:matthieu@bovel.net) @[LAMP](https://www.epfl.ch/labs/lamp/)/[LARA](https://lara.epfl.ch/w/), [EPFL](https://www.epfl.ch/fr/)"
---

# Markdown

- Item 1
- Item 2

1. Item 1
2. Item 2

_Emphasis_, __Strong__

# Syntax highlighting

```scala
val a = if true then 0 else 42
transparent inline def hello() = ???
case class Foo(val bar: Int)
extension (o: Object) def baz() = ???
```

(Supports Scala 3 syntax!)

# LaTeX

$$\phi = \frac{a}{b}$$

# Slide break

Can break to the next slide without a new heading using a Markdown section beak:

```
---
```

---

Second part.

# Columns

::: columns

:::: column
Column 1 Content
::::

:::: column
Column 2 Content
::::

:::

# Fragments

::: fragment

First thing

:::

::: fragment

Second thing

:::

# Speaker notes

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

::: notes

This is a note.

To see notes, press the s key, which will start a pop-up window
If it does not work, check if your browser stopped the pop-up

:::
