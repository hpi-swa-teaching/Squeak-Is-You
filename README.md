# Squeak Style Guide

Hier finden Sie sämtliche Dokumentation für den Codestyle des SWA-Projekts von der Gruppe 16 aka. die Programmier Pandas für das Spiel: "SQUEAK IS YOU" 

## Beispiel für schönen Code

```smalltalk
| y |

(true or: [false not] or: [nil isNil]) ifFalse: [self halt].

y := self size + super size.

{$a . #a . 'a’ . 1 . 1,0}
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
    
        aVehicle hasFourWheels `VS.` aVehicle fourWheels
6. Use a phrase beginning with a verb for methods that answer a Boolean
7. __NO__ magic numbers => put them in variables
8. Spell out identifiers
9. Avoid the parameter type or name in the method name
    
        fileSystem at: aKey put: aFile
        VS. 
        fileSystem atKey: aKey putFile: aFile

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

        answer := (3 + 4 * 36) >= (32 + x).  `vs.` answer:=(3+4*36)>=(32+x).

5. Leave spaces around @ (when both receiver and argument are positive integers) 

        10 @ 235 `vs.` 10@235

6. Leave at least one blank before a left parenthesis and after a right parenthesis

        #((2 3) (3 4) (4 5)) `VS.` #((2 3)(3 4)(4 5))

7. Leave at least one blank after but not before a comma (,), a semicolon (;), and a colon (:) in a selector

        value between: top and: bottom `VS.` value between:top and:bottom

8. Indent, align nested continuation lines **consistently**

9. **Embrace Oneliners** and avoid to break them across lines
10.     Use 
            INDENTATION
                für Abgrenzung im logischen Fluss 
12. **AVOID** line wraps
13. Choose one way to align brackets in blocks and use it consistently (TODO)

14. Use a cascade instead of repeating the receiver, even when the receiver is self
    ```smalltalk
    self
        label: self model label;
        minimumSize: 35 @ 7;
        when: #reactive perform: #reactiveWindow:; yourself 
    VS.
    self label: self model label.
    self minimumSize: 35 @ 7.
    self when: #reactive perform: #reactiveWindow:.
    ```
17.         NEW LINES 
            for ever 
            new statement

20. **60 Character** Code Line Width (Window Width)

## Reuse
1. Functions every Method needs:
        
        #open (if it opens a window)
        #execute (if it executes a window)
        #initialize and #new (check if/how a superclass already implements those)
        #close (if superclass requires it)
2. Write small methods
3. For each variable defined by a class, define two accessor methods

             name
                ^ name
             name: aString 
                name := aString.
4. Use inheritance to organize classes with similar behavior

