# Flutter Check Box Rounded

[![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://github.com/tenhobi/effective_dart)

## Description

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
<img src=".images/1.png" width="375" alt="enter image description here">

## Customize to your needs
You can customize all sort of behaviors and look you want. You can do things like setting selected/unselected color, selected/unselected
widgets, duration of the animation, etc.

The next example show some of the customizations.

<!-- ![enter image description here](http://g.recordit.co/8rtRTco6SE.gif) -->
<img src=".images/2.png" width="375" alt="enter image description here">