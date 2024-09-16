import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/led_state_view_model.dart';

class LedStateView extends StatelessWidget {
  const LedStateView({super.key});

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider<LedStateViewModel>(
      create: (final _) => LedStateViewModel(),
      child: _LedStateView(),
    );
  }
}

class _LedStateView extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    final LedStateViewModel viewModel = context.read<LedStateViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('LED State'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Selector<LedStateViewModel, bool>(
                selector: (final _, final LedStateViewModel viewModel) =>
                    viewModel.ledState,
                builder: (final _, final bool ledState, final __) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'LED State: ${ledState ? 'On' : 'Off'}',
                        style: TextStyle(
                          color: ledState ? Colors.green : Colors.red,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () =>
                            viewModel.setLedState(!viewModel.ledState),
                        child:
                            Text(viewModel.ledState ? 'Turn Off' : 'Turn On'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                const Text('LED Info:'),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Selector<LedStateViewModel, String>(
                    selector: (final _, final LedStateViewModel viewModel) =>
                        viewModel.ledInfo,
                    builder: (final _, final String ledInfo, final __) =>
                        Text(ledInfo),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
