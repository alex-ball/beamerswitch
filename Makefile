NAME  = beamerswitch
SHELL = bash
PWD   = $(shell pwd)
TEMP := $(shell mktemp -d -t tmp.XXXXXXXXXX)
TDIR  = $(TEMP)/$(NAME)
VERS  = $(shell ltxfileinfo -v $(NAME).dtx)
LOCAL = $(shell kpsewhich --var-value TEXMFLOCAL)
UTREE = $(shell kpsewhich --var-value TEXMFHOME)

.PHONY: clean distclean inst install uninst uninstall zip ctan

all:	$(NAME).pdf $(NAME)-example.pdf clean
	@exit 0
$(NAME).cls $(NAME)-example.tex: $(NAME).dtx
	tex -interaction=batchmode $(NAME).dtx >/dev/null
$(NAME).pdf: $(NAME).dtx
	latexmk -silent -lualatex -synctex=1 -shell-escape -interaction=batchmode $(NAME).dtx >/dev/null
$(NAME)-example.pdf $(NAME)-example-trans.pdf $(NAME)-example-handout.pdf $(NAME)-example-article.pdf: $(NAME).cls $(NAME)-example.tex
	latexmk -silent -lualatex -synctex=1 -shell-escape -interaction=batchmode $(NAME)-example.tex >/dev/null
clean:
	rm -f $(NAME){,-example,-example-article,-example-handout,-example-trans}.{aux,bbl,bcf,blg,doc,fdb_latexmk,fls,glo,gls,hd,idx,ilg,ind,listing,log,nav,out,run.xml,snm,synctex.gz,tcbtemp,toc,vrb}
	rm -rf _minted-$(NAME)
distclean: clean
	rm -f $(NAME).{pdf,ins,cls} $(NAME)-example.{tex,pdf} $(NAME)-example-{article,handout,trans}.pdf
inst: all
	mkdir -p $(UTREE)/{tex,source,doc}/latex/$(NAME)
	cp $(NAME).dtx $(NAME).ins $(UTREE)/source/latex/$(NAME)
	cp $(NAME).cls $(UTREE)/tex/latex/$(NAME)
	cp $(NAME).pdf $(NAME)-example.{tex,pdf} $(NAME)-example-trans.pdf $(NAME)-example-handout.pdf $(NAME)-example-article.pdf README.md $(UTREE)/doc/latex/$(NAME)
	mktexlsr
uninst:
	rm -r $(UTREE)/{tex,source,doc}/latex/$(NAME)
	mktexlsr
install: all
	sudo mkdir -p $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	sudo cp $(NAME).dtx $(NAME).ins $(LOCAL)/source/latex/$(NAME)
	sudo cp $(NAME).cls $(LOCAL)/tex/latex/$(NAME)
	sudo cp $(NAME).pdf $(NAME)-example.pdf $(NAME)-example-trans.pdf $(NAME)-example-handout.pdf $(NAME)-example-article.pdf README.md $(LOCAL)/doc/latex/$(NAME)
	mktexlsr
uninstall:
	sudo rm -r $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	mktexlsr
zip: all
	mkdir $(TDIR)
	cp $(NAME).{pdf,dtx} $(NAME)-example.{tex,pdf} $(NAME)-example-trans.pdf $(NAME)-example-handout.pdf $(NAME)-example-article.pdf $(NAME).cls README.md Makefile $(TDIR)
	cd $(TEMP); zip -Drq $(PWD)/$(NAME)-$(VERS).zip $(NAME)
ctan: all
	mkdir $(TDIR)
	cp $(NAME).{pdf,dtx} $(NAME)-example.pdf $(NAME)-example-trans.pdf $(NAME)-example-handout.pdf $(NAME)-example-article.pdf README.md Makefile $(TDIR)
	cd $(TEMP); zip -Drq $(PWD)/$(NAME)-$(VERS).zip $(NAME)
