#!/bin/bash

export SECRET_KEY_BASE=W68eso5YQOlbtvSNUR50N/HDWj6IaEhAwMR3LtzuBEQAefwYVbX84bvoTA7XtiGi

export MIX_ENV=prod
export PORT=4795
export DATABASE_URL=ecto://events:eventstneve@localhost/events_prod

echo "Building..."


mix deps.get --only prod
mix compile

#CFGD=$(readlink -f ~/.config/events)


#if [! -d "$CFGD" ]; then
#	mkdir -p "$CFGD"
#fi

#if [! -e "$CFGD/base" ]; then
#	mix phx.gen.secret > "$CFGD/base"
#fi

#if [! -e "$CFGD/db_pass" ]; then
#	eventstneve > "$CFGD/db_pass"
#fi

export SECRET_KEY_BASE


export DATABASE_URL=ecto://events:eventstneve@localhost/events_prod
mix ecto.reset
mix ecto.migrate

npm install --prefix ./assets
npm run deploy --prefix ./assets
mix phx.digest

mix release
