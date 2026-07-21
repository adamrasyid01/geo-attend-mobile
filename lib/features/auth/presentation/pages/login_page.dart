import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/auth/presentation/bloc/auth_form_cubit.dart';
import 'package:geo_attend/utils/routes/app_routes.dart';
import 'package:geo_attend/widgets/custom_textfield.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const Color _primaryBlue = Color(0xFF3478F6);
  static const Color _surfaceGray = Color(0xFFF6F6F7);
  static const Color _textMuted = Color(0xFF707075);

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.viewInsetsOf(context).bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: _surfaceGray,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isShortScreen = constraints.maxHeight < 760;
          final logoHeightFactor =
              isKeyboardOpen ? 0.22 : (isShortScreen ? 0.34 : 0.42);

          return Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                height: constraints.maxHeight * logoHeightFactor,
                width: double.infinity,
                child: Image.asset(
                  '${AppConstants.iconPath}/logo.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: SingleChildScrollView(
                    primary: false,
                    physics: const ClampingScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.manual,
                    padding: EdgeInsets.fromLTRB(
                      24,
                      isShortScreen ? 22 : 28,
                      24,
                      18,
                    ),
                    child: BlocBuilder<AuthFormCubit, AuthFormState>(
                      builder: (context, formState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat Datang',
                              style: AppConstants.bold20.copyWith(
                                color: const Color(0xFF16171A),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Masuk dengan Username dan Password',
                              style: AppConstants.medium14.copyWith(
                                color: _textMuted,
                              ),
                            ),
                            SizedBox(height: isShortScreen ? 18 : 20),
                            customTextfield(
                              label: 'Email',
                              hintText: 'Masukkan Email Anda',
                              keyboardType: TextInputType.emailAddress,
                              initialValue: formState.email,
                              cursorColor: _primaryBlue,
                              onChanged:
                                  context.read<AuthFormCubit>().updateEmail,
                            ),
                            SizedBox(height: isShortScreen ? 12 : 16),
                            customTextfield(
                              label: 'Password',
                              hintText: 'Masukkan Password Anda',
                              initialValue: formState.password,
                              obscureText: formState.isObscure,
                              cursorColor: _primaryBlue,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  formState.isObscure
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: _textMuted,
                                  size: 20,
                                ),
                                onPressed:
                                    context
                                        .read<AuthFormCubit>()
                                        .toggleObscureText,
                              ),
                              onChanged:
                                  context.read<AuthFormCubit>().updatePassword,
                            ),
                            SizedBox(height: isShortScreen ? 12 : 16),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFFEAF2FF),
                                  foregroundColor: _primaryBlue,
                                  minimumSize: const Size(0, 32),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                  ),
                                  shape: const StadiumBorder(),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  'Lupa Password?',
                                  style: AppConstants.medium14.copyWith(
                                    color: _primaryBlue,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: isKeyboardOpen ? 22 : 12),
                            SizedBox(
                              width: double.infinity,
                              height: isShortScreen ? 52 : 56,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<AuthFormCubit>().reset();
                                  context.go(AppRoutes.beranda);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _primaryBlue,
                                  elevation: 0,
                                  shape: const StadiumBorder(),
                                ),
                                child: Text(
                                  'Masuk',
                                  style: AppConstants.semibold18.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Center(
                              child: Text(
                                'Hubungi admin jika belum memiliki akun.',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppConstants.medium14.copyWith(
                                  color: _textMuted,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
