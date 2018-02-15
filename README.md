Rackham Thesis
==============

A class file for a Rackham (University of Michigan) thesis.
This file is a modification of [`rac.sty`](http://clasp.engin.umich.edu/pages/current/dissertation-template), which can be found in a number of different locations.
This class file attempts to make it as easy as possible to write a thesis that conforms to the Rackham style guidelines, however users are advised be aware of and follow the [currently published guidelines](http://www.rackham.umich.edu/current-students/dissertation/the-dissertation).


Usage
-----

Simply include this class with `\documentclass{rackham-thesis}`.
`biblatex` is enforced over `natbib` to make sure references conform to rackham style.

This class supports two options:

- `doublespace` : Double space the document instead of one and a half spacing.
   As of last observation, either we valid style.
- `proposal` : Changes the title page to reflect a proposal instead of a thesis.

Every other option will be passed to the base class `report`, e.g. `twoside`.

[`main.txt`](main.txt) is an example file that details how to specify some of the front matter.


Todo
----

- Add support for list of Abbreviations, List of Acronyms, and List of Symbols
- Support for natbib and straight bibliography instead of just biblatex.
- Privatize all internal macros with `@`'s.
- Support printing bib after every section
- Indent list of appendices to match other lists
- Fix frontispiece to handle line breaks better.
- Remove bookmark page number from unnumbered pages.
	This should be possible by making every page up to TOC check if page number set, and set it to 2 if not.
- Make sure that in twoside front matter is properly aligned. (\cleardoublepage)
- Add locale for acknowledgments vs acknowledgements
- There's a lot of redundancy in the way things are defined, that should be removed.
- All newpages should probably be clearpage, and there should be no support for two column / cleardoublepage
- Should front matter sections be environments instead of "start" commands?
- Ideally force all manditory sections in proper orders and error if not provided, including lists like list of appendices 

Acknowledgments
---------------

This class file was mostly put together before I edited it, I could not find a license attached to any version.
Most of my changes were to make it more simple to use and conform to standard latex conventions.
The header from the original `rac.sty` is reproduced here to give credit to everyone who put effort into this file.

- Modified on 05/19/88, jj.
- Modified on 12/13/88, for "CHAPTER" in toc and `\@makecaption`, jj.
- Modified on 01/08/89, for sections in loap (look for `\@sect`), jj.
- Modified on 89/11/29  by tex
  - Removed the last three lines of file which consisted of `<blank line>`
  - `Get something else`
  - `\input indent`
- Modified on 07/24/1992 by Roque D. Oliveira.
  - `\startappendices` was modified to work
  - with the New Font Selection Scheme.
  - Further (similar) changes may be needed for other macros.
- Modified Sep. 2008 by Jason Gilbert: Obsolete code removed or updated to better conform to LaTeX2e
  - list of abbreviations added 
  - made copyright page cleaner
  - fixed Appendices, Bibliography, margins, title page, frontispiece, bottom-center page numbers, two-side printing,
  - added in-dissertation abstract and abstract that prints separately at the end.
