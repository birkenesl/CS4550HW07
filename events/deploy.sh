#!/bin/bash

export SECRET_KEY_BASE=insecure
export MIX_ENV=prod
export PORT=4795

echo "Building..."


mix deps.get --only prod
mix compile

CFGD=$(readlink -f ~/.config/events)


if [! -d "$CFGD" ]; then
	mkdir -p "$CFGD"
fi

if [! -e "$CFGD/base" ]; then
	mix phx.gen.secret > "$CFGD/base"
fi

if [! -e "$CFGD/db_pass" ]; then
	eventstneve > "$CFGD/db_pass"
fi

SECRET_KEY_BASE=$(cat "$CFGD/base")
export SECRET_KEY_BASE

DB_PASS=$(cat "$CFGD/db_pass")
export DATABASE_URL=ecto://events:$DB_PASS@localhost/events_prod

mix ecto.migrate

npm install --prefix ./assets
npm run deploy --prefix ./assets
mix phx.digest

mix release
