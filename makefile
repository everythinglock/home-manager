NIRI_CONFIG_DIR := $(HOME)/.config/niri
NOCTALIA_FILE := $(NIRI_CONFIG_DIR)/noctalia.kdl

.PHONY: update
update: ensure-noctalia     # 先依赖 ensure-noctalia
	home-manager switch --flake .#fd

.PHONY: ensure-noctalia
ensure-noctalia:
	@if [ ! -f "$(NOCTALIA_FILE)" ]; then \
	    echo "Creating missing $(NOCTALIA_FILE) placeholder..."; \
	    mkdir -p "$(NIRI_CONFIG_DIR)"; \
	    touch "$(NOCTALIA_FILE)"; \
	fi

.PHONY: clean
clean:
	nix-collect-garbage -d
