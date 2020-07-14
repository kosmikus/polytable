
%.sty : %.ins %.dtx
	latex $<

%.dvi : %.dtx polytable.sty force
	latex $<

%.pdf : %.dtx polytable.sty force
	pdflatex $<

polytable.tar.gz : polytable.sty polytable.pdf force
	mkdir polytable
	cp README polytable
	cp polytable.dtx polytable
	cp polytable.ins polytable
	cp polytable.pdf polytable
	tar cvzf polytable.tar.gz polytable/*
	rm -rf polytable

release : polytable.tar.gz

force :

.PHONY : force release

