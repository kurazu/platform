all:
	lessc css/app.less css/app.css
	coffee -c -b js/**/*.coffee js/*.coffee

watch:
	coffee -c -b -w js/**/*.coffee js/*.coffee

css: css/app.less
	lessc css/app.less css/app.css
