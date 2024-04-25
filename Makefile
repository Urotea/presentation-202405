ifneq ($(notdir $(CURDIR)),presentation-202405)
	$(error current directory is not 'presentation-202405')
endif

FILE_NAME := test.md

.PHONY: generate export-html export-pdf export-pptx export

generate:
	docker run --rm -v $(PWD):/home/marp/app/ -e LANG=$(LANG) marpteam/marp-cli src/$(FILE_NAME) -o docs/index.html

export-html:
	docker run --rm -v $(PWD):/home/marp/app/ -e LANG=$(LANG) marpteam/marp-cli src/$(FILE_NAME) -o dist/output.html

export-pdf:
	docker run --rm --init -v $(PWD):/home/marp/app/ -e LANG=$(LANG) marpteam/marp-cli src/$(FILE_NAME) -o dist/output.pdf

export-pptx:
	docker run --rm --init -v $(PWD):/home/marp/app/ -e LANG=$(LANG) marpteam/marp-cli src/$(FILE_NAME) -o dist/output.pptx

export: export-html export-pdf export-pptx
