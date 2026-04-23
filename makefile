# 定义变量方便修改
MIRROR = https://nju.edu.cn
OFFICIAL_CACHE = https://nixos.org

.PHONY: update
update:
	home-manager switch --flake .#fd --option substituters "https://mirrors.nju.edu.cn/nix-channels/store https://cache.nixos.org"

.PHONY: clean
clean:
	nix-collect-garbage -d
