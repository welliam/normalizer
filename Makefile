# create new directory, copy html, then deploy with wrangler minified
deploy:
	if [ -d "dist" ]; then rm -r dist; fi
	mkdir -p dist
	npx html-minifier --collapse-whitespace --remove-comments --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-tag-whitespace --use-short-doctype --minify-css true --minify-js true index.html -o dist/index.html
	cp _headers dist/
	npx wrangler pages deploy dist/ --project-name=normalizer --branch=main
	rm -r dist