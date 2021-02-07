import 'package:flutter/material.dart';
import 'package:range_slider_example/custom_slider_theme.dart';
import 'package:range_slider_example/utils.dart';

class RangeSliderShapeWidget extends StatefulWidget {
  @override
  _RangeSliderShapeWidgetState createState() => _RangeSliderShapeWidgetState();
}

class _RangeSliderShapeWidgetState extends State<RangeSliderShapeWidget> {
  static final labels = ['0', '18', '30', '50', '+'];
  static final double min = 0;
  static final double max = labels.length - 1.0;

  RangeValues values = RangeValues(0, 2);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: Utils.modelBuilder(
                labels,
                (index, label) {
                  final selectedColor = Colors.black;
                  final unselectedColor = Colors.black.withOpacity(0.3);
                  final isSelected =
                      index >= values.start && index <= values.end;
                  final color = isSelected ? selectedColor : unselectedColor;

                  return buildLabel(label: label, color: color);
                },
              ),
            ),
          ),
          CustomSliderTheme(
            child: RangeSlider(
              values: values,
              min: min,
              max: max,
              divisions: (max - min).toInt(),
              onChanged: (values) => setState(() => this.values = values),
            ),
          ),
        ],
      );

  Widget buildLabel({
    @required String label,
    @required Color color,
  }) =>
      Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ).copyWith(color: color),
      );
}
