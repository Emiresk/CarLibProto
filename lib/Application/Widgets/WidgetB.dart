import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WidgetB extends StatelessWidget {

  final Map<int, WidgetConfiguration> _wd = {
    0: WidgetConfiguration(
      name: 'fuel_consumption',
      icon: Icons.star,
      description: 'Fuel consumption calculator',
    ),
    1: WidgetConfiguration(
      name: 'Widget 2',
      icon: Icons.favorite,
      description: 'This is widget 2',
    ),
    2: WidgetConfiguration(
      name: 'Widget 3',
      icon: Icons.home,
      description: 'This is widget 3',
    ),
    3: WidgetConfiguration(
      name: 'Widget 4',
      icon: Icons.work,
      description: 'This is widget 4',
    ),
  };


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: GridView.builder (
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
          ),
          itemCount: _wd.length,
          itemBuilder: (context, index) {
            final wConfig = _wd[index]!;
            return InkWell(
              onTap: () => print("Tap on button {$wConfig}"),
              child: Container(
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
                            wConfig.icon
                        )
                    ),
                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: SizedBox (
                          width: 100,
                          child: AutoSizeText(
                              wConfig.description,
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              maxLines: 3,
                            )
                        )
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}


class WidgetConfiguration {
  final String name;
  final IconData icon;
  final String description;

  WidgetConfiguration({
    required this.name,
    required this.icon,
    required this.description,
  });
}