import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:omni/router_info.dart';

class MerchantMenu extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MerchantMenu({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    final String currentPath = GoRouterState.of(context).matchedLocation;

    return Container(
      height: 64,
      color: const Color(0xFF0A0A0A),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(context, 'Store Portal', MERCHANT_HOME, currentPath),
          _buildItem(
            context,
            'Merchant Profile',
            MERCHANT_PROFILE,
            currentPath,
          ),
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
    final bool isSelected = currentPath == targetPath;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        GoRouter.of(context).go(targetPath);
      },
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? const Color(0xFFFFFFFF)
                : const Color(0xFF444444),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
