IDRIS := idris
PKG   := HelloWorld

.PHONY: build clean clean-all install rebuild test

all: build

build:
	@$(IDRIS) --build $(PKG).ipkg

clean:
	@$(IDRIS) --clean $(PKG).ipkg
	@find . -name '*.ibc' -delete

clean-all: clean

install:
	@$(IDRIS) --install $(PKG).ipkg

rebuild: clean build

test:
	@$(IDRIS) --testpkg $(PKG).ipkg
