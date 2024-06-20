all: presentation.html presentation.pdf

%.html: %.md Makefile custom.css
	docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` pandoc/latex \
		$< \
		-t revealjs \
		--standalone \
		--output $@ \
		--metadata=date:"`date "+%B %e, %Y"`" \
		--no-highlight \
		--katex \
		`# See reveal.js themes here: https://revealjs.com/themes/` \
		`# Use "black" for dark mode.` \
		-V theme="white" \
		`# See higlight.js themes here: https://highlightjs.org/static/demo/` \
		`# Use "atom-one-dark.min.css" for dark mode. Other reasonnable light themes include xcode.css and vs.css.` \
		-V header-includes='<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.3.1/styles/atom-one-light.min.css">' \
		`# Reveal.js options can be set form pandoc: https://github.com/jgm/pandoc/blob/master/data/templates/default.revealjs#L95` \
		`# -V center="false"` \
		-V width="1200" \
		-V height="675" \
		-V margin="0.14" \
		-V transition="none" \
		-V header-includes='<link rel="stylesheet" href="custom.css" />' \
		-V include-after='<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.3.1/highlight.min.js"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.3.1/languages/scala.min.js"></script><script>hljs.highlightAll();</script>' \
		-V history="true" \
		-V navigationMode="linear" \
		--slide-level=2 \

%.pdf: %.html
	docker run --rm --volume "`pwd`:/slides" --workdir="/slides" --user `id -u`:`id -g` astefanutti/decktape \
		$< \
		$@

.PHONY: clean

clean:
	rm -rf *.html
