import 'package:flutter/material.dart';

class RangeSliderColorWidget extends StatefulWidget {
  RangeSliderColorWidget({Key key}) : super(key: key);

  @override
  _RangeSliderColorWidgetState createState() => _RangeSliderColorWidgetState();
}

class _RangeSliderColorWidgetState extends State<RangeSliderColorWidget> {
  RangeValues values = RangeValues(10, 90);

  @override
  Widget build(BuildContext context) => SliderTheme(
        data: SliderThemeData(
          /// thumb color
          thumbColor: Colors.green,

          /// track color
          activeTrackColor: Colors.green.shade200,
          inactiveTrackColor: Colors.black12,

          /// ticks in between
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSlider(
              values: values,
              min: 0,
              max: 100,
              divisions: 20,
              labels: RangeLabels(
                values.start.round().toString(),
                values.end.round().toString(),
              ),
              onChanged: (values) => setState(() => this.values = values),
            ),
            const SizedBox(height: 16),
            RangeSlider(
              values: values,
              min: 0,
              max: 100,
              divisions: 20,
              activeColor: Colors.red,
              inactiveColor: Colors.red.shade100,
              labels: RangeLabels(
                values.start.round().toString(),
                values.end.round().toString(),
              ),
              onChanged: (values) => setState(() => this.values = values),
            ),
          ],
        ),
      );
}
