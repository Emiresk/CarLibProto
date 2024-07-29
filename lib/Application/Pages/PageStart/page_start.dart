import 'package:carlibproto/Application/Widgets/WidgetA.dart';
import 'package:carlibproto/Application/Widgets/WidgetB.dart';


import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';



class PageStart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageStartStateComponent();
}

class PageStartStateComponent extends State<PageStart> {

  Widget _selectedWidget = Container();

  @override
  void initState() {
    super.initState();
    _loadWidget(WidgetA());
  }

  void _loadWidget(Widget _tartgetWidget) {
    setState(() {
      _selectedWidget = _tartgetWidget;
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container (
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: <Color>[
                Color(0xFFe3faff),
                Color(0xFFfff0d9),
              ]
          ),
        ),
        child: Scaffold (
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)
              ),
              border: Border.all(
                color: Colors.black,
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    iconSize: 30,
                    onPressed: () => _loadWidget ( WidgetA() ),
                    icon: Icon(BoxIcons.bxs_home )
                ),
                IconButton(

                    iconSize: 30,
                    onPressed: () => _loadWidget ( WidgetB() ),
                    icon: Icon(BoxIcons.bxs_calculator )
                ),
                IconButton(

                    iconSize: 30,
                    onPressed: () => print("Click"),
                    icon: Icon(BoxIcons.bxs_data)
                ),
                IconButton(

                    iconSize: 30,
                    onPressed: () => print("Click"),
                    icon: Icon(BoxIcons.bxs_user)
                ),
              ],
            ),
          ),
          body: Container(
            margin: const EdgeInsets.all(15),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 600),
              switchInCurve: Curves.easeIn,
              child: _selectedWidget,
            ),
          )
        ),
      ),
    );
  }
}