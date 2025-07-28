import 'dart:ui';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final Color? backgroundColor;
  final Color? indicatorColor;
  final double? indicatorSize;

  const LoadingWidget({
    super.key,
    this.backgroundColor,
    this.indicatorColor,
    this.indicatorSize,
  });

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double indicatorSize = widget.indicatorSize ?? 48.0;
    return Positioned.fill(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: widget.backgroundColor ?? Colors.black26.withOpacity(0.2),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Container(),
              ),
            ),
            Positioned.fill(
              child: Center(
                child: SizedBox(
                  width: indicatorSize,
                  height: indicatorSize,
                  child: CircularProgressIndicator(
                    color: widget.indicatorColor ?? Theme.of(context).colorScheme.primary,
                    strokeWidth: 4.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
