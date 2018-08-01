.PHONY: clean-pyc clean-build docs

help:
	@echo "clean - remove all generated files"
	@echo "pdf - build all pdf"
	@echo "complete - build merged doc"

clean: 
	rm *.pdf
	rm docs/job*.pdf
	rm docs/job*.html
	
html: 
	cat inc/header.rst job_beschreibung.rst inc/footer.rst | rst2html > docs/job_beschreibung.html
	cat inc/header.rst job_beschreibung_php.rst inc/footer.rst | rst2html > docs/job_beschreibung_php.html
	cat inc/header.rst job_beschreibung_admin.rst inc/footer.rst | pandoc -f rst -t html > docs/job_beschreibung_admin.html
	cat inc/header.rst job_description.rst inc/footer.rst | pandoc -f rst -t html > docs/job_description.html
	cat inc/header.rst job_description_php.rst inc/footer.rst | pandoc -f rst -t html > docs/job_description_php.html
	cat inc/header.rst job_description_admin.rst inc/footer.rst | pandoc -f rst -t html > docs/job_description_admin.html
	cat inc/header.rst index.rst inc/footer.rst | pandoc -f rst -t html > docs/index.html

pdf: 
	cat inc/header.rst job_beschreibung.rst inc/footer.rst | rst2pdf > docs/job_beschreibung.pdf
	cat inc/header.rst job_description.rst inc/footer.rst | rst2pdf > docs/job_description.pdf
	cat inc/header.rst job_beschreibung_php.rst inc/footer.rst | rst2pdf > docs/job_beschreibung_php.pdf
	cat inc/header.rst job_description_php.rst inc/footer.rst | rst2pdf > docs/job_description_php.pdf
	cat inc/header.rst job_beschreibung_admin.rst inc/footer.rst | rst2pdf > docs/job_beschreibung_admin.pdf
	cat inc/header.rst job_description_admin.rst inc/footer.rst | rst2pdf > docs/job_description_admin.pdf

github:
	cat inc/beschreibung.rst job_beschreibung.rst inc/ueber.rst inc/kontakt.rst | pandoc -f rst -t rst > docs/gh_job_beschreibung.rst
	cat inc/beschreibung.rst job_beschreibung_php.rst inc/ueber.rst inc/kontakt.rst | pandoc -f rst -t rst > docs/gh_job_beschreibung_php.rst
    
complete: pdf html github
	rm README.rst
	#cat inc/header.rst  job_description.rst job_description_php.rst job_description_admin.rst job_beschreibung.rst job_beschreibung_php.rst job_beschreibung_admin.rst inc/footer.rst > README.rst
	cat docs/gh_job_beschreibung.rst docs/gh_job_beschreibung_php.rst > README.rst
	
