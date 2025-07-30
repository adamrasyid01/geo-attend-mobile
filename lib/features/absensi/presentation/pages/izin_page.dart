import 'package:flutter/material.dart';
import 'package:geo_attend/widgets/custom_appbar.dart';
import 'package:geo_attend/widgets/custom_select.dart';
import 'package:geo_attend/widgets/custom_textarea.dart';
import 'package:geo_attend/widgets/custom_textfield.dart';

class IzinPage extends StatelessWidget {
  IzinPage({super.key});

  final TextEditingController controller = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final String? selectedValue = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'Pengajuan Izin'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 24,
        ), // tambahkan padding di sini
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTextarea(
              maxLines: 4,
              cursorColor: Colors.blue,
              inputController: controller,
              hintText: "Jelaskan Tujuan Izin",
              label: "Deskripsi",
            ),
            const SizedBox(height: 8),
            customSelect(
              label: "Jenis Izin",
              hintText: "Pilih Opsi",
              items: ["Cuti", "Sakit", "Izin Lainnya"],
              value: selectedValue,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
