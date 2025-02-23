// autor - <a.a.ustinoff@gmail.com> Anton Ustinoff

import 'package:flutter/material.dart';

/// {@template check_box_rounded}
/// CheckBoxRounded widget.
///
/// Widget that draw a beautiful checkbox rounded.
/// Provided with animation if wanted.
/// {@endtemplate}
class CheckBoxRounded extends StatefulWidget {
  /// {@macro check_box_rounded}
  const CheckBoxRounded({
    this.onTap,
    this.size,
    this.borderWidth = 1.0,
    this.borderColor,
    this.checkedColor,
    this.uncheckedColor,
    this.checkedWidget,
    this.uncheckedWidget,
    this.animationDuration,
    this.isChecked,
    this.disable = false,
    super.key,
  });

  /// Define wether the checkbox is marked or not
  final bool? isChecked;

  /// Defines interactive changing [isChecked] value on tap gesture
  final bool disable;

  /// Define the size of the checkbox
  final double? size;

  /// Define the width of the border checkbox
  final double borderWidth;

  /// Define the border of the widget
  final Color? borderColor;

  /// Define the color that is shown when Widgets is checked
  final Color? checkedColor;

  /// Define the color that is shown when Widgets is unchecked
  final Color? uncheckedColor;

  /// Define the widget that is shown when Widgets is checked
  final Widget? checkedWidget;

  /// Define the widget that is shown when Widgets is unchecked
  final Widget? uncheckedWidget;

  /// Define Function that os executed when user tap on checkbox
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool? value)? onTap;

  /// Define the duration of the animation. If any
  final Duration? animationDuration;

  @override
  State<CheckBoxRounded> createState() => _CheckBoxRoundedState();
}

/// State of the [CheckBoxRounded].
class _CheckBoxRoundedState extends State<CheckBoxRounded> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    if (widget.isChecked != null) _isChecked = widget.isChecked ?? false;
  }

  @override
  void didUpdateWidget(covariant CheckBoxRounded oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isChecked != null && oldWidget.isChecked != widget.isChecked) {
      _isChecked = widget.isChecked!;
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(
      debugCheckHasMaterial(context),
      'A Material widget is required to draw a checkbox',
    );

    final ThemeData themeData = Theme.of(context);
    final double effectiveIconSize = widget.size ?? 24.0;

    final Color effectiveBorderColor =
        widget.borderColor ?? themeData.dividerColor;

    final Color effectiveCheckedColor =
        widget.checkedColor ?? themeData.colorScheme.secondary;

    final Color effectiveUncheckedColor =
        widget.uncheckedColor ?? themeData.scaffoldBackgroundColor;

    final Duration effectiveAnimationDuration =
        widget.animationDuration ?? const Duration(milliseconds: 100);

    final Widget checkedWidget = widget.checkedWidget ??
        Icon(
          Icons.check_rounded,
          color: Colors.white,
          size: effectiveIconSize / 1.2,
        );

    final Widget uncheckedWidget = widget.uncheckedWidget != null
        ? SizedBox(child: widget.uncheckedWidget)
        : const SizedBox.shrink();

    final bool useDecoration =
        widget.checkedWidget == null && widget.uncheckedWidget == null;

    final Widget child = ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: AnimatedContainer(
        duration: effectiveAnimationDuration,
        width: effectiveIconSize,
        height: effectiveIconSize,
        decoration: useDecoration
            ? BoxDecoration(
                border: Border.all(
                  width: widget.borderWidth,
                  color: _isChecked ? Colors.transparent : effectiveBorderColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                color: _isChecked
                    ? effectiveCheckedColor
                    : effectiveUncheckedColor,
              )
            : null,
        child: _isChecked ? checkedWidget : uncheckedWidget,
      ),
    );

    return widget.disable
        ? child
        : GestureDetector(
            onTap: () {
              widget.onTap?.call(!_isChecked);
              setState(() => _isChecked = !_isChecked);
            },
            child: child,
          );
  }
}
