library side_panel;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A controller for the [SidePanel].
///
/// This class holds the state for the [SidePanel] and provides methods to show
/// and hide the panels.
class SidePanelController {
  /// Show the right panel.
  ///
  /// This is a callback that is passed to the [SidePanel] widget and is called
  /// when the right panel should be shown.
  void Function() showRightPanel = () {};

  /// Hide the right panel.
  ///
  /// This is a callback that is passed to the [SidePanel] widget and is called
  /// when the right panel should be hidden.
  void Function() hideRightPanel = () {};

  /// Show the left panel.
  ///
  /// This is a callback that is passed to the [SidePanel] widget and is called
  /// when the left panel should be shown.
  void Function() showLeftPanel = () {};

  /// Hide the left panel.
  ///
  /// This is a callback that is passed to the [SidePanel] widget and is called
  /// when the left panel should be hidden.
  void Function() hideLeftPanel = () {};

  /// Show the top panel.
  ///
  /// This is a callback that is passed to the [SidePanel] widget and is called
  /// when the top panel should be shown.
  void Function() showTopPanel = () {};

  /// Hide the top panel.
  ///
  /// This is a callback that is passed to the [SidePanel] widget and is called
  /// when the top panel should be hidden.
  void Function() hideTopPanel = () {};

  /// Show the bottom panel.
  ///
  /// This is a callback that is passed to the [SidePanel] widget and is called
  /// when the bottom panel should be shown.
  void Function() showBottomPanel = () {};

  /// Hide the bottom panel.
  ///
  /// This is a callback that is passed to the [SidePanel] widget and is called
  /// when the bottom panel should be hidden.
  void Function() hideBottomPanel = () {};
}

/// A panel that can be used in the [SidePanel] widget.
///
/// [Panel] is a simple class that contains a [size] and a [child] widget.
class Panel {
  /// The size of the panel.
  ///
  /// The size is the width of the panel when it is positioned on the left or
  /// right side of the screen, and the height of the panel when it is positioned
  /// on the top or bottom side of the screen.
  ///
  /// The default size is 300.
  final double size;

  /// The widget that is displayed in the panel.
  ///
  /// The [child] widget is displayed in the panel and is used to provide the
  /// content of the panel.
  final Widget child;

  /// Whether the panel should be displayed as an overlay.
  ///
  /// When [overlay] is true, the panel is displayed as an overlay over the
  /// screen. When it is false, the panel is displayed as a normal widget.
  ///
  /// The default value is false.
  final bool overlay;

  /// Create a new [Panel] with the given [size], [child], and [overlay].
  ///
  /// The [size] parameter is the width of the panel when it is positioned on the
  /// left or right side of the screen, and the height of the panel when it is
  /// positioned on the top or bottom side of the screen. The default value is 300.
  ///
  /// The [child] parameter is the widget that is displayed in the panel and is
  /// used to provide the content of the panel.
  ///
  /// The [overlay] parameter determines whether the panel should be displayed as
  /// an overlay over the screen. When it is true, the panel is displayed as an
  /// overlay over the screen. When it is false, the panel is displayed as a normal
  /// widget. The default value is false.
  Panel({
    this.size = 300,
    this.overlay = false,
    required this.child,
  });
}

/// A widget that displays a panel on the side of the screen.
///
/// The panel can be displayed on the left, right, top, or bottom side of the
/// screen and can be animated in or out of view.
///
/// The [SidePanel] widget is a [StatefulWidget] and must be used in a widget tree
/// that is managed by a [StatefulWidget].
///
/// The [SidePanel] widget takes four parameters:
///   - [right]: The panel that is displayed on the right side of the screen.
///   - [left]: The panel that is displayed on the left side of the screen.
///   - [top]: The panel that is displayed on the top side of the screen.
///   - [bottom]: The panel that is displayed on the bottom side of the screen.
///   - [controller]: The controller that is used to manage the state of the
///       [SidePanel] widget.
///   - [child]: The child widget that is displayed in the [SidePanel] widget.
///   - [animatedDuration]: The duration of the animation when the panel is
///       displayed or hidden. The default value is 300 milliseconds.
class SidePanel extends StatefulWidget {
  const SidePanel({
    super.key,
    this.right,
    this.left,
    this.top,
    this.bottom,
    this.controller,
    required this.child,
    this.animatedDuration = const Duration(milliseconds: 300),
  });

