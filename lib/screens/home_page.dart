import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../controller/scale_controller.dart';
import '../model/scale.dart';
import '../utils/color_palette.dart';
import '../utils/strings.dart';
import '../widgets/scale_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime actualDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
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
          ),
          FutureBuilder<List<Scale>>(
            initialData: const [],
            future: ScaleController().getScalesByDate(actualDate),
            builder:
                (BuildContext context, AsyncSnapshot<List<Scale>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text("");
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text(Strings.messageLoadingScales),
                        )
                      ],
                    ),
                  );
                case ConnectionState.active:
                  return const Text("");
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    List<Scale> scales = snapshot.data!;
                    scales.sort((a, b) => a.hour.isAfter(b.hour) ? 1 : -1);
                    if (scales.isNotEmpty) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return ScaleTile(scales[index]);
                          });
                    } else {
                      return const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(Strings.messageNoScalesForDay),
                      );
                    }
                  } else {
                    return Column(
                      children: [
                        const SizedBox(
                          width: 60,
                          height: 60,
                        ),
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Center(
                            child: Text(
                                '${Strings.messageServiceUnavailable} ${snapshot.hashCode}'),
                          ),
                        )
                      ],
                    );
                  }
              }
            },
          ),
        ],
      ),
    );
  }

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
}
