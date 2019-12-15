# Build the PDF / HTML using ascii-doctor

# Wiki pages to render
ifndef PAGES:
	PAGES:=Netzwerk-Setup
endif


world: dist

dist: $(addprefix dist/,$(PAGES))

docs.wiki/Home.asciidoc:
	git clone https://github.com/FieldTracks/docs.wiki.git

dist/%: docs.wiki/Home.asciidoc
	mkdir -p dist/html/$*
	mkdir -p dist/pdf/$*
	asciidoctor -b html5 docs.wiki/$*.asciidoc -D dist/html
	#asciidoctor-pdf docs.wiki/$*.asciidoc -D dist/pdf/$*

clean:
	rm -rf dist
	rm -rf docs.wiki

.PHONY: world dist/% clean dist
