import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:omni/router_info.dart';

class RiderMenu extends StatelessWidget {
  const RiderMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentPath = GoRouter.of(
      context,
    ).routeInformationProvider.value.uri.path;

    return Container(
      height: 64,
      color: const Color(0xFF111111),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(
            context,
            'Home Dashboard',
            RIDER_HOME,
            currentPath == RIDER_HOME,
          ),
          _buildItem(
            context,
            'My Profile',
            RIDER_PROFILE,
            currentPath == RIDER_PROFILE,
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    String label,
    String path,
    bool isSelected,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.go(path),
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
