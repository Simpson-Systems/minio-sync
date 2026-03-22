#!/bin/bash

mc alias set tigerlocal http://localhost:9000 minioadmin minioadmin
mc alias set hawkbackup http://100.73.137.94:9100 minioadmin minioadmin

mc mirror --watch tigerlocal/durable hawkbackup/durable &
mc mirror --watch tigerlocal/databasus-backups hawkbackup/databasus-backups &

mc mirror --watch tigerlocal/incoming-raw hawkbackup/incoming-raw &
mc mirror --watch tigerlocal/normalized-events  hawkbackup/normalized-events &
mc mirror --watch tigerlocal/artifacts hawkbackup/artifacts &
mc mirror --watch tigerlocal/dead-letter hawkbackup/dead-letter &

wait
