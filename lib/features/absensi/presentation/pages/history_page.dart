import 'package:flutter/material.dart';
import 'package:geo_attend/widgets/custom_appbar.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'History Absensi'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Daftar history absensi akan ditampilkan di sini.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implementasi logika untuk menampilkan history absensi
              },
              child: const Text('Lihat History Absensi'),
            ),
          ],
        ),
      ),
    );
  }
}
