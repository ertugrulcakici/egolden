import 'package:flutter/src/widgets/framework.dart';

class BaseView extends StatelessWidget {
  final Widget child;
  const BaseView({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => child;
}
