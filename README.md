<p align="center">
  <img width="400" src="assets/squeak-is-you-logo-darkmode.png#gh-dark-mode-only" alt="Squeak Is You">
  <img width="400" src="assets/squeak-is-you-logo-lightmode.png#gh-light-mode-only" alt="Squeak Is You">
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
  <img src="assets/screenshot-2.png" width="40%"> 
  <img src="assets/screenshot-3.png" width="40%"> 
  <img src="assets/screenshot-4.png" width="40%"> 
  <img src="assets/screenshot-1.png" width="40%">
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
