import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:omni/router_info.dart';

class RiderMenu extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const RiderMenu({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Get the current active URL path directly from GoRouter's current frame state
    final String currentPath = GoRouterState.of(context).matchedLocation;

    return Container(
      height: 64,
      color: const Color(0xFF111111),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 2. Pass strings directly to match your Router Config perfectly
          _buildItem(context, 'Home Dashboard', RIDER_HOME, currentPath),
          _buildItem(context, 'My Profile', RIDER_PROFILE, currentPath),
        ],
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    String label,
    String targetPath,
    String currentPath,
  ) {
    // String matching handles everything safely without indexing math
    final bool isSelected = currentPath == targetPath;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // Go directly to the path string. GoRouter handles branch switching under the hood!
        GoRouter.of(context).go(targetPath);
      },
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? const Color(0xFF00FF66)
                : const Color(0xFF555555),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