  /// The panel that is displayed on the right side of the screen.
  ///
  /// The [right] panel is displayed on the right side of the screen and is used
  /// to provide the content of the right panel.
  ///
  /// The [right] panel is optional and defaults to null.
  final Panel? right;

  /// The panel that is displayed on the left side of the screen.
  ///
  /// The [left] panel is displayed on the left side of the screen and is used
  /// to provide the content of the left panel.
  ///
  /// The [left] panel is optional and defaults to null.
  final Panel? left;

  /// The panel that is displayed on the top side of the screen.
  ///
  /// The [top] panel is displayed on the top side of the screen and is used
  /// to provide the content of the top panel.
  ///
  /// The [top] panel is optional and defaults to null.
  final Panel? top;

  /// The panel that is displayed on the bottom side of the screen.
  ///
  /// The [bottom] panel is displayed on the bottom side of the screen and is
  /// used to provide the content of the bottom panel.
  ///
  /// The [bottom] panel is optional and defaults to null.
  final Panel? bottom;

  /// The content of the main panel.
  ///
  /// The [child] widget is displayed in the main panel and is used to provide
  /// the content of the panel.
  ///
  /// The [child] widget is required and must not be null.
  final Widget child;

  /// The controller that is used to control the panels.
  ///
  /// The [controller] is used to control the panels and is used to provide the
  /// content of the panels.
  ///
  /// The [controller] is optional and defaults to null.
  final SidePanelController? controller;

  /// The duration of the animation that is used to show and hide the panels.
  ///
  /// The [animatedDuration] is used to control the duration of the animation
  /// that is used to show and hide the panels.
  ///
  /// The [animatedDuration] is optional and defaults to 300 milliseconds.
  final Duration animatedDuration;

  @override
  State<SidePanel> createState() => SidePanelState();
}

class SidePanelState extends State<SidePanel> {
  bool _isShowRightPanel = false;
  bool _isShowLeftPanel = false;
  bool _isShowTopPanel = false;
  bool _isShowBottomPanel = false;

  @override
  void initState() {
    super.initState();

    if (widget.controller != null) {
      widget.controller!.showRightPanel = _showRightPanel;
      widget.controller!.hideRightPanel = _hideRightPanel;
      widget.controller!.showLeftPanel = _showLeftPanel;
      widget.controller!.hideLeftPanel = _hideLeftPanel;
      widget.controller!.showTopPanel = _showTopPanel;
      widget.controller!.hideTopPanel = _hideTopPanel;
      widget.controller!.showBottomPanel = _showBottomPanel;
      widget.controller!.hideBottomPanel = _hideBottomPanel;
    }
  }

  void _showRightPanel() {
    if (widget.right == null) return;
    if (widget.right!.overlay) {
      Navigator.of(context).push(_showOverlay(right: widget.right!));
    } else {
      setState(() {
        _isShowRightPanel = true;
      });
    }
  }

  void _hideRightPanel() {
    if (widget.right == null) return;
    setState(() {
      _isShowRightPanel = false;
    });
  }

  void _showLeftPanel() {
    if (widget.left == null) return;
    if (widget.left!.overlay) {
      Navigator.of(context).push(_showOverlay(left: widget.left!));
    } else {
      setState(() {
        _isShowLeftPanel = true;
      });
    }
  }

  void _hideLeftPanel() {
    if (widget.left == null) return;
    setState(() {
      _isShowLeftPanel = false;
    });
  }

  void _showTopPanel() {
    if (widget.top == null) return;
    if (widget.top!.overlay) {
      Navigator.of(context).push(_showOverlay(top: widget.top!));
    } else {
      setState(() {
        _isShowTopPanel = true;
      });
    }
  }

