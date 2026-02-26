SRC_DIR = .
DIST_DIR = dist
TEX_FILES = $(wildcard *.tex)
PDF_FILES = $(patsubst %.tex,$(DIST_DIR)/%.pdf,$(TEX_FILES))

.PHONY: all clean pdf

all: pdf

pdf: $(PDF_FILES)

$(DIST_DIR)/%.pdf: %.tex
	@echo "Compiling $< to $@"
	if not exist "$(DIST_DIR)" mkdir "$(DIST_DIR)"
	xelatex -output-directory=$(DIST_DIR) $<

clean:
	@echo "Cleaning up generated files..."
	if exist "$(DIST_DIR)" ( \
		cd $(DIST_DIR) && \
		del /Q *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind \
	)
