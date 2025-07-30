import 'package:flutter/material.dart';
import 'package:geo_attend/widgets/custom_appbar.dart';

class TakePhotoPage extends StatelessWidget {
  const TakePhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'Take Photo'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Camera functionality will be implemented here.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement photo taking functionality
              },
              child: const Text('Take Photo'),
            ),
          ],
        ),
      ),
    );
  }
}
