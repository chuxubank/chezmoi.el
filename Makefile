EMACS ?= emacs
POLY_PATH ?= ../poly-any-template
GO_TEMPLATE_PATH ?= ../go-template-ts-mode
LOAD_PATH = -L . -L test -L $(POLY_PATH) -L $(GO_TEMPLATE_PATH)
SOURCES = chezmoi-core.el chezmoi-template.el chezmoi.el

.PHONY: compile test clean

compile:
	$(EMACS) -Q --batch $(LOAD_PATH) \
		--eval "(setq byte-compile-error-on-warn t)" \
		-f batch-byte-compile $(SOURCES)

test:
	$(EMACS) -Q --batch $(LOAD_PATH) \
		-l chezmoi-test \
		-f ert-run-tests-batch-and-exit

clean:
	find . -name '*.elc' -delete
