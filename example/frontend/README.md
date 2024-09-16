# Unleashing gRPC Frontend Example

This example demonstrates how to use the `unleashing_grpc` library to create stateful user interface that interacts with a gRPC server to control an LED on the target device.

## Running the Example

To run the example locally, run the following and select your device (if necessary):

```bash
[fvm] flutter run
```

The example also supports configuring the gRPC server hostname at build-time. To configure, run:

```bash
[fvm] flutter run --dart-define=GRPC_HOSTNAME="someHostname"
```

## Troubleshooting

If you encounter communication difficulties between the frontend and backend applications, ensure:

1. The backend application is running
1. The gRPC server hostname is identical on both the frontend and backend applications

If issues persist, feel free to [open an issue](https://github.com/lapumb-spindance/unleashing-grpc/issues/new)!

## Tested Platforms

This example has been tested on Linux, MacOS, and iOS. Android and Windows are supported and should work as well, but feel free to open an issue if you encounter any difficulties.
