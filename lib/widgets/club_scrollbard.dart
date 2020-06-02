import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double _kScrollbarThickness = 4.0;
const Duration _kScrollbarFadeDuration = Duration(milliseconds: 300);
const Duration _kScrollbarTimeToFade = Duration(milliseconds: 600);

class ClubScrollbar extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final bool isAlwaysShown;
  final double thickness;
  final Color color;

  const ClubScrollbar({
    Key key,
    @required this.child,
    this.controller,
    this.isAlwaysShown = false,
    this.thickness = _kScrollbarThickness,
    this.color,
  }) : super(key: key);

  @override
  _ClubScrollbarState createState() => _ClubScrollbarState();
}

class _ClubScrollbarState extends State<ClubScrollbar> with TickerProviderStateMixin {
  ScrollbarPainter _materialPainter;
  TextDirection _textDirection;
  Color _themeColor;
  bool _useCupertinoScrollbar;
  AnimationController _fadeoutAnimationController;
  Animation<double> _fadeoutOpacityAnimation;
  Timer _fadeoutTimer;

  @override
  void initState() {
    super.initState();
    _fadeoutAnimationController = AnimationController(
      vsync: this,
      duration: _kScrollbarFadeDuration,
    );
    _fadeoutOpacityAnimation = CurvedAnimation(
      parent: _fadeoutAnimationController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    assert((() {
      _useCupertinoScrollbar = null;
      return true;
    })());
    final theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        _fadeoutTimer?.cancel();
        _fadeoutTimer = null;
        _fadeoutAnimationController.reset();
        _useCupertinoScrollbar = true;
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        _themeColor = widget.color ?? theme.highlightColor.withOpacity(1.0);
        _textDirection = Directionality.of(context);
        _materialPainter = _buildMaterialScrollbarPainter();
        _useCupertinoScrollbar = false;
        WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
          if (widget.isAlwaysShown) {
            assert(widget.controller != null);
            widget.controller.position.didUpdateScrollPositionBy(0);
          }
        });
        break;
    }
    assert(_useCupertinoScrollbar != null);
  }

  @override
  void didUpdateWidget(ClubScrollbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAlwaysShown != oldWidget.isAlwaysShown) {
      assert(widget.controller != null);
      if (widget.isAlwaysShown == false) {
        _fadeoutAnimationController.reverse();
      } else {
        _fadeoutAnimationController.animateTo(1.0);
      }
    }
  }

  ScrollbarPainter _buildMaterialScrollbarPainter() {
    return ScrollbarPainter(
      color: _themeColor,
      radius: Radius.circular(widget.thickness / 2),
      textDirection: _textDirection,
      thickness: widget.thickness,
      fadeoutOpacityAnimation: _fadeoutOpacityAnimation,
      padding: MediaQuery.of(context).padding,
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    final ScrollMetrics metrics = notification.metrics;
    if (metrics.maxScrollExtent <= metrics.minScrollExtent) {
      return false;
    }

    if (!_useCupertinoScrollbar &&
        (notification is ScrollUpdateNotification ||
            notification is OverscrollNotification)) {
      if (_fadeoutAnimationController.status != AnimationStatus.forward) {
        _fadeoutAnimationController.forward();
      }

      _materialPainter.update(
        notification.metrics,
        notification.metrics.axisDirection,
      );
      if (!widget.isAlwaysShown) {
        _fadeoutTimer?.cancel();
        _fadeoutTimer = Timer(_kScrollbarTimeToFade, () {
          _fadeoutAnimationController.reverse();
          _fadeoutTimer = null;
        });
      }
    }
    return false;
  }

  @override
  void dispose() {
    _fadeoutAnimationController.dispose();
    _fadeoutTimer?.cancel();
    _materialPainter?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_useCupertinoScrollbar) {
      return CupertinoScrollbar(
        child: widget.child,
        isAlwaysShown: widget.isAlwaysShown,
        controller: widget.controller,
      );
    }
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: RepaintBoundary(
        child: CustomPaint(
          foregroundPainter: _materialPainter,
          child: RepaintBoundary(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
