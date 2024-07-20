import 'package:carlibproto/Application/Widgets/WidgetA.dart';
import 'package:carlibproto/Application/Widgets/WidgetB.dart';


import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';



class PageStart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageStartStateComponent();
}

class PageStartStateComponent extends State<PageStart> {

  void _loadWidget ( Widget _tartgetWidget ) {
    setState(() {
      _selectedWidget = _tartgetWidget;
    });
  }

  Widget _selectedWidget = Container();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold (
          appBar: AppBar(
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: ()=>{} ,
                      icon: const Icon(
                    BoxIcons.bx_plus_circle,
                        size: 30,
                      )
                  ),
                  IconButton(
                      onPressed: ()=>{} ,
                      icon: const Icon(
                        BoxIcons.bx_cog,
                        size: 30,
                      )
                  ),
                ],
              )
            ],
            leading: IconButton(
              onPressed: () => print ("Click"),
              icon: Icon(BoxIcons.bx_menu_alt_left),
            ),
          ),
          bottomNavigationBar: Container(

            height: 65,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: const [ BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                blurStyle: BlurStyle.outer,
                offset: Offset(0, 5),
                spreadRadius: -5
              )],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    color: Colors.lightBlueAccent,
                    iconSize: 30,
                    onPressed: () => _loadWidget ( WidgetA() ),
                    icon: Icon(BoxIcons.bxs_home )
                ),
                IconButton(
                    color: Colors.lightBlueAccent,
                    iconSize: 30,
                    onPressed: () => _loadWidget ( WidgetB() ),
                    icon: Icon(BoxIcons.bxs_calculator )
                ),
                IconButton(
                    color: Colors.lightBlueAccent,
                    iconSize: 30,
                    onPressed: () => print("Click"),
                    icon: Icon(BoxIcons.bxs_data)
                ),
                IconButton(
                    color: Colors.lightBlueAccent,
                    iconSize: 30,
                    onPressed: () => print("Click"),
                    icon: Icon(BoxIcons.bxs_user)
                ),
              ],
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 600),
              switchInCurve: Curves.easeIn,
              child: _selectedWidget,
            ),

          )
        )
    );
  }

}