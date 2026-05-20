import 'package:flutter/widgets.dart';

class RiderProfile extends StatelessWidget {
  const RiderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    const text = Text('Hello from RiderProfile!');

    const body = Center(child: text);

    return Container(child: body, color: const Color.fromARGB(255, 65, 2, 2));
  }
}
