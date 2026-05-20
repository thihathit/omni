import 'package:flutter/widgets.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    const text = Text('Hello from Login!');

    const body = Center(child: text);

    return Container(child: body);
  }
}
