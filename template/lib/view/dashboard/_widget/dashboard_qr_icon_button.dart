import 'package:flutter/material.dart';
import '../../../core/components/button/normal_text_button.dart';

class DashboardIconButton extends StatelessWidget {
  const DashboardIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalTextButton(child: const Icon(Icons.qr_code_2_outlined), onPressed: () {});
  }
}
