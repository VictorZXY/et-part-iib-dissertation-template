# A LaTeX template for the Cambridge Economics Tripos Part IIB dissertation

## User Guide

### Compile the LaTeX document

A LaTeX editor such as [TeXstudio](https://www.texstudio.org/) or [Texmaker](https://www.xm1math.net/texmaker/), or an online LaTeX editor such as [Overleaf](https://www.overleaf.com/), enables you to compile a LaTeX document by simply clicking a button. To build a PDF document `diss.pdf` from the LaTeX source file `diss.tex` in the command line (Linux/macOS/Windows), use the following command:

    pdflatex diss

Then, the bibliography can be generated from `refs.bib` using the following command:

    bibtex diss

Finally, to ensure all the page numbering is correct, you need to run

    pdflatex diss

again until the auxiliary file `diss.aux` does not change. This usually takes 2 more runs.

### Word count

An approximate word count of the body of the dissertation may be obtained using:

    wc diss.tex

Alternatively, try something like:

    detex diss.tex | tr -cd '0-9A-Z a-z\n' | wc -w

### The makefile

I have also made a `makefile` for you to simplify the calls to `pdflatex` and `bibtex`, which provides the following facilities:

To display help information, run:
    
    make

To build a PDF document from `diss.tex`, run:
    
    make diss.pdf

or

    make all

To display an estimate of the word count, run:

    make count

To delete all intermediate files except the source files and the resulting PDFs, run:

    make clean
    
To delete all files, including the resulting PDFs, but except the source files, run:

    make distclean
