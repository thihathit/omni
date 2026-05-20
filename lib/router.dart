import 'package:go_router/go_router.dart';
import 'package:omni/components/merchant_menu.dart';
import 'package:omni/components/rider_menu.dart';
import 'package:omni/screens/login.dart';
import 'package:omni/router_shell.dart';
import 'package:omni/screens/merchant_home.dart';
import 'package:omni/screens/merchant_profile.dart';
import 'package:omni/screens/rider_home.dart';
import 'package:omni/screens/rider_profile.dart';
import 'package:omni/router_info.dart' as info;

final router = GoRouter(
  initialLocation: info.RIDER_HOME,
  routes: [
    // --- ONBOARDING PORTAL (Flat Routes, Zero Menus) ---
    GoRoute(path: info.LOGIN, builder: (context, state) => const Login()),

    // --- RIDER PORTAL (Nested Stateful Workspace) ---
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          RouterShell(navigationShell: navigationShell, menu: RiderMenu()),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: info.RIDER_HOME,
              builder: (context, state) => const RiderHome(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: info.RIDER_PROFILE,
              builder: (context, state) => const RiderProfile(),
            ),
          ],
        ),
      ],
    ),

    // --- MERCHANT PORTAL (Nested Stateful Workspace) ---
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          RouterShell(navigationShell: navigationShell, menu: MerchantMenu()),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: info.MERCHANT_HOME,
              builder: (context, state) => const MerchantHome(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: info.MERCHANT_PROFILE,
              builder: (context, state) => const MerchantProfile(),
            ),
          ],
        ),
      ],
    ),
  ],
);
