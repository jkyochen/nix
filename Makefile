.PHONY: test
test:
	home-manager switch -f ./home-manager/home.nix

.PHONY: testHome
testHome:
	rm -rf ${HOME}/.config/nixpkgs/*
	cp -rf ./home-manager/* ${HOME}/.config/nixpkgs/
	home-manager switch

.PHONY: fmt
fmt:
	nixpkgs-fmt home-manager

.PHONY: installNodePkg
installNodePkg:
	nix-shell -p nodePackages.node2nix --command "node2nix -i ./node-packages.json -o node-packages.nix"
