#!/bin/bash



# TODO: Enable this script by removing the above.

export SECRET_KEY_BASE=W68eso5YQOlbtvSNUR50N/HDWj6IaEhAwMR3LtzuBEQAefwYVbX84bvoTA7XtiGi
export MIX_ENV=prod
export PORT=4795

echo "Stopping old copy of app, if any..."

_build/prod/rel/events/bin/events stop || true

echo "Starting app..."

_build/prod/rel/events/bin/events start

# TODO: Add a systemd service file
#       to start your app on system boot.