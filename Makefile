ifneq ($(notdir $(CURDIR)),presentation-202405)
	$(error current directory is not 'presentation-202405')
endif

FILE_NAME := presentation.md

.PHONY: generate export-html export-pdf export-pptx export release-%

prepare:
	sudo apt-get -y install chromium/stable-security
	npm i

serve:
	npx marp ./ --theme src/academic.css --server

generate:
	npx marp src/$(FILE_NAME) -o index.html --theme src/academic.css

export-html:
	npx marp src/$(FILE_NAME) -o dist/output.html --theme src/academic.css

export-pdf:
	npx marp  src/$(FILE_NAME) -o dist/output.pdf --theme src/academic.css

export-pptx:
	npx marp src/$(FILE_NAME) -o dist/output.pptx --theme src/academic.css

export: export-html export-pdf export-pptx

release-%: export
	$(eval VERSION := $(subst release-,,$@))
	git tag -a $(VERSION) -m "Release $(VERSION)"
	git push origin $(VERSION)
	gh release create $(VERSION) dist/output.pdf dist/output.pptx dist/output.html -t $(VERSION) --generate-notes
