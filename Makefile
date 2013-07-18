
%.sty : %.ins %.dtx
	latex $<

%.dvi : %.dtx polytable.sty force
	latex $<

%.pdf : %.dtx polytable.sty force
	pdflatex $<

release : force polytable.pdf
	mkdir polytable
	cp polytable.dtx polytable
	cp polytable.ins polytable
	cp polytable.pdf polytable
	cp README        polytable
	tar cvzf polytable.tar.gz polytable/*

force :

.PHONY : force

