[![Pub Version](https://img.shields.io/pub/v/badges?color=blueviolet)](https://pub.dev/packages/flutter_check_box_rounded)
[![popularity](https://img.shields.io/pub/popularity/badges?logo=dart)](https://pub.dev/packages/flutter_check_box_rounded/score)
[![likes](https://img.shields.io/pub/likes/badges?logo=dart)](https://pub.dev/packages/flutter_check_box_rounded/score)
[![style: flutter lints](https://img.shields.io/badge/style-flutter__lints-blue)](https://pub.dev/packages/flutter_lints)

# flutter_check_box_rounded

### Description

Package created to give a fully functional and customizable rounded CheckBox.

### Installation

Add App Version Checker to your pubspec:

```yaml
dependencies:
  flutter_check_box_rounded: any # or the latest version on Pub
```

### Example

The most simple use is this one. A prepared round checkbox that has a callback when selected/unselected.

```dart
CheckBoxRounded(
 onTap: (bool? value) {},
),
```

That will generate this:

<!-- ![enter image description here](http://g.recordit.co/QYABeKPzNR.gif) -->
<img src="https://github.com/ziqq/flutter_check_box_rounded/blob/main/.images/1.png" width="375" alt="enter image description here">

### Customize to your needs
You can customize all sort of behaviors and look you want. You can do things like setting selected/unselected color, selected/unselected
widgets, duration of the animation, etc.

The next example show some of the customizations.

<!-- ![enter image description here](http://g.recordit.co/8rtRTco6SE.gif) -->
<img src="https://github.com/ziqq/flutter_check_box_rounded/blob/main/.images/2.png" width="375" alt="enter image description here">
