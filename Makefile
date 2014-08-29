
.PHONY: deps
deps:
	cabal install --only-dependencies

.PHONY: clean
clean:
	rm -rf cabal-dev dist

.PHONY: test
test:
	cabal build spec
	hlint src test
	./dist/build/spec/spec ${ARGS}
