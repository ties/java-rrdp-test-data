#!/bin/bash
rm -rf rrdp-test-data/src/main/resources/rrdp-content
mkdir -p rrdp-test-data/src/main/resources/rrdp-content/ripe/ rrdp-test-data/src/main/resources/rrdp-content/apnic/

poetry run python -m rrdp_tools.snapshot_rrdp \
    --limit-deltas=8 \
    https://rrdp.apnic.net/notification.xml \
    rrdp-test-data/src/main/resources/rrdp-content/apnic/

poetry run python -m rrdp_tools.snapshot_rrdp \
    --limit-deltas=8 \
    https://rrdp.ripe.net/notification.xml \
    rrdp-test-data/src/main/resources/rrdp-content/ripe/
