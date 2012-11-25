
configure: clean deps
	cabal configure --enable-tests

deps:
	cabal install --only-dependencies

build:
	cabal-dev build

clean:
	rm -rf cabal-dev dist

test: build
	hlint src test
	./dist/build/spec/spec ${ARGS}