  void _hideTopPanel() {
    if (widget.top == null) return;
    setState(() {
      _isShowTopPanel = false;
    });
  }

  void _showBottomPanel() {
    if (widget.bottom == null) return;
    if (widget.bottom!.overlay) {
      Navigator.of(context).push(_showOverlay(bottom: widget.bottom!));
    } else {
      setState(() {
        _isShowBottomPanel = true;
      });
    }
  }

  void _hideBottomPanel() {
    if (widget.bottom == null) return;
    setState(() {
      _isShowBottomPanel = false;
    });
  }

  Route _showOverlay({
    Panel? left,
    Panel? right,
    Panel? top,
    Panel? bottom,
  }) {
    assert(left != null || right != null || top != null || bottom != null);
    late Widget child;
    late Offset begin;
    late Alignment alignment;

    if (left != null) {
      child = SizedBox(width: left.size, child: left.child);
      begin = const Offset(-1.0, 0.0);
      alignment = Alignment.centerLeft;
    } else if (right != null) {
      child = SizedBox(width: right.size, child: right.child);
      begin = const Offset(1.0, 0.0);
      alignment = Alignment.centerRight;
    } else if (top != null) {
      child = SizedBox(height: top.size, child: top.child);
      begin = const Offset(0.0, -1.0);
      alignment = Alignment.topCenter;
    } else if (bottom != null) {
      child = SizedBox(height: bottom.size, child: bottom.child);
      begin = const Offset(0.0, 1.0);
      alignment = Alignment.bottomCenter;
    }

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween<Offset>(
          begin: begin,
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut));

        return SlideTransition(
          position: animation.drive(tween),
          child: Align(
            alignment: alignment,
            child: Material(child: child),
          ),
        );
      },
      opaque: false,
      barrierDismissible: true,
      barrierColor: const Color.fromRGBO(100, 100, 100, 0.5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedContainer(
            margin: EdgeInsets.only(
              right: _isShowRightPanel && widget.right?.overlay != true
                  ? widget.right!.size
                  : 0,
              left: _isShowLeftPanel && widget.left?.overlay != true
                  ? widget.left!.size
                  : 0,
              top: _isShowTopPanel && widget.top?.overlay != true
                  ? widget.top!.size
                  : 0,
              bottom: _isShowBottomPanel && widget.bottom?.overlay != true
                  ? widget.bottom!.size
                  : 0,
            ),
            duration: widget.animatedDuration,
            child: widget.child,
          ),
        ),
        if (widget.right != null && !widget.right!.overlay)
          AnimatedPositioned(
            top: 0,
            bottom: 0,
            duration: widget.animatedDuration,
            right: _isShowRightPanel ? 0 : -widget.right!.size,
            child: SizedBox(
              width: widget.right!.size,
              child: widget.right!.child,
            ),
          ),
        if (widget.left != null && !widget.left!.overlay)
          AnimatedPositioned(
            top: 0,
            bottom: 0,
            duration: widget.animatedDuration,
            left: _isShowLeftPanel ? 0 : -widget.left!.size,
            child: SizedBox(
              width: widget.left!.size,
              child: widget.left!.child,
            ),
          ),
        if (widget.top != null && !widget.top!.overlay)
          AnimatedPositioned(
            left: 0,
            right: 0,
            duration: widget.animatedDuration,
            top: _isShowTopPanel ? 0 : -widget.top!.size,
            child: SizedBox(
              height: widget.top!.size,
              child: widget.top!.child,
            ),
          ),
        if (widget.bottom != null && !widget.bottom!.overlay)
          AnimatedPositioned(
            left: 0,
            right: 0,
            duration: widget.animatedDuration,
            bottom: _isShowBottomPanel ? 0 : -widget.bottom!.size,
            child: SizedBox(
              height: widget.bottom!.size,
              child: widget.bottom!.child,
            ),
          ),
      ],
    );
  }
}
