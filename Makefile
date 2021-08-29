.PHONY: test
test:
	home-manager switch -f ./home-manager/home.nix

.PHONY: installNodePkg
installNodePkg:
	nix-shell -p nodePackages.node2nix --command "node2nix -i ./node-packages.json -o node-packages.nix"
