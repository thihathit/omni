import 'package:flutter/widgets.dart';

class MerchantHome extends StatelessWidget {
  const MerchantHome({super.key});

  @override
  Widget build(BuildContext context) {
    const text = Text('Hello from MerchantHome!');

    const body = Center(child: text);

    return Container(child: body);
  }
}
