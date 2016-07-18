# beamerticle: Convenient mode selection in Beamer documents

This class is a wrapper around the `beamer` class to make it easier to use the
same document to generate the different forms of the presentation: the slides
themselves, an abbreviated slide set for transparencies or online reference,
an n-up handout version, but most significantly a transcript or set of notes
using the `article` class.

## Installation

### Dependencies

To compile the documentation you will need to have the `minted` package working,
which in turn relies on Python 2.6+ and Pygments. See the documentation of that
package for details.

There is an example file that demonstrates the features of the class.
The class itself depends only on packages easily available through TeX
distributions and CTAN. One feature relies on `latexmk` though you could work
around that if you have the patience.

Note that the zip file on the [Releases] page on GitHub contains all the files
you need, pre-compiled.

[Releases]: https://github.com/alex-ball/beamerticle/releases

### Automated way

A makefile is provided which you can use with the Make utility:

  * Running `make` generates the class file and documentation.
  * Running `make inst` installs the files to your home TeX tree.
  * Running `make install` installs the files to the local TeX tree.
  * Running `make uninst` uninstalls the files to your home TeX tree.
  * Running `make uninstall` uninstalls the files to the local TeX tree.

### Manual way

To install the class from scratch, follow these instructions. If you have
downloaded the zip file from the [Releases] page on GitHub, you can skip the
first two steps.

 1. Process `beamerticle.dtx` with your favourite version of LaTeX with shell
    escape enabled (as required by `minted` for typesetting the listings). You
    will also need to run it through `makeindex`. This will generate the class
    file and the main documentation (DVI or PDF), plus an example file
    `beamerticle-example.tex`.

 2. Process `beamerticle-example.tex` with your favourite version of LaTeX. If
    you enable shell escape and have `latexmk` installed you will end up with
    another four documents (DVI or PDF). Otherwise you will get one.

 3. To install the files, create the following folders in your chosen TeX tree
    and copy the files across as shown (read `.pdf` as `.dvi` if that is what
    you generated):

     * `source/latex/beamerticle`:
       `beamerticle.dtx`,
       (`beamerticle.ins`)
     * `tex/latex/beamerticle`:
       `beamerticle.cls`
     * `doc/latex/beamerticle`:
       `beamerticle.pdf`,
       `beamerticle-example.tex`,
       `beamerticle-example.pdf`,
       `beamerticle-example-article.pdf`,
       `beamerticle-example-handout.pdf`,
       `beamerticle-example-trans.pdf`

## Licence

This work consists of the file beamerticle.dtx and a Makefile.

This work may be distributed and/or modified under the conditions of the
[LaTeX Project Public License (LPPL)](http://www.latex-project.org/lppl.txt),
either version 1.3c of this license or (at your option) any later version.

This work is "maintained" (as per LPPL maintenance status) by
[Alex Ball](http://alexball.me.uk/).

