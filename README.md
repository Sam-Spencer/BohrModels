![Bohr Model banner image](https://github.com/Sam-Spencer/BohrModels/blob/master/Banner.png?raw=true)

# Bohr Models
Generate Bohr Models for elements of the Periodic Table using SpriteKit.

### How it Works
Currently, the program uses a publicly available data set from WikiCommons (last updated / checked on July 30, 2017) that has been parsed and reformatted. This data set is then used to draw the apprpriate number of orbitals, each with the correct number of elections, around the nucleus. These drawings and animations are achieved via SpriteKit.

### Future Implementation Goals
Eventually, I would like to write an algorithm that calculates (at run-time) the correct number of orbitals and electrons for each atom -- rather than pulling from a data set.

Nuclei should be drawn with the correct atomic symbol.

The models should be interactive (more than just play / pause functionality); so one can move, tap, zoom, and interact with them. Additionally, it may be worthwhile to color-code electrons or their energy levels.
