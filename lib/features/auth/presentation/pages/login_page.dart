import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/widgets/custom_button.dart';
import 'package:geo_attend/widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
        child: Column(
          children: [
            Expanded(
              // ✅ Agar bisa di-scroll jika konten melebihi layar
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Selamat Datang', style: AppConstants.bold24),
                  const SizedBox(height: 8),
                  Text(
                    'Masuk dengan Username\ndan Password',
                    textAlign: TextAlign.center,
                    style: AppConstants.medium18,
                  ),
                  const SizedBox(height: 48),
                  customTextfield(
                    cursorColor: AppConstants.black,
                    label: 'Email',
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 16),
                  customTextfield(
                    cursorColor: AppConstants.black,
                    label: "Password",
                    hintText: "Password",
                    isPassword:
                        true, // <-- Set ini ke true untuk mengaktifkan fitur password
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Lupa Password? Reset Disini',
                    style: AppConstants.semibold14.copyWith(
                      color: AppConstants.warning500,
                    ),
                  ),
                ],
              ),
            ),

            // const SizedBox(height: 10),
            customButton(
              text: "Masuk",
              onPressed: () {},
              color: AppConstants.warning500,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // ✅ Pusatkan teks secara horizontal
              children: [
                Text(
                  "Silahkan hubungi admin jika belum memiliki akun ",
                  style: AppConstants.medium14,
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
