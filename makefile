.PHONY: update
update:
	home-manager switch --flake .#fd

.PHONY: clean
clean:
	nix-collect-garbage -d
