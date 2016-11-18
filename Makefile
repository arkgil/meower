release: build_assets digest_assets
	MIX_ENV=prod mix release --env=prod

build_assets:
	node_modules/brunch/bin/brunch build

digest_assets:
	MIX_ENV=prod mix phoenix.digest
