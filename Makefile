IMAGE := tfsec/tfsec

.PHONY: image
image:
	docker build --build-arg tfsec_version=$(TRAVIS_TAG) -t $(IMAGE) .

.PHONY: test
test:
	go test -mod=vendor ./...

.PHONY: build
build:
	./scripts/build.sh

.PHONY: generate-docs
generate-docs:
	@go run ./cmd/tfsec-docs

.PHONY: generate-codes-json
generate-codes-json:
	@go run ./cmd/tfsec-codes

.PHONY: publish-docs
publish-docs:
	./scripts/publish-docs.sh

.PHONY: new-check
new-check:
	@go run ./cmd/tfsec-skeleton

.PHONY: lint-pr-checks
lint-pr-checks:
	@go run ./cmd/tfsec-pr-lint

.PHONY: tagger
tagger:
	@git pull origin master
	@git tag -a ${TAG} -m ${TAG}
	@git push --tags

.PHONY: cyclo
cyclo:
	which gocyclo || go install github.com/fzipp/gocyclo/cmd/gocyclo@latest
	gocyclo -over 15 -ignore 'vendor/|funcs/' .

.PHONY: vet
vet:
	go vet ./...

.PHONY: typos
typos:
	which codespell || pip install codespell
	codespell -S vendor,funcs,.terraform --ignore-words .codespellignore -f

.PHONY: quality
quality: cyclo vet

.PHONY: fix-typos
fix-typos:
	which codespell || pip install codespell
	codespell -S vendor,funcs,.terraform --ignore-words .codespellignore -f -w -i1

.PHONY: clone-image
clone-image:
	./scripts/clone-images.sh

.PHONY: end-to-end
end-to-end:
	go run ./cmd/tfsec -s -p --force-all-dirs ./example
