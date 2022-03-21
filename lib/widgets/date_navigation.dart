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
  late DateTime actualDate = widget.date;

  void _incrementDate() {
    setState(() {
      actualDate = actualDate.add(const Duration(days: 1));
    });
  }

  void _decrementDate() {
    setState(() {
      actualDate = actualDate.subtract(const Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: ColorPalette.primaryVariant,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: _decrementDate,
            child: const Icon(
              Icons.arrow_circle_left,
              color: Colors.white,
            ),
          ),
          Text(
            DateFormat(Strings.dateFormatBrazilian).format(actualDate),
          ),
          InkWell(
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
