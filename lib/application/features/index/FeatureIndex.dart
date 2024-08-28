
import 'package:flutter/material.dart';

class FeatureIndex extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FeatureIndexState();
}

class FeatureIndexState extends State<FeatureIndex> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blueAccent,
            pinned: true,
            floating: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text ("Hello dear friend"),

            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
            ),
            delegate: SliverChildBuilderDelegate(
                (BuildContext builder, int index) {
                  return Container(
                    margin: EdgeInsets.all(15),
                    color: Colors.blueAccent,
                  );
                },
                childCount: 8,

            ),
          )
        ],
      )
    );
  }

}