import 'package:flutter/material.dart';
import 'package:geo_attend/constants/app_constants.dart';
import 'package:geo_attend/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:geo_attend/features/auth/presentation/bloc/auth_form_cubit.dart';
import 'package:geo_attend/widgets/custom_button.dart';
import 'package:geo_attend/widgets/custom_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
        child: Column(
          // Add this to distribute space
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              // ✅ Agar bisa di-scroll jika konten melebihi layar
              child: Form(
                child: BlocBuilder<AuthFormCubit, AuthFormState>(
                  builder: (context, formState) {
                    return SingleChildScrollView(
                      // Added SingleChildScrollView
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              if (state is AuthFailure) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade50,
                                    border: Border.all(
                                      color: Colors.red.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        color: Colors.red.shade400,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          state.message,
                                          style: AppConstants.medium14,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          ),
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
                            initialValue: formState.email,
                            hintText: 'Email',
                            onChanged: (val) {
                              context.read<AuthFormCubit>().updateEmail(val);
                            },
                          ),
                          const SizedBox(height: 16),
                          customTextfield(
                            cursorColor: AppConstants.black,
                            label: "Password",
                            initialValue: formState.password,
                            onChanged: (val) {
                              context.read<AuthFormCubit>().updatePassword(val);
                            },
                            hintText: "Password",
                            obscureText: formState.isObscure,
                            suffixIcon: IconButton(
                              icon: Icon(
                                formState.isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                context
                                    .read<AuthFormCubit>()
                                    .toggleObscureText();
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          Align(
                            // Use Align to push text to the right
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Lupa Password? Reset Disini',
                              style: AppConstants.semibold14.copyWith(
                                color: AppConstants.warning500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            // Moved outside the Expanded widget
            BlocBuilder<AuthFormCubit, AuthFormState>(
              builder: (context, formState) {
                return Column(
                  children: [
                    customButton(
                      text: "Masuk",
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          AuthLogin(
                            email: formState.email.trim(),
                            password: formState.password.trim(),
                          ),
                        );
                        context.read<AuthFormCubit>().reset();
                      },
                      color: AppConstants.warning500,
                    ),
                    const SizedBox(height: 4), // Space between button and text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Silahkan hubungi admin jika belum memiliki akun ",
                          style: AppConstants.medium14,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
