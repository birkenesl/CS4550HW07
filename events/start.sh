#!/bin/bash



export MIX_ENV=prod
export PORT=4795

CFGD=$(readlink -f ~/.config/events)

if [ ! -e "$CFGD/base" ]; then
	echo "run deploy first"
	exit 1
fi

DB_PASS=$(cat "$CFGD/db_pass")
export DATABASE_URL=ecto://events:$DB_PASS@localhost/events_prod


SECRET_KEY_BASE=$(cat "$CFGD/base")
export SECRET_KEY_BASE

echo "Stopping old copy of app, if any..."

_build/prod/rel/events/bin/events stop || true

echo "Starting app..."

_build/prod/rel/events/bin/events start

