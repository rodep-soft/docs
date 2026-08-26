.PHONY: html serve clean

html:
	uv run sphinx-build -M html source build

serve:
	uv run sphinx-autobuild source build/html --port 8000 --open-browser

clean:
	rm -rf build
