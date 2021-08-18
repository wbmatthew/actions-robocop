#!/bin/sh

robocop --generate-action-matcher
ls -a
echo "::add-matcher::${RUNNER_TEMP}/robocop-matcher.json"

echo "Robocop scan:"
exec 5>&1
res=`{ { robocop; echo $? 1>&4; } 1>&5; } 4>&1`
if [ "$res" = "0" ]; then
    echo "Robocop found no problems"
else
    echo "Robocop found one or more problems"
fi
echo "::remove-matcher owner=robocop-matcher::"

exit $res