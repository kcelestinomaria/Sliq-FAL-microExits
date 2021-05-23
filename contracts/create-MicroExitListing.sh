export DATE=`date "+%Y%m%d-%H%M%S"`

# get timestamp in seconds for the startDate
export MExSD=$(DATE '+%s')

# we allow 30min for investors to place their bid 
invs=1800
invss=2500

# MicroExit Listing endDate
export MExED=$(( $MExSD + $invs ))

# MicroExit Listing closeDate
export MExCD=$(( $MExED + $invss ))

# MicroExit listingID https://algoexplorer.io/asset/71054280
# Will change Listing ID
export LISTINGID="71054280"

export ADDR_CREATOR="YOURACCOUNTIDENTIFIERGOESHERE"

export TEAL_APPROVAL_PROG="micro-investApproval_program.teal"
export TEAL_CLEAR_PROG="micro-invest-clear_state.teal"

export GLOBAL_BYTESLICES=3
export GLOBAL_INTS=6
export LOCAL_BYTESLICES=0
export LOCAL_INTS=1

goal app create --creator $ADDR_CREATOR \
                --approval-prog $TEAL_APPROVAL_PROG \
                --clear-prog $TEAL_CLEAR_PROG \
                --global-byteslices $GLOBAL_BYTESLICES \
                --global-ints $GLOBAL_INTS \
                --local-byteslices $LOCAL_BYTESLICES \
                --local-ints $LOCAL_INTS \
                --app-arg "int:$LISTINGID" \
                --app-arg "int:$MExSD" \
                --app-arg "int:$MExED" \
                --app-arg "int:1000000" \
                --app-arg "addr:$ADDR_CREATOR" \
                --app-arg "int:$MExCD" \
                -d ~/node/data
