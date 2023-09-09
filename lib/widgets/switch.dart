import 'package:flutter/material.dart';

class DrawerSwitch extends StatefulWidget {
  const DrawerSwitch({super.key});

  @override
  State<DrawerSwitch> createState() => _DrawerSwitchState();
}

class _DrawerSwitchState extends State<DrawerSwitch> {
  bool darkmode = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: darkmode,
        activeColor: Colors.red,
        onChanged: (value) {
          setState(() {
            darkmode = value;
          });
        });
  }
}
