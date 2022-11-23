// autor - <a.a.ustinoff@gmail.com> Anton Ustinoff
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

///Widget that draw a beautiful checkbox rounded. Provided with animation if wanted
class CheckBoxRounded extends StatefulWidget {
  const CheckBoxRounded({
    Key? key,
    this.size,
    this.isChecked,
    this.borderColor,
    this.checkedColor,
    this.uncheckedColor,
    this.checkedWidget,
    this.uncheckedWidget,
    this.animationDuration,
    required this.onTap,
  }) : super(key: key);

  ///Define the size of the checkbox
  final double? size;

  ///Define wether the checkbox is marked or not
  final bool? isChecked;

  ///Define the border of the widget
  final Color? borderColor;

  ///Define the color that is shown when Widgets is checked
  final Color? checkedColor;

  ///Define the color that is shown when Widgets is unchecked
  final Color? uncheckedColor;

  ///Define the widget that is shown when Widgets is checked
  final Widget? checkedWidget;

  ///Define the widget that is shown when Widgets is unchecked
  final Widget? uncheckedWidget;

  ///Define Function that os executed when user tap on checkbox
  final Function(bool?) onTap;

  ///Define the duration of the animation. If any
  final Duration? animationDuration;

  @override
  State<CheckBoxRounded> createState() => _CheckBoxRoundedState();
}

class _CheckBoxRoundedState extends State<CheckBoxRounded> {
  late Duration animationDuration;
  late Widget uncheckedWidget;
  late Widget checkedWidget;
  late Color uncheckedColor;
  late Color checkedColor;
  late Color borderColor;
  late bool isChecked;
  late double size;

  @override
  void initState() {
    super.initState();
    size = widget.size ?? 24.0;
    isChecked = widget.isChecked ?? false;
    animationDuration =
        widget.animationDuration ?? const Duration(milliseconds: 100);
    uncheckedWidget = widget.uncheckedWidget != null
        ? SizedBox(child: widget.uncheckedWidget)
        : const SizedBox.shrink();
    checkedWidget = widget.checkedWidget ??
        Icon(Icons.check_rounded, color: Colors.white, size: size / 1.2);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      borderColor = widget.borderColor ?? Theme.of(context).dividerColor;
      checkedColor =
          widget.checkedColor ?? Theme.of(context).colorScheme.secondary;
      uncheckedColor =
          widget.uncheckedColor ?? Theme.of(context).scaffoldBackgroundColor;
    });
  }

  @override
  void didUpdateWidget(covariant CheckBoxRounded oldWidget) {
    if (oldWidget.isChecked != widget.isChecked) {
      isChecked = widget.isChecked!;
    }
    if (oldWidget.borderColor != widget.borderColor) {
      borderColor = widget.borderColor!;
    }
    if (oldWidget.checkedColor != widget.checkedColor) {
      checkedColor = widget.checkedColor!;
    }
    if (oldWidget.uncheckedColor != widget.uncheckedColor) {
      uncheckedColor = widget.uncheckedColor!;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    borderColor = widget.borderColor ?? Theme.of(context).dividerColor;
    checkedColor =
        widget.checkedColor ?? Theme.of(context).colorScheme.secondary;
    uncheckedColor =
        widget.uncheckedColor ?? Theme.of(context).scaffoldBackgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(!isChecked);
        setState(() => isChecked = !isChecked);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: AnimatedContainer(
          width: size,
          height: size,
          duration: animationDuration,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size / 2),
            color: isChecked ? checkedColor : uncheckedColor,
            border: Border.all(
              color: isChecked ? Colors.transparent : borderColor,
            ),
          ),
          child: isChecked ? checkedWidget : uncheckedWidget,
        ),
      ),
    );
  }
}
