.PHONY: merlin allbuild dirbuild alltest allclean dirclean

SHELL := /bin/bash

DIRS=$(wildcard blatt*)
BLD=_build
TDIR=$(dir $(TF))

merlin:
	@rm -f .merlin
	@echo "PKG ppx_deriving.std kaputt batteries" > .merlin
	@echo "B +threads" >> .merlin
	@for blatt in $(DIRS); do \
		echo "S $$blatt" >> .merlin; \
		echo "B _build/$$blatt" >> .merlin; \
	done

allbuild: merlin
	@echo "build start"
	@source .ocamlrc && for blatt in $(DIRS); do make -f $$blatt/makefile build; done; echo "build end"

dirbuild: merlin
	@echo "build start"
	@source .ocamlrc && make -f $(TDIR)/makefile build; echo "build end"

alltest:
	@echo "build start"
	@source .ocamlrc && for blatt in $(DIRS); do make -f $$blatt/makefile test; done; echo "build end"

dirtest:
	@echo "build start"
	@source .ocamlrc && make -f $(TDIR)/makefile test;echo "build end"

allclean:
	rm -rf $(BLD)

dirclean:
	rm -rf $(BLD)/$(TDIR)