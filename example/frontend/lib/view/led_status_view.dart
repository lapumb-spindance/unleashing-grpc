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
    final LedStatusViewModel viewModel = context.watch<LedStatusViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('LED Status'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'LED Status: ${viewModel.ledStatus ? 'On' : 'Off'}',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => viewModel.setLedStatus(!viewModel.ledStatus),
              child: Text(viewModel.ledStatus ? 'Turn Off' : 'Turn On'),
            ),
          ],
        ),
      ),
    );
  }
}
