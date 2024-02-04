<p align="center">
  <img width="400" src="https://github.com/hpi-swa-teaching/Squeak-Is-You/assets/42419545/605daf41-c927-4034-b4f0-c0898657c731#gh-dark-mode-only" alt="Squeak Is You">
  <img width="400" src="https://github.com/hpi-swa-teaching/Squeak-Is-You/assets/42419545/02a561ef-3a5c-46f1-8008-2e6f39c601e6#gh-light-mode-only" alt="Squeak Is You">
  <p align="center"><i>A puzzle game about changing the rules (Baba Is You clone)</i></p>
</p>

## Installing ⚙️

1. Download the newest version of _Squeak Is You_ on the [releases page](https://github.com/hpi-swa-teaching/Squeak-Is-You/releases/).
2. Drag and drop the `.sar`-file into your Squeak image, then select `install SAR`.

## How To Play 🎮

To start the game in fullscreen, open a workspace and run `SIYGame start`. If you don't want to run the game in fullscreen, run `SIYGame startWithScale: 1.0` instead.

| **Key**              | **Function**                     |
| -------------------- | -------------------------------- |
| `WASD` or Arrow Keys | move _isYou_-blocks              |
| `Z`                  | undo                             |
| `R`                  | restart level                    |
| `K` / `L`            | previous / next level            |
| `M`                  | mute music / sound               |
| `ESC`                | exit game _(only in fullscreen)_ |

## Hints & Solutions 💡

If you get stuck on a level, take a look at [Baba Is Hint](https://www.keyofw.com/baba-is-hint), which aims to give hints as spoiler-free as possible.

Check out the [Baba Is You Wiki](https://babaiswiki.fandom.com/wiki/Baba_Is_You_Wiki). It contains solutions for all levels and explains exactly how all rule blocks work.

## Build Your Own Levels 🛠️

The game is compatible with the Morph Halo: Blocks can be duplicated, deleted and moved via the Halo. Combined with the `Playground` level (which contains all implemented blocks) this feature can be used for level prototyping and experimenting.

## Trailer 🎥

https://github.com/hpi-swa-teaching/Squeak-Is-You/assets/42419545/4d05f14e-b786-4f25-aa96-f56b38821758

## Screenshots 🖼️

<p float="left" align="center">
  <img src="https://github.com/hpi-swa-teaching/Squeak-Is-You/assets/42419545/83759be3-790d-4ce9-a034-7cb1b147d7b5" width="40%"> 
  <img src="https://github.com/hpi-swa-teaching/Squeak-Is-You/assets/42419545/5624723b-a308-45e6-9978-a8fce518c948" width="40%"> 
  <img src="https://github.com/hpi-swa-teaching/Squeak-Is-You/assets/42419545/8f27a51a-0678-4647-bf3a-ef793b5caaf5" width="40%"> 
  <img src="https://github.com/hpi-swa-teaching/Squeak-Is-You/assets/42419545/4d6ff56a-646d-42c3-b461-fe2938a865fe" width="40%">
</p>

## License 🔑

**_Squeak Is You_ is based on [Baba Is You](https://www.hempuli.com/baba/) by Hempuli (Arvi Teikari).** We have the permission from the original author to publish this project for educational purposes. More information can be found in the [LICENSE.md](LICENSE.md).
ot before a comma (,), a semicolon (;), and a colon (:) in a selector

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
