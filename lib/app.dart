import 'package:flutter/widgets.dart';
import 'package:omni/router.dart';
import 'package:omni/configs.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp.router(
      title: APP_NAME,
      color: Color.from(alpha: 1, red: 0, green: 0, blue: 0),
      routerConfig: router,
    );
  }
}
