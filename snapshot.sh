#!/bin/bash
rm -rf lib/src/main/resources/rrdp-content
mkdir -p lib/src/main/resources/rrdp-content/ripe/ lib/src/main/resources/rrdp-content/arin/

poetry run python -m rrdp_tools.snapshot_rrdp \
    --limit-deltas=8 \
    https://rrdp.arin.net/notification.xml \
    lib/src/main/resources/rrdp-content/arin/

poetry run python -m rrdp_tools.snapshot_rrdp \
    --limit-deltas=8 \
    https://rrdp.ripe.net/notification.xml \
    lib/src/main/resources/rrdp-content/ripe/

# find ./lib/src/main/resources/rrdp-content -name \*.xml -exec gzip -9 {} \;
