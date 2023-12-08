import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';

const _verticalSpacing = SizedBox(height: 20);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Check Box Rounded Example',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CheckBoxView(),
    );
  }
}

class CheckBoxView extends StatefulWidget {
  const CheckBoxView({Key? key}) : super(key: key);

  @override
  _CheckBoxViewState createState() => _CheckBoxViewState();
}

class _CheckBoxViewState extends State<CheckBoxView> {
  bool? _isChecked;

  @override
  void initState() {
    _isChecked = true;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).scaffoldBackgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CheckBoxRounded(
              onTap: (bool? value) {},
            ),
            _verticalSpacing,
            CheckBoxRounded(
              onTap: (bool? value) {},
              uncheckedWidget: const Icon(Icons.close, size: 20),
              animationDuration: const Duration(milliseconds: 50),
            ),
            _verticalSpacing,
            CheckBoxRounded(
              onTap: (bool? value) {},
              animationDuration: const Duration(seconds: 1),
              uncheckedWidget: const Icon(Icons.mood_bad, size: 20),
              checkedWidget: const Icon(
                Icons.mood,
                color: Colors.white,
                size: 20,
              ),
            ),
            _verticalSpacing,
            CheckBoxRounded(
              isChecked: true,
              uncheckedWidget: const Icon(Icons.close, size: 20),
              onTap: (bool? value) => debugPrint(value.toString()),
            ),
            _verticalSpacing,
            CheckBoxRounded(
              onTap: (bool? value) {},
              uncheckedColor: Colors.red,
              uncheckedWidget: const Icon(
                Icons.close_rounded,
                color: Colors.white,
                size: 55 / 1.2,
              ),
              size: 55,
            ),
            _verticalSpacing,
            CheckBoxRounded(
              onTap: (bool? value) {},
              uncheckedColor: Colors.yellow,
              size: 77,
            ),
            _verticalSpacing,
            CheckBoxRounded(
              size: 88,
              isChecked: _isChecked,
              onTap: (bool? value) {
                setState(() {
                  _isChecked = value;
                });
              },
            ),
            _verticalSpacing,
          ],
        ),
      ),
    );
  }
}
