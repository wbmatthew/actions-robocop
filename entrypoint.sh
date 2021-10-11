#!/bin/sh

robocop --generate-action-matcher -c line-too-long:severity:i -c too-many-calls-in-keyword:i -c too-long-test-case:i -c too-long-keyword:i

echo "::add-matcher::robocop-matcher.json"

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
