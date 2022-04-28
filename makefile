# This is the makefile for the Part IIB demonstration dissertation
#
# Note that continuation lines require '\' and
# that a TAB character preceeds any shell command line

.DELETE_ON_ERROR:

# Rules for building LaTeX documents (see Unix Tools course)
%.pdf %.aux %.idx: %.tex
	pdflatex -halt-on-error $<
	while grep 'Rerun to get ' $*.log ; do pdflatex $< ; done
%.ind: %.idx
	makeindex $*
%.bbl: %.aux
	bibtex $*
# Rules for exporting xfig diagrams into PDF or EPS
%.pdf: %.eps
	epstopdf --outfile=$@ $<
%.eps: %.fig
	fig2dev -L eps $< $@
%.pdftex %.pdftex_t: %.fig
	fig2dev -L pdftex_t -p $*.pdftex $< $*.pdftex_t
	fig2dev -L pdftex $< $*.pdftex

help:
	@echo
	@echo "USAGE:"
	@echo
	@echo "make                display help information"
	@echo "make diss.pdf       format the dissertation as PDF"
	@echo "make all            same as make diss.pdf"
	@echo "make count          display an estimated word count"
	@echo "make clean          delete all intermediate files"
	@echo

diss.pdf: makefile.txt diss.bbl

makefile.txt: makefile
	expand makefile >makefile.txt

all: diss.pdf

count:
	detex diss.tex | tr -cd '0-9A-Za-z \n' | wc -w

clean:
	rm -f *.aux *.log *.err *.out
	rm -f *~ *.lof *.lot *.toc *.blg *.bbl
	rm -f *.synctex *.synctex\(busy\) *.synctex.gz *.synctex.gz\(busy\)
	rm -f makefile.txt

distclean: clean
	rm -f figs/*.pdf diss.pdf
