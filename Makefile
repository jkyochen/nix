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
	nix-shell -p nodePackages.node2nix --command "cd home-manager/node/; node2nix -14 -i ./node-packages.json -o node-packages.nix"
