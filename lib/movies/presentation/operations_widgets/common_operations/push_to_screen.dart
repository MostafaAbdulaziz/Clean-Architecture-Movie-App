import 'package:flutter/material.dart';

void pushToScreen(BuildContext context, Widget screen) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
