default: help

public:  content/resume.html  ## build the static content
	hugo

serve: public  ## run a development server
	hugo serve -D
.PHONY: serve

resume: content/resume.html ## build public-facing resume

# NB depends on resume being checked out at a certain location
content/resume.html: ../../resume/resume-public.html
	make -C ../../resume resume-public.html && cp $< $@

help: ## show this help
	@echo "\nSpecify a command. The choices are:\n"
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[0;36m%-12s\033[m %s\n", $$1, $$2}'
	@echo ""
.PHONY: help
