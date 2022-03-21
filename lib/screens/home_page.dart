import 'package:flutter/material.dart';

import '../controller/scale_controller.dart';
import '../model/scale.dart';
import '../widgets/date_navigation.dart';
import '../widgets/scale_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Column(
        children: [
          DateNavigation(DateTime.now()),
          FutureBuilder<List<Scale>>(
            future: ScaleController().getScalesByDate(DateTime.now()),
            builder:
                (BuildContext context, AsyncSnapshot<List<Scale>> snapshot) {
              if (snapshot.hasData) {
                List<Scale>? scales = snapshot.data;
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return ScaleTile(scales![index]);
                    });
              } else {
                if (snapshot.hasError) {
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
                        child: Text('Error: ${snapshot.hashCode}'),
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: Column(
                      children: const [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Carregando as escalas...'),
                        )
                      ],
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
