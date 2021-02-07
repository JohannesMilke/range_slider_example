import 'package:flutter/material.dart';

class RangeSliderSizeWidget extends StatefulWidget {
  RangeSliderSizeWidget({Key key}) : super(key: key);

  @override
  _RangeSliderSizeWidgetState createState() => _RangeSliderSizeWidgetState();
}

class _RangeSliderSizeWidgetState extends State<RangeSliderSizeWidget> {
  RangeValues values = RangeValues(10, 40);

  @override
  Widget build(BuildContext context) {
    final double min = 0;
    final double max = 50;

    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 10,
        rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 15),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),

        /// ticks in between
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            child: RangeSlider(
              values: values,
              min: min,
              max: max,
              divisions: 50,
              labels: RangeLabels(
                values.start.round().toString(),
                values.end.round().toString(),
              ),
              onChanged: (values) => setState(() => this.values = values),
            ),
          ),
          const SizedBox(height: 16),
          RangeSlider(
            values: values,
            min: min,
            max: max,
            divisions: 50,
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
}
