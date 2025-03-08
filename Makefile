CLEAN_LATEX = rm -f *.out *.bbl *.bcf *.blg *.flt *.fdb_* *.log *.aux *.fls *run.xml *.snm *.synctex.gz *.toc *.vrb *.nav
BUILD_LATEX = which latexmk &>/dev/null && latexmk -silent -pdf $<

all: $(thesis.tex)
	$(BUILD_LATEX)

clean:
	$(CLEAN_LATEX)
