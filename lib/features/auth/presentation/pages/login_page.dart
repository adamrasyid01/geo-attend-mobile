import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:geo_attend/features/auth/presentation/bloc/auth_form_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const Color _primaryBlue = Color(0xFF3478F6);
  static const Color _surfaceGray = Color(0xFFF6F6F7);
  static const Color _textMuted = Color(0xFF707075);
  static const Color _borderGray = Color(0xFFD8D8DD);

  @override
  Widget build(BuildContext context) {
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
    final keyboardOffset =
        keyboardInset == 0 ? 0.0 : -(keyboardInset * 0.42).clamp(0.0, 130.0);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _surfaceGray,
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, keyboardOffset, 0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isShortScreen = constraints.maxHeight < 760;

            return Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * (isShortScreen ? 0.34 : 0.42),
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        20,
                        isShortScreen ? 8 : 18,
                        20,
                        0,
                      ),
                      child: Image.asset(
                        '${AppConstants.iconPath}/logo.png',
                        width: MediaQuery.sizeOf(
                          context,
                        ).width.clamp(260.0, isShortScreen ? 320.0 : 380.0),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(
                      24,
                      isShortScreen ? 22 : 28,
                      24,
                      18,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    child: BlocBuilder<AuthFormCubit, AuthFormState>(
                      builder: (context, formState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat Datang',
                              style: AppConstants.bold24.copyWith(
                                color: const Color(0xFF16171A),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Masuk dengan Username dan Password',
                              style: AppConstants.regular15.copyWith(
                                color: _textMuted,
                              ),
                            ),
                            SizedBox(height: isShortScreen ? 18 : 24),
                            BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                if (state is! AuthFailure) {
                                  return const SizedBox.shrink();
                                }

                                return Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(bottom: 14),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade50,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Colors.red.shade200,
                                    ),
                                  ),
                                  child: Text(
                                    state.message,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppConstants.medium14.copyWith(
                                      color: Colors.red.shade700,
                                    ),
                                  ),
                                );
                              },
                            ),
                            _LoginField(
                              label: 'Email',
                              hintText: 'Masukkan Email Anda',
                              keyboardType: TextInputType.emailAddress,
                              initialValue: formState.email,
                              isCompact: isShortScreen,
                              onChanged:
                                  context.read<AuthFormCubit>().updateEmail,
                            ),
                            SizedBox(height: isShortScreen ? 12 : 16),
                            _LoginField(
                              label: 'Password',
                              hintText: 'Masukkan Password Anda',
                              initialValue: formState.password,
                              obscureText: formState.isObscure,
                              isCompact: isShortScreen,
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
                            const Spacer(),
                            BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, authState) {
                                final isLoading = authState is AuthLoading;

                                return SizedBox(
                                  width: double.infinity,
                                  height: isShortScreen ? 52 : 56,
                                  child: ElevatedButton(
                                    onPressed:
                                        isLoading
                                            ? null
                                            : () {
                                              context.read<AuthBloc>().add(
                                                AuthLogin(
                                                  email: formState.email.trim(),
                                                  password:
                                                      formState.password.trim(),
                                                ),
                                              );
                                              context
                                                  .read<AuthFormCubit>()
                                                  .reset();
                                            },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _primaryBlue,
                                      disabledBackgroundColor: _primaryBlue
                                          .withOpacity(0.65),
                                      elevation: 0,
                                      shape: const StadiumBorder(),
                                    ),
                                    child:
                                        isLoading
                                            ? const SizedBox(
                                              width: 22,
                                              height: 22,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2.4,
                                                color: Colors.white,
                                              ),
                                            )
                                            : Text(
                                              'Masuk',
                                              style: AppConstants.semibold18
                                                  .copyWith(
                                                    color: Colors.white,
                                                  ),
                                            ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 6),
                            Center(
                              child: Text(
                                'Hubungi admin jika belum memiliki akun.',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppConstants.regular15.copyWith(
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
              ],
            );
          },
        ),
      ),
    );
  }
}

class _LoginField extends StatelessWidget {
  const _LoginField({
    required this.label,
    required this.hintText,
    required this.onChanged,
    this.initialValue,
    this.keyboardType,
    this.obscureText = false,
    this.isCompact = false,
    this.suffixIcon,
  });

  final String label;
  final String hintText;
  final ValueChanged<String> onChanged;
  final String? initialValue;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isCompact;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppConstants.semibold14.copyWith(
            color: const Color(0xFF2B2C31),
          ),
        ),
        SizedBox(height: isCompact ? 8 : 10),
        SizedBox(
          height: isCompact ? 45 : 40,
          child: TextFormField(
            initialValue: initialValue,
            keyboardType: keyboardType,
            obscureText: obscureText,
            obscuringCharacter: '*',
            cursorColor: LoginPage._primaryBlue,
            onChanged: onChanged,
            style: AppConstants.regular15.copyWith(
              color: const Color(0xFF222328),
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: AppConstants.regular15.copyWith(
                color: const Color(0xFF92939A),
              ),
              suffixIcon: suffixIcon,
              contentPadding: const EdgeInsets.symmetric(horizontal: 26),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: const BorderSide(color: LoginPage._borderGray),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: const BorderSide(color: LoginPage._borderGray),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: const BorderSide(
                  color: LoginPage._primaryBlue,
                  width: 1.2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
