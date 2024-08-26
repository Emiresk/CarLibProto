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
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF8b79ff),
                Color(0xFF50c6f6),
                Color(0xFF50c6f6),
              ],
            begin: Alignment.topCenter,
            end: Alignment.center,
            stops: [ 0, 0.35, 1 ],
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            margin: const EdgeInsets.only(top: 25),
            child: Column (
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 130,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome to MyCarTool", style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500
                      )),
                      Text("Can we help you?", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      )),
                    ],
                  )
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),

                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 600),
                        switchInCurve: Curves.easeIn,
                        child: _selectedWidget,
                      ),
                    )
                )
              ],
            )
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    iconSize: 30,
                    onPressed: () => _loadWidget ( WidgetA() ),
                    icon: Icon(LineAwesome.home_solid )
                ),
                IconButton(

                    iconSize: 30,
                    onPressed: () => _loadWidget ( WidgetB() ),
                    icon: Icon(LineAwesome.calculator_solid )
                ),
                IconButton(
                    iconSize: 30,
                    onPressed: () => print("Click"),
                    icon: Icon(LineAwesome.book_open_solid)
                ),
                IconButton(
                    iconSize: 30,
                    onPressed: () => print("Click"),
                    icon: Icon(LineAwesome.user)
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}