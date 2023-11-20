# Squeak Style Guide

Hier finden Sie sämtliche Dokumentation für den Codestyle des SWA-Projekts von der Gruppe 16 aka. die Programmier Pandas für das Spiel: "SQUEAK IS YOU" 

## Objekte deklarieren

- Objekte initialisiert mit `SIY...`
- Lokale Variablen werden klein geschrieben `lowercase`
- globale Variablen in CAPS  `UPPERCASE`
- private Funktionen `lowercase`
- public Funktionen `UPPERCASE`           



```
| y |
(true or: [false not] or: [nil isNil]) ifFalse: [self halt].
y := self size + super size.
{$a. #a. 'a’. 1. 1.0}
    do: [:each | Transcript
        show: each class name;
        show: each printString;
        show: ' '].
^ x < y
```

## Naming

1. Descriptive Names
2. **Capitilize** Class names, global variables, pool dictionaries and class variables
3. **DON'T** capitilize instance and temp variables, parameters and methods
4. wichtig: Projekt spezifischer Präfix (hier in diesem Projekt `SIY`)
5. Have it make sense in natural Language
    1. `aVehicle hasFourWheels `vs.` aVehicle fourWheels`
6. Use a phrase beginning with a verb for methods that answer a Boolean
7. no magic numbers
8. Spell out identifiers

## Comments

1. quick, helpful comments
2. **Do not comment bad code – rewrite it**
3. always comment what your object/function does (aber Algorithmus sollte auch ohne Kommentar verständlich sein)
    ```
    # BAD
    DataVisualization>>show 
        "Step 1: setup the state“ 
        self data: ...

        "Step 2: display the data“ 
        self addMorph: ... 

    vs.

    # GOOD
    DataVisualization>>show 
        self
            setupState; 
            displayData.

    DataVisualization>>setupState 
        self data: ...
    ```
4. **Use keyword `TODO` to indicate unfertige Funktionen**
5. Use comments to highlight code that is unusual

## Code Formatting

2. Use the general template for a method
    ```
    messageSelectorAndArgumentNames
        "comment stating purpose of message"

        | temporary variable names | 
        statements
    ```
3. Employ a **consistent spacing** around messages and delimiters
4. Employ at least one blank before and after a binary selector

    `answer := (3 + 4 * 36) >= (32 + x).  `vs.` answer:=(3+4*36)>=(32+x).`

5. Leave spaces around @ (when both receiver and argument are positive integers) 

    `10 @ 235 `vs.` 10@235`

6. Leave at least one blank before a left parenthesis and after a right parenthesis

    `#((2 3) (3 4) (4 5)) `vs.` #((2 3)(3 4)(4 5))`

7. Leave at least one blank after but not before a comma (,), a semicolon (;), and a colon (:) in a selector

    `value between: top and: bottom `vs.` value between:top and:bottom`

8. Indent, align nested continuation lines **consistently**

9. Do not break a short expression across lines
10. Use indentation to delineate the logical nesting and match the alternative cases
11. To reflect control flow, indent blocks that follow iteration messages
12. Break up long key word messages over multiple lines to avoid line wraps
13. Choose one way to align brackets in blocks and use it consistently
14. Use a cascade instead of repeating the receiver, even when the receiver is self
15. In a cascaded message, separate the receiver from the message
16. Separate cascaded long keyword messages with a blank line or further indent
17. Start each statement on a new line
18. If a binary or Boolean expression will not fit on a single line, break it up
19. Use a blank line to separate sections of code in a long method
20. Limit source code line length to 60 characters or the window width
21. Use extra parenthesis to simplify the reading of a complicated expression
 