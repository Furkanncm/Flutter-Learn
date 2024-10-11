import 'package:flutter/material.dart';

import '../../../core/components/button/normal_text_button.dart';

class DashboardCameraIconButton extends StatelessWidget {
  const DashboardCameraIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalTextButton(child: const Icon(Icons.camera_alt_outlined), onPressed: () {});
  }
}
