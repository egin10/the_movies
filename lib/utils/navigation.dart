import 'package:flutter/material.dart';

navigateTo(BuildContext context, MaterialPageRoute route) {
  Navigator.push(context, route);
}

navigateBack(BuildContext context) {
  Navigator.pop(context);
}
