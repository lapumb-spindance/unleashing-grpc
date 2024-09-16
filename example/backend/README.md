# Unleashing gRPC Backend Example

This example demonstrates how to use the `unleashing_grpc` library to create a gRPC server that serves simple machine control functionality of turning an LED on and off.

Please note that this is a headless Flutter application, meaning it does not have a UI. On Desktop systems (which use a mocked machine control implementation), you will likely see a black window when running this example, but this is not the case when running in the [embedded OS](https://github.com/lapumb-spindance/machine-control-os).

## Running the Example

To run the example locally, run the following and select your device (if necessary):

```bash
[fvm] flutter run
```

The example also supports build-time configuration of the GPIO number being used (mocked out unless running on Linux) and the gRPC server hostname. To configure these settings, run:

```bash
[fvm] flutter run --dart-define=GPIO=someInt --dart-define=GRPC_HOSTNAME="someHostname"
```

## Tested Platforms

This example has been tested on Linux and MacOS, but should work on Windows as well.
