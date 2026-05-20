import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class RouterShell extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final Widget menu;

  const RouterShell({
    required this.navigationShell,
    required this.menu,
    super.key,
  });

  @override
  State<RouterShell> createState() => _RouterShellState();
}

class _RouterShellState extends State<RouterShell>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Offset> _slide;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 220),
      vsync: this,
      value: 1.0, // already complete on first render
    );
    _slide = _buildSlide(Offset.zero); // no-op on init
    _fade = _buildFade();
  }

  @override
  void didUpdateWidget(covariant RouterShell oldWidget) {
    super.didUpdateWidget(oldWidget);

    final oldIndex = oldWidget.navigationShell.currentIndex;
    final newIndex = widget.navigationShell.currentIndex;

    if (newIndex != oldIndex) {
      final double direction = newIndex > oldIndex ? 1.0 : -1.0;
      _slide = _buildSlide(Offset(0.06 * direction, 0.0));
      _fade = _buildFade();
      _controller.forward(from: 0.0);
    }
  }

  Animation<Offset> _buildSlide(Offset begin) => Tween<Offset>(
    begin: begin,
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

  Animation<double> _buildFade() =>
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Container(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            SlideTransition(
              position: _slide,
              child: FadeTransition(
                opacity: _fade,
                child: widget.navigationShell,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: bottomPadding + 20,
              child: widget.menu,
            ),
          ],
        ),
      ),
    );
  }
}
