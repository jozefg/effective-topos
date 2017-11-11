NOTES=small-complete-categories

all: $(NOTES:=.pdf)

%.pdf:
	cd $* && latexmk -pdf main.tex && cp main.pdf ../$@

clean:
	-@ rm -f *.pdf
	@for dir in $(NOTES); do \
		cd $$dir && rm -rf auto *.aux *.log *.pdf *.bbl *.blg *.fls && cd ..; \
	done

.PHONY: clean all
