import 'package:flutter/material.dart';
import 'package:range_slider_example/custom_slider_theme.dart';
import 'package:range_slider_example/utils.dart';

class RangeSliderLabelWidget extends StatefulWidget {
  RangeSliderLabelWidget({Key key}) : super(key: key);

  @override
  _RangeSliderLabelWidgetState createState() => _RangeSliderLabelWidgetState();
}

class _RangeSliderLabelWidgetState extends State<RangeSliderLabelWidget> {
  RangeValues values = RangeValues(10, 70);
  RangeValues valuesBottom = RangeValues(0, 2);

  @override
  Widget build(BuildContext context) => SliderTheme(
        data: SliderThemeData(
          /// ticks in between
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSliderSideLabel(),
            const SizedBox(height: 16),
            buildSliderTopLabel(),
          ],
        ),
      );

  Widget buildSliderSideLabel() {
    final double min = 0;
    final double max = 80;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSideLabel(min),
          Expanded(
            child: RangeSlider(
              values: values,
              min: min,
              max: max,
              divisions: 20,
              labels: RangeLabels(
                values.start.round().toString(),
                values.end.round().toString(),
              ),
              onChanged: (values) => setState(() => this.values = values),
            ),
          ),
          buildSideLabel(max),
        ],
      ),
    );
  }

  Widget buildSliderTopLabel() {
    final labels = ['0', '18', '30', '50', '+'];
    final double min = 0;
    final double max = labels.length - 1.0;
    final divisions = (max - min).toInt();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
                    index >= valuesBottom.start && index <= valuesBottom.end;
                final color = isSelected ? selectedColor : unselectedColor;

                return buildLabel(label: label, color: color);
              },
            ),
          ),
        ),
        RangeSlider(
          values: valuesBottom,
          min: min,
          max: max,
          divisions: divisions,
          onChanged: (values) => setState(() => this.valuesBottom = values),
        ),
      ],
    );
  }

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

  Widget buildSideLabel(double value) => Container(
        width: 30,
        child: Text(
          value.round().toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      );
}
