import 'package:flutter/material.dart';
import '../../widgets/auth/auth_form_field.dart';

class AuthWidgets {
  // helper builder that returns an email + password column
  static Widget buildAuthForm(
      {required TextEditingController emailController,
      required TextEditingController passwordController}) {
    return Column(
      children: [
        AuthFormField(label: '이메일', controller: emailController),
        const SizedBox(height: 8),
        AuthFormField(
            label: '비밀번호', controller: passwordController, obscure: true),
      ],
    );
  }
}
