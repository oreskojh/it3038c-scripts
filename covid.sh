#!/bin/bash
# This script downloads covid data and displays it

DATA=$(curl https://api.covidtracking.com/v1/us/current.json)
POSITIVE=$(echo $DATA | jq '.[0].positive')
VENTILATOR=$(echo $DATA | jq '.[0].onVentilatorCurrently')
CURRENTICU=$(echo $DATA | jq '.[0].inIcuCurrently')
NEWCOVIDPOSITIVE=$(echo $DATA | jq '.[0].positiveIncrease')
TODAY=$(date)








echo "On $TODAY, there were $POSITIVE positive COVID cases, on a $VENTILATOR ventilator currently, $CURRENTICU in the ICU currently, and an
increase of $NEWCOVIDPOSITIVE new COVID positive cases."
