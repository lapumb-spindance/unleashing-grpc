import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/led_status_view_model.dart';

class LedStatusView extends StatelessWidget {
  const LedStatusView({super.key});

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider<LedStatusViewModel>(
      create: (final _) => LedStatusViewModel(),
      child: _LedStatusView(),
    );
  }
}

class _LedStatusView extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED Status'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: _LedToggleContainer(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                const Text('LED Info:'),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Selector<LedStatusViewModel, String>(
                    selector: (final _, final LedStatusViewModel viewModel) =>
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

class _LedToggleContainer extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    final LedStatusViewModel viewModel = context.watch<LedStatusViewModel>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'LED Status: ${viewModel.ledStatus ? 'On' : 'Off'}',
          style:
              TextStyle(color: viewModel.ledStatus ? Colors.green : Colors.red),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => viewModel.setLedStatus(!viewModel.ledStatus),
          child: Text(viewModel.ledStatus ? 'Turn Off' : 'Turn On'),
        ),
      ],
    );
  }
}
