#!/bin/bash

source variables

function fail()
{
        echo Error: "$@" >&2
        exit 1
}

function check_for_file()
{
    if [ ! -e "$1" ]; then
            fail "Missing file: $1"
    fi
}

cd "$STEAMCMD_DIR" || fail "Missing $STEAMCMD_DIR directory!"

check_for_file "steamcmd.sh"
check_for_file "$DONTSTARVE_DIR/$CLUSTER_NAME/cluster.ini"
check_for_file "$DONTSTARVE_DIR/$CLUSTER_NAME/cluster_token.txt"
check_for_file "$DONTSTARVE_DIR/$CLUSTER_NAME/Master/server.ini"
check_for_file "$DONTSTARVE_DIR/$CLUSTER_NAME/Caves/server.ini"

./steamcmd.sh +force_install_dir "$INSTALL_DIR" +login anonymous +app_update 343050 +quit

check_for_file "$INSTALL_DIR/bin"

cd "$INSTALL_DIR/bin" || fail 

run_shared=(./dontstarve_dedicated_server_nullrenderer)
run_shared+=(-cluster "$CLUSTER_NAME")
run_shared+=(-monitor_parent_process $$)

"${run_shared[@]}" -shard Caves  | sed 's/^/Caves:  /' &
"${run_shared[@]}" -shard Master | sed 's/^/Master: /'
