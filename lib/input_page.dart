import 'package:flutter/material.dart';

import 'bmi_result.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key, required this.title});

  final String title;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  bool _isMale = true;
  double _height = 170.0;
  double _weight = 91.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        ),

        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
            Text('Gender: ${_isMale ? 'Male': 'Female'}'
            ),

            ToggleButtons(children:[
                Icon(Icons.male),
                Icon(Icons.female),
              ],
            isSelected: [_isMale, !_isMale],
            onPressed: (index) => setState(() {
              _isMale = index == 0;
              }),
            ),

            SizedBox(height: 16.0),
            Text('height (cm): ${_height.toStringAsFixed(1)}'),
            Slider(
              value: _height,
              min : 100.0,
              max : 250.0,
              onChanged: (value) => setState(() => _height = value),
            ),

            SizedBox(height: 16.0),
            Text('weight (kg): ${_weight.toStringAsFixed(1)}'),
            Slider(
              value: _weight,
              min : 30.0,
              max : 150.0,
              onChanged: (value) => setState(() => _weight = value),
            ),

            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BMIResult(
                    isMale: _isMale,
                    height: _height,
                    weight: _weight,
                  ),
                ),
              );
              },
              child: Text('Calculate BMI'),
            ),
          ],
        ),
      ),
    );
  }
}