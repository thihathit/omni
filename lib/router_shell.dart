import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class RouterShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final Widget menu; // Accepts ANY custom navigation widget layout

  const RouterShell({
    required this.navigationShell,
    required this.menu,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Container(
      color: const Color(0xFF000000), // Core OLED black layer
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            // Dynamic Horizontal Sliding Canvas Content
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              switchInCurve: Curves.easeOutCubic,
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.06, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: KeyedSubtree(
                key: ValueKey<int>(navigationShell.currentIndex),
                child: navigationShell,
              ),
            ),

            // Pinned Navigation Widget Insertion Slot
            Positioned(
              left: 20,
              right: 20,
              bottom: bottomPadding + 20,
              child: menu, // Dynamically rendered custom widget
            ),
          ],
        ),
      ),
    );
  }
}
