import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WidgetB extends StatelessWidget {

  final Map<int, WidgetDataPrefab> _widgetDataPrefab = {
    0: WidgetDataPrefab(
      name: 'fuel_consumption',
      emoji: "⛽",
      description: 'Fuel consumption calculator',
      isAvailable: true,
      isActive: true,
      isSoon: false,
    ),
    1: WidgetDataPrefab(
      name: 'distance',
      emoji: "🛣",
      description: 'Distance converter',
      isAvailable: true,
      isActive: false,
      isSoon: false,
    ),
    2: WidgetDataPrefab(
      name: 'alcohol',
      emoji: "🍺",
      description: 'Alcohol intoxication converter',
      isAvailable: true,
      isActive: false,
      isSoon: false,
    ),
    3: WidgetDataPrefab(
      name: 'car_number',
      emoji: "🔡",
      description: 'Car number checker(Service)',
      isAvailable: true,
      isActive: false,
      isSoon: false,
    ),
  };


  @override
  Widget build(BuildContext context) {

    var widgetDataBuilder = WidgetDataBuilder();
    var availableWidgets = _widgetDataPrefab.values.where((wData) => wData.isAvailable).toList();

    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.builder (
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
          ),
          itemCount: availableWidgets.length,
          itemBuilder: (context, index)
          {
            var data = availableWidgets[index]!;
            if ( data.isAvailable == true )
            {
              return widgetDataBuilder._generateCard(data);
            }
          }
      ),
    );
  }
}

class WidgetDataPrefab {
  final String name;
  final String emoji;
  final String description;
  final bool isAvailable;  // Show in tree
  final bool isActive;     // OnClick is working
  final bool isSoon;       // Lock icon

  WidgetDataPrefab({
    required this.name,
    required this.emoji,
    required this.description,
    required this.isAvailable,
    required this.isActive,
    required this.isSoon
  });
}

class WidgetDataBuilder {
  InkWell _generateCard ( dynamic data ) {
    return InkWell(
      onTap: () => print("Click on button " + data.description),
      child: data.isSoon ? _showComingSoonCard(data) : _showNormalCard(data),
    );
  }

  Container _showNormalCard ( dynamic data ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade500,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: const [ BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 5),
            spreadRadius: -5
        )],
      ),
      child: Stack (
        children: [
          Positioned(
              top: 15,
              left: 15,
              child: Text(
                  data.emoji,
                  style: TextStyle(
                    fontSize: 36
                  ),
              ),
          ),
          Positioned(
              bottom: 15,
              right: 15,
              child: SizedBox (
                  width: 100,
                  child: AutoSizeText(
                    data.description,
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 3,
                  )
              )
          )
        ],
      ),
    );
  }

  Container _showComingSoonCard ( dynamic data) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(0xFFfaffcb),
            Color(0xFFcbf4f5),
          ]
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [ BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 5),
            spreadRadius: -5
        )],
      ),
      child: const Column (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(LineAwesome.lock_solid, size: 30,),
            Text("Coming soon", style: TextStyle(
              fontSize: 16
            ),)
          ],
        )
    );
  }
}


