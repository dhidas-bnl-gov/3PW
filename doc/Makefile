CC = latex


all: 3PW_Controls.pdf



%.dvi : %.tex
	$(CC) $< && $(CC) $< 

%.ps : %.dvi
	dvips $< -o $@
#	dvips $< -o $@ && gv $@

%.pdf : %.ps
	ps2pdf $< && open $@





clean:
	rm -r -f *.aux *.dvi *.log *.out *.pdf *.ps *.blg *.bbl *.cls
