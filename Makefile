NAME  = beamerticle
SHELL = bash
PWD   = $(shell pwd)
TEMP := $(shell mktemp -d -t tmp.XXXXXXXXXX)
TDIR  = $(TEMP)/$(NAME)
VERS  = $(shell ltxfileinfo -v $(NAME).dtx)
LOCAL = $(shell kpsewhich --var-value TEXMFLOCAL)
UTREE = $(shell kpsewhich --var-value TEXMFHOME)
all:	$(NAME).pdf clean
	@exit 0
$(NAME).cls: $(NAME).dtx
	lualatex -synctex=1 -shell-escape -interaction=batchmode $(NAME).dtx >/dev/null
$(NAME).pdf: $(NAME).cls
	latexmk -silent -lualatex -synctex=1 -shell-escape -interaction=batchmode $(NAME).dtx >/dev/null
clean:
	rm -f $(NAME).{aux,bbl,bcf,blg,doc,fdb_latexmk,fls,glo,gls,hd,idx,ilg,ind,listing,log,nav,out,run.xml,snm,synctex.gz,tcbtemp,toc,vrb}
	rm -f $(NAME)-slides.{aux,bbl,bcf,blg,doc,fdb_latexmk,fls,glo,gls,hd,idx,ilg,ind,ins,listing,log,nav,out,run.xml,snm,synctex.gz,toc,vrb}
	rm -rf _minted-$(NAME)
distclean: clean
	rm -f $(NAME).{pdf,ins} $(NAME)-slides.pdf $(NAME).cls
inst: all
	mkdir -p $(UTREE)/{tex,source,doc}/latex/$(NAME)
	mkdir -p $(UTREE)/tex/generic/logos-ubath
	cp $(NAME).dtx $(NAME).ins $(UTREE)/source/latex/$(NAME)
	cp $(NAME).cls $(UTREE)/tex/latex/$(NAME)
	cp $(NAME).pdf $(NAME)-slides.pdf README.md $(UTREE)/doc/latex/$(NAME)
	cp uob-logo-grey-transparent.{eps,pdf} $(UTREE)/tex/generic/logos-ubath
	mktexlsr
uninst:
	rm -r $(UTREE)/{tex,source,doc}/latex/$(NAME)
	rm $(UTREE)/tex/generic/logos-ubath/uob-logo-grey-transparent.{eps,pdf}
	rmdir --ignore-fail-on-non-empty $(UTREE)/tex/generic/logos-ubath
	mktexlsr
install: all
	sudo mkdir -p $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	sudo mkdir -p $(LOCAL)/tex/generic/logos-ubath
	sudo cp $(NAME).dtx $(NAME).ins $(LOCAL)/source/latex/$(NAME)
	sudo cp $(NAME).cls $(LOCAL)/tex/latex/$(NAME)
	sudo cp $(NAME).pdf $(NAME)-slides.pdf README.md $(LOCAL)/doc/latex/$(NAME)
	sudo cp uob-logo-grey-transparent.{eps,pdf} $(LOCAL)/tex/generic/logos-ubath
	mktexlsr
uninstall:
	sudo rm -r $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	sudo rm $(LOCAL)/tex/generic/logos-ubath/uob-logo-grey-transparent.{eps,pdf}
	sudo rmdir --ignore-fail-on-non-empty $(LOCAL)/tex/generic/logos-ubath
	mktexlsr
zip: all
	mkdir $(TDIR)
	cp $(NAME).{pdf,dtx} $(NAME).cls README.md Makefile $(TDIR)
	cd $(TEMP); zip -Drq $(PWD)/$(NAME)-$(VERS).zip $(NAME)
