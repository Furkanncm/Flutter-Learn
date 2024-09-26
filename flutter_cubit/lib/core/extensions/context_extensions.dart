import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
   EdgeInsets get paddigLow =>  const EdgeInsets.all(10);
   EdgeInsets get paddigNormal =>  const EdgeInsets.all(20);
   EdgeInsets get paddigHigh => const EdgeInsets.all(30);
}
