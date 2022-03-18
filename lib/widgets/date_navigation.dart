import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ministerial_scale_app/utils/color_palette.dart';

import '../utils/strings.dart';

class DateNavigation extends StatefulWidget {
  final DateTime date;

  const DateNavigation(this.date, {Key? key}) : super(key: key);

  @override
  State<DateNavigation> createState() => _DateNavigationState();
}

class _DateNavigationState extends State<DateNavigation> {
  late DateTime actualDate;
  void _incrementDate() {
    setState(() {
      actualDate.add(const Duration(days: 1));
    });
  }

  void _decrementDate() {
    setState(() {
      actualDate.subtract(const Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    actualDate = widget.date;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: ColorPalette.primaryVariant,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: _decrementDate,
            child: const Icon(
              Icons.arrow_circle_left,
              color: Colors.white,
            ),
          ),
          Text(
            DateFormat(Strings.dateFormatBrazilian).format(actualDate),
          ),
          GestureDetector(
            onTap: _incrementDate,
            child: const Icon(
              Icons.arrow_circle_right,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
