default: help

public:  ## build the static content
	hugo
.PHONY: public

serve: public  ## run a development server
	hugo serve -D
.PHONY: serve

resume: content/resume.md  ## build public-facing resume
	make -C ~/src/resume publish

clean:  ## remove all generated files
	rm -rf public
.PHONE: clean

help: ## show this help
	@echo "\nSpecify a command. The choices are:\n"
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[0;36m%-12s\033[m %s\n", $$1, $$2}'
	@echo ""
.PHONY: help
