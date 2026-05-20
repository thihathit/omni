import 'package:flutter/widgets.dart';

class RiderHome extends StatelessWidget {
  const RiderHome({super.key});

  @override
  Widget build(BuildContext context) {
    const text = Text('Hello from RiderHome!');

    const body = Center(child: text);

    return Container(child: body, color: const Color(0xFF222222));
  }
}
