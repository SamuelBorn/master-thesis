all: $(thesis.tex)
	latexmk -silent -pdf $<

clean:
	rm -f *.out *.bbl *.bcf *.blg *.flt *.fdb_* *.log *.aux *.fls *run.xml *.snm *.synctex.gz *.toc *.vrb *.nav
