VERSION := "0.3.0"

alias b := build
alias c := clean
alias t := test
alias v := version
alias pt := push-tag

# Default recipe (this list)
default:
    @just --list

# Clean binaries
clean:
	-rm -rf demo/*/target code/*/target

# Execute tests
test:
	for dir in code/service ../../demo/books; do \
		cd $dir && bal test; \
	done

# Build examples (code and demo)
build: clean
	for dir in code/hello ../client ../service; do \
		cd $dir && bal format && bal build; \
	done

	for dir in demo/client ../books; do \
		cd $dir && bal format && bal build; \
	done

# Tag and push the code to Github
push-tag: version
    @git push
    @git tag -a {{VERSION}} -m "Version {{VERSION}}"
    @git push origin --tags

# Display the version
version:
    @echo "version {{VERSION}}"
