#!/bin/bash

# Run `flatc`. Note: This requires you to compile using `cmake` from the
# root `/flatbuffers` directory.
if [ -e ../flatc ]; then
  FCPROG=../flatc
elif [ -e ../Debug/flatc ]; then
  FCPROG=../Debug/flatc
else
  echo 'flatc' could not be found. Make sure to build FlatBuffers from the \
        $rootdir directory.
  exit 1
fi
echo "{ }" > test_schema_to_json.json
$FCPROG --json --strict-json --full-schema-json test_schema_to_json.fbs test_schema_to_json.json
