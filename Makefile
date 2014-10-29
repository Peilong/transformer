FIGURES = 

STY = elsarticle.cls

filename=elsevier14

all:	$(filename).pdf
	
$(filename).dvi:	$(filename).tex \
	abstract.tex \
	intro.tex \
	arch.tex \
	transacc.tex \
	algorithm.tex \
	knapsack.tex \
	related.tex \
	experiments.tex \
	conclusion.tex\
	reference.bib
	latex $(filename)
	bibtex $(filename)
	latex $(filename)
	latex $(filename)

$(filename).pdf:	$(filename).dvi
	dvips -f -tletter -Ppdf -G0 $(filename) > $(filename).ps
	ps2pdf -dEmbedAllFonts=true -dSubsetFonts=true -dEPSCrop=true $(filename).ps $(filename).pdf


clean:
	rm -f *.ps *.spl *.dvi *.aux *.log elsevier14.pdf *.bbl *.blg *.out *~
