import 'package:egolden/core/services/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

class NotFoundView extends StatelessWidget {
  final String path;
  const NotFoundView({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationService.setTitleAndUrl("Aradığınız sayfa bulunamadı", path);
    return const Scaffold(
        body: Center(child: SelectableText("Aradığınız sayfa bulunamadı.")));
  }
}
