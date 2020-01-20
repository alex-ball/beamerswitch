# beamerswitch: Convenient mode selection in Beamer documents

This class is a wrapper around the [beamer](http://ctan.org/pkg/beamer) class to
make it easier to use the same document to generate the different forms of the
presentation: the slides themselves, an abbreviated slide set for transparencies
or online reference, an n-up handout version, and a transcript or set of notes
using the `article` class.

## Installation

### Dependencies

To compile the documentation you will need to have the
[minted](http://ctan.org/pkg/minted) package working, which in turn relies on
Python 2.6+ and Pygments. See the documentation of that package for details.

There is an example file that demonstrates the features of the class. The class
itself depends only on packages easily available through TeX distributions and
CTAN. One feature relies on [latexmk](http://ctan.org/pkg/latexmk) though you
can work around that if you have the patience.

Note that the zip file on the
[Releases](https://github.com/alex-ball/beamerswitch/releases) page on GitHub
contains all the files you need, pre-compiled. You can also avoid the hassle by
installing the class from your TeX distribution's package manager.

### Managed way

The latest stable release of the beamerswitch class has been packaged for
TeX Live and MiKTeX. If you are running TeX Live and have `tlmgr`
installed, you can install the package simply by running
`tlmgr install beamerswitch`. If you are running MiKTeX, you can install the
package by running `mpm --install=beamerswitch`. Both `tlmgr` and `mpm` have
GUI versions that you might find friendlier.

### Automated way

A makefile is provided which you can use with the Make utility:

  * Running `make beamerswitch.cls` just generates the class file (and a few
    others).
  * Running `make` generates the class file and documentation.
  * Running `make inst` generates and installs the files to your home TeX tree.
    (To undo, run `make uninst`.)
  * Running `make install` generates and installs the files to the local TeX
    tree. (To undo, run `make uninstall`.)
  * Running `make clean` removes auxiliary files from the working directory.
  * Running `make distclean` removes the generated from the working directory
    files as well.

### Manual way

To install the class from scratch, follow these instructions. If you have
downloaded the zip file from the [Releases] page on GitHub, you can skip the
first three steps.

 1. Run `tex beamerswitch.dtx` to generate the class file and the example file
    `beamerswitch-example.tex`. (You can safely skip this step if you are
    confident about step 2.)

 2. Compile `beamerswitch.dtx` with your favourite version of LaTeX with shell
    escape enabled (as required by `minted` for typesetting the listings). You
    will also need to run it through `makeindex`. This will generate the main
    documentation (DVI or PDF).

 3. Compile `beamerswitch-example.tex` with your favourite version of LaTeX. If
    you enable shell escape and have `latexmk` installed you will end up with
    another four documents (DVI or PDF). Otherwise you will get one.

 4. To install the files, create the following folders in your chosen TeX tree
    and copy the files across as shown (read `.pdf` as `.dvi` if that is what
    you generated):
      - `source/latex/beamerswitch`:
        `beamerswitch.dtx`,
        (`beamerswitch.ins`)
      - `tex/latex/beamerswitch`:
        `beamerswitch.cls`
      - `doc/latex/beamerswitch`:
        `beamerswitch.pdf`,
        `beamerswitch-example.tex`,
        `beamerswitch-example.pdf`,
        `beamerswitch-example-article.pdf`,
        `beamerswitch-example-handout.pdf`,
        `beamerswitch-example-trans.pdf`

 5. You may then have to update your installation's file name database
    before TeX and friends can see the files.

## Licence

Copyright 2016–2020 Alex Ball.

This work consists of the file beamerswitch.dtx and a Makefile.

This work may be distributed and/or modified under the conditions of the
[LaTeX Project Public License (LPPL)](http://www.latex-project.org/lppl.txt),
either version 1.3c of this license or (at your option) any later version.

This work is "maintained" (as per LPPL maintenance status) by
[Alex Ball](http://alexball.me.uk/).

