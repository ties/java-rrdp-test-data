#!/bin/bash
rm -rf rrdp-test-data/src/main/resources/rrdp-content
mkdir -p rrdp-test-data/src/main/resources/rrdp-content/ripe/ rrdp-test-data/src/main/resources/rrdp-content/arin/

poetry run python -m rrdp_tools.snapshot_rrdp \
    --limit-deltas=8 \
    https://rrdp.arin.net/notification.xml \
    rrdp-test-data/src/main/resources/rrdp-content/arin/

poetry run python -m rrdp_tools.snapshot_rrdp \
    --limit-deltas=8 \
    https://rrdp.ripe.net/notification.xml \
    rrdp-test-data/src/main/resources/rrdp-content/ripe/

# find ./rrdp-test-data/src/main/resources/rrdp-content -name \*.xml -exec gzip -9 {} \;
