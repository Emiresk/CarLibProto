import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WidgetB extends StatelessWidget {

  final Map<int, WidgetDataPrefab> _widgetDataPrefab = {
    0: WidgetDataPrefab(
      name: 'fuel_consumption',
      icon: Icons.star,
      description: 'Fuel consumption calculator',
      isAvailable: true,
      isActive: true,
      isSoon: false,
    ),
    1: WidgetDataPrefab(
      name: 'Widget 2',
      icon: Icons.favorite,
      description: 'This is widget 2',
      isAvailable: true,
      isActive: false,
      isSoon: false,
    ),
    2: WidgetDataPrefab(
      name: 'Widget 3',
      icon: Icons.home,
      description: 'This is widget 3',
      isAvailable: false,
      isActive: false,
      isSoon: false,
    ),
    3: WidgetDataPrefab(
      name: 'Widget 4',
      icon: Icons.work,
      description: 'This is widget 4',
      isAvailable: true,
      isActive: false,
      isSoon: true,
    ),
  };


  @override
  Widget build(BuildContext context) {

    var _widgetDataBuilder = WidgetDataBuilder();
    var _availableWidgets = _widgetDataPrefab.values.where((wData) => wData.isAvailable).toList();



    print( "Total cards ==> " + _widgetDataPrefab.length.toString());

    return Container(
      padding: EdgeInsets.all(5),
      child: GridView.builder (
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
          ),
          itemCount: _availableWidgets.length,
          itemBuilder: (context, index)
          {
            var data = _availableWidgets[index]!;
            if ( data.isAvailable == true )
            {
              return _widgetDataBuilder._generateCard(data);
            }
          }
      ),
    );
  }
}

class WidgetDataPrefab {
  final String name;
  final IconData icon;
  final String description;
  final bool isAvailable;  // Show in tree
  final bool isActive;     // OnClick is working
  final bool isSoon;       // Lock icon

  WidgetDataPrefab({
    required this.name,
    required this.icon,
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
              top: 10,
              left: 10,
              child: Icon(
                  size: 48,
                  data.icon
              )
          ),
          Positioned(
              bottom: 10,
              right: 10,
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(0xFFfaffcb),
            Color(0xFFcbf4f5),
          ]
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: const [ BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 5),
            spreadRadius: -5
        )],
      ),
    );
  }
}


