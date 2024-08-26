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
      cardColor: 0xFFf6eac2,
    ),
    1: WidgetDataPrefab(
      name: 'distance',
      emoji: "🛣",
      description: 'Distance converter',
      isAvailable: true,
      isActive: false,
      isSoon: false,
      cardColor: 0xFFa6c7ea,
    ),
    2: WidgetDataPrefab(
      name: 'alcohol',
      emoji: "🍺",
      description: 'Alcohol intoxication converter',
      isAvailable: true,
      isActive: false,
      isSoon: false,
      cardColor: 0xFFa2e1db,
    ),
    3: WidgetDataPrefab(
      name: 'car_number',
      emoji: "🔡",
      description: 'Car number checker',
      isAvailable: true,
      isActive: false,
      isSoon: false,
      cardColor: 0xFFffc8a2,
    ),
  };


  @override
  Widget build(BuildContext context) {

    var widgetDataBuilder = WidgetDataBuilder();
    var availableWidgets = _widgetDataPrefab.values.where((wData) => wData.isAvailable).toList();

    return Container(
      margin: EdgeInsets.all(15),

      child: GridView.builder (
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.75/1
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
  final bool isSoon;
  final dynamic cardColor;// Lock icon

  WidgetDataPrefab({
    required this.name,
    required this.emoji,
    required this.description,
    required this.isAvailable,
    required this.isActive,
    required this.isSoon,
    required this.cardColor,
  });
}

class WidgetDataBuilder {
  InkWell _generateCard ( dynamic data ) {
    return InkWell(
      onTap: () => print("Click on button " + data.description),
      enableFeedback: true,
      child: data.isSoon ? _showComingSoonCard(data) : _showNormalCard(data),
    );
  }

  Container _showNormalCard ( dynamic data ) {

    print( data );

    return Container(
      decoration: BoxDecoration(
        color: Color(data.cardColor),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: const [ BoxShadow(
            color: Colors.black,
            blurRadius: 5,
            blurStyle: BlurStyle.normal,
            offset: Offset(0, 0),
            spreadRadius: -5
        )],
      ),
      child: Stack (
        children: [
          Positioned(
              top: 5,
              left: 10,
              child: Text(
                  data.emoji,
                  style: TextStyle(
                    fontSize: 30
                  ),
              ),
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child: SizedBox (
                  width: 120,
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


