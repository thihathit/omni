import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:omni/router_info.dart';

class MerchantMenu extends StatelessWidget {
  const MerchantMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentPath = GoRouter.of(
      context,
    ).routeInformationProvider.value.uri.path;

    return Container(
      height: 64,
      color: const Color(0xFF0A0A0A),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(
            context,
            'Store Portal',
            MERCHANT_HOME,
            currentPath == MERCHANT_HOME,
          ),
          _buildItem(
            context,
            'Merchant Profile',
            MERCHANT_PROFILE,
            currentPath == MERCHANT_PROFILE,
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
                ? const Color(0xFFFFFFFF)
                : const Color(0xFF444444),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
