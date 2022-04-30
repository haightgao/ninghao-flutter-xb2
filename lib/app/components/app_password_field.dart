import 'package:flutter/material.dart';

class AppPasswordField extends StatelessWidget {
  final String? labelText;
  final ValueChanged<String>? onChanged;
  const AppPasswordField({Key? key, this.labelText, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 32),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: labelText ?? '密码',
        ),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '请填写用户密码';
          }
          if (value.isNotEmpty && value.length < 6) {
            return '请填写 6 位以上密码';
          }
          return null;
        },
      ),
    );
  }
}
