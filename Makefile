all: presentation.html

%.html: %.md
	docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` pandoc/latex \
		$< \
		-t revealjs \
		--standalone \
		--output $@ \
		--metadata=date:"`date "+%B %e, %Y"`" \
		--no-highlight \
		--katex \
		`# See reveal.js themes here: https://revealjs.com/themes/` \
		`# A good light theme is "white".` \
		-V theme="black" \
		`# See higlight.js themes here: https://highlightjs.org/static/demo/` \
		`# A good light theme is "github.min.css".` \
		-V header-includes='<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.3.1/styles/atom-one-dark.min.css">' \
		-V include-after='<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.3.1/highlight.min.js"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.3.1/languages/scala.min.js"></script><script>hljs.highlightAll();</script>'

.PHONY: clean

clean:
	rm -rf *.html
