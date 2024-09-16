# Unleashing gRPC

This repository contains the [library](./), [backend application](example/backend/), and [frontend application](example/frontend/) examples that were worked through as part of the ["_Unleashing gRPC_" blog](TODO:ADD_LINK(S)).

## Getting Starting

This repository supports using `fvm` to manage the Flutter SDK version so users can stay consistent with the Flutter SDK version this repository was built with. While it is optional to use `fvm`, it is recommended. To install `fvm`, see the [installation instructions](https://fvm.app/documentation/getting-started/installation).

For [gRPC](https://grpc.io/) and [protocol buffer](https://protobuf.dev/) code generation, this repository uses the `protoc` compiler. To install `protoc`, see the [installation instructions](https://grpc.io/docs/protoc-installation/). You will also need to install the [Dart protoc plugin](https://github.com/google/protobuf.dart/tree/master/protoc_plugin).

>Please note that installing the `protoc` tooling is not required as the generated code is committed to this repository. However, if you wish to regenerate the code or make changes to the `.proto` files, you will need to install the `protoc` tooling. To regenerate, run the [dart_generate_proto.sh](tools/dart_generate_proto.sh) script.

## `unleashing_grpc` Library

The `unleashing_grpc` library contains the gRPC client and server wrapper implementations to call into simple machine control functionality that is utilized by the example `frontend` and `backend` applications.

## Running the Examples

To run the examples locally, see the [backend](example/backend/README.md) and [frontend](example/frontend/README.md) READMEs.

To run the examples on the target device, see the [embedded OS](https://github.com/lapumb-spindance/machine-control-os) README.

## Contributing

Want to contribute to this repository? Feel free to open a pull request, file an issue, or make a suggestion!
