#!/bin/bash

DART_COMMAND="dart"

# If FVM is installed, use that for the dart command instead.
if command -v fvm > /dev/null; then
  DART_COMMAND="fvm dart"
fi

# Ensure the `dart` command is found, as it is used under the hood of the `protoc` command.
if ! command -v $DART_COMMAND > /dev/null; then
  echo "Dart SDK not found."
  exit 1
fi

# Ensure the `protoc` command is found.
if ! command -v protoc > /dev/null; then
  echo "protoc not found. Please install the protobuf compiler."
  exit 1
fi

# Ensure the `protoc-gen-dart` command is found, which is the Dart protoc plugin.
if ! command -v protoc-gen-dart > /dev/null; then
  echo "protoc-gen-dart not found. See https://github.com/google/protobuf.dart/tree/master/protoc_plugin for installation instructions."
  exit 1
fi

GENERATION_DIR="lib/src/generated"

# Remove any previously generated files.
rm -rf $GENERATION_DIR

# Create the output directory for the generated files.
mkdir -p $GENERATION_DIR

# Generate the proto files and gRPC stubs.
#
# The `--dart_out` flag specifies the output directory for the generated Dart files.
# The `-I` flag specifies the directory to search for the imported `.proto` files.
# The `proto/*.proto` and `proto/*/*.proto` files are the input `.proto` files.
set -e
protoc --dart_out=grpc:$GENERATION_DIR -Iproto/ proto/*.proto proto/*/*.proto
set +e

# At the beginning of each generated file in lib/generated/*, add the following line:
#
# // coverage:ignore-file
#
# This is to ignore the generated files from code coverage.
for file in $(find $GENERATION_DIR -name '*.dart'); do
  if [ -f "$file" ]; then
    echo "// coverage:ignore-file" | cat - "$file" > temp && mv temp "$file"
  fi
done

# Format the generated files.
$DART_COMMAND format $GENERATION_DIR

# Check for failure
if [ $? -eq 0 ]; then
  echo "Generation completed successfully."
else
  echo "Generation failed."
  exit 1
fi
