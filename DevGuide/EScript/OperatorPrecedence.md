# Operator precendence

The following table summarizes the operator precendence from highest (0) to lowest (22).

| Precendence | Operator | Description | Associativity |
| ----- | ----- | ----- | ----- |
| 0 | `@` | | Right |
| 1 | `.`<br>`[ ]`<br>`( )` | Member access<br>Indexing<br>Function call | Left |
| 2 | `new` | Create new instance | Left |
| 3 | `fn` | Function definition | Right |
| 4 | `++`<br>`--`<br>(unary) `-`<br>`~`<br>`!` | Increment<br>Decrement<br>Unary minus<br>Bitwise not<br>Logical not | Right |
| 5 | `*` `/` | Multiplication and Division | Left |
| 6 | `%` | Modulo | Left |
| 7 | `+` `-` | Addition and Subtraction | Left |
| 8 | `<<` `>>` | Left and Right shift | Left |
| 9 | `<` `>` `<=` `>=` `~=` | Relational operators | Left |
| 10 | `==` `!=` `===` `!==` <br> <code>---&#124;></code> <br> `->` | Relational operators<br>Inheritance test<br>Object binder | Left |
| 11 | `=>` | Parameter binder | Left |
| 12 | `&` | Bitwise and | Left |
| 13 | `^` | Bitwise xor | Left |
| 14 | <code>&#124;</code> | Bitwise or | Left |
| 15 | `&&` | Logical and | Right |
| 16 | <code>&#124;&#124;</code> | Logical or | Right |
| 17 | `?:` | Ternary operator `a?b:c` | Right |
| 18 | `=` | Assignment | Right |
| 19 | `:=` | Attribute declaration | Right |
| 20 | `::=`<br><code>*= /= %= += -= &= ^= &#124;=</code> | Type attribute declaration<br>Compound assignments | Right |
| 21 | `...` | Varargs | Left |
| 22 | `,` | Comma | Left |
