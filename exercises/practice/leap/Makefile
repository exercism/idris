idris ?= idris
pkg   := Leap

.PHONY: build clean clobber install rebuild test

all: test

build:
	@ ${idris} --build ${pkg}.ipkg

clean:
	@ ${idris} --clean ${pkg}.ipkg

clobber: clean
	@ find . -name '*.ibc' -delete

install:
	@ ${idris} --install ${pkg}.ipkg

rebuild: clean build

test:
	@ ${idris} --testpkg ${pkg}.ipkg
