PDF_TARGETS =
ifneq ("$(wildcard paper.tex)","")
	PDF_TARGETS+=paper.pdf
endif
ifneq ("$(wildcard poster.tex)","")
	PDF_TARGETS+=poster.pdf
endif
TEX_SRCS := $(patsubst %pdf,%tex,$(PDF_TARGETS))
BIB_SRCS := $(wildcard *.bib)
OTH_SRCS := $(wildcard *.tex) $(wildcard *.sty) $(wildcard *.bst) $(wildcard img/*)

LATEXMK_PDFLATEX_CMD = pdflatex -file-line-error -interaction=errorstopmode -synctex=1
LATEXMK_CE_OPTS = '$$cleanup_includes_cusdep_generated=1;'

.PHONY: clean cleanall

$(PDF_TARGETS): %.pdf:%.tex $(TEX_SRCS) $(BIB_SRCS) $(OTH_SRCS)
	latexmk -pdf -pdflatex="$(LATEXMK_PDFLATEX_CMD)" -use-make -bibtex $<

clean:
	latexmk -c -bibtex -e $(LATEXMK_CE_OPTS)
	rm $(patsubst %pdf,%synctex.gz,$(PDF_TARGETS)) || true
	rm $(patsubst %pdf,%nav,$(PDF_TARGETS)) || true
	rm $(patsubst %pdf,%snm,$(PDF_TARGETS)) || true

cleanall:
	latexmk -C -bibtex -e $(LATEXMK_CE_OPTS)
