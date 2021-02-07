import 'package:flutter/material.dart';
import 'package:range_slider_example/widget/rangeslider/range_slider_color_widget.dart';
import 'package:range_slider_example/widget/rangeslider/range_slider_label_widget.dart';
import 'package:range_slider_example/widget/rangeslider/range_slider_shape_widget.dart';
import 'package:range_slider_example/widget/rangeslider/range_slider_size_widget.dart';
import 'package:range_slider_example/widget/tabbar_widget.dart';

class RangeSliderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Range Sliders',
        tabs: [
          Tab(icon: Icon(Icons.color_lens), text: 'Colors'),
          Tab(icon: Icon(Icons.photo_size_select_large), text: 'Size'),
          Tab(icon: Icon(Icons.text_fields), text: 'Labels'),
          Tab(icon: Icon(Icons.format_shapes), text: 'Shape'),
        ],
        children: [
          RangeSliderColorWidget(),
          RangeSliderSizeWidget(),
          RangeSliderLabelWidget(),
          RangeSliderShapeWidget(),
        ].map((child) => Center(child: child)).toList(),
      );
}
