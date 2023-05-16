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

<!-- http://g.recordit.co/QYABeKPzNR.gif -->
![enter image description here](https://prnt.sc/-ko8NH-MYrk8)

## Customize to your needs
You can customize all sort of behaviors and look you want. You can do things like setting selected/unselected color, selected/unselected
widgets, duration of the animation, etc.

The next example show some of the customizations.

<!-- http://g.recordit.co/8rtRTco6SE.gif -->
![enter image description here](https://prnt.sc/4F0dYCvM-ktC)