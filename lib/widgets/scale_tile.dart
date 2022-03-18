import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ministerial_scale_app/utils/color_palette.dart';

import '../model/scale.dart';
import '../utils/strings.dart';

class ScaleTile extends StatelessWidget {
  final Scale scale;

  const ScaleTile(this.scale, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorPalette.primaryVariant,
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                scale.place,
                style: Theme.of(context).textTheme.headline5,
              ),
              Row(
                children: [
                  Text(
                    DateFormat(Strings.dateFormatBrazilian).format(scale.date),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    DateFormat(Strings.hourFormatBrazilian).format(scale.hour),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              Text(
                scale.minister,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
