#!/bin/sh

echo "Robocop scan:"
exec 5>&1
res=`{ { robocop --configure missing-doc-suite:severity:i --configure todo-in-comment:severity:i --exclude line-too-long --exclude too-many-calls-in-keyword --exclude too-many-calls-in-test-case --exclude too-long-test-case --exclude too-long-keyword; echo $? 1>&4; } 1>&5; } 4>&1`
if [ "$res" = "0" ]; then
    echo "Robocop found no problems"
else
    echo "Robocop found one or more problems"
fi

exit $res
