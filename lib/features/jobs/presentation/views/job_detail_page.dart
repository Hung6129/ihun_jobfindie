import 'package:flutter/material.dart';
import 'package:ihun_jobfindie/shared/widgets/app_sliverappbar.dart';

class JobDetailPage extends StatelessWidget {
  const JobDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppSliverAppBar(
        expandedHeight: 200,
        onlyShowTitleWhenCollapsed: true,
        titleWidget: Text('Job Detail Page'),
        leadingWidget: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        children: [
          Container(
            height: 200,
            color: Colors.blue,
          ),
          Container(
            height: 200,
            color: Colors.red,
          ),
          Container(
            height: 200,
            color: Colors.green,
          ),
          Container(
            height: 200,
            color: Colors.yellow,
          ),
          Container(
            height: 200,
            color: Colors.purple,
          ),
          Container(
            height: 200,
            color: Colors.orange,
          ),
          Container(
            height: 200,
            color: Colors.pink,
          ),
          Container(
            height: 200,
            color: Colors.teal,
          ),
          Container(
            height: 200,
            color: Colors.indigo,
          ),
          Container(
            height: 200,
            color: Colors.brown,
          ),
          Container(
            height: 200,
            color: Colors.blueGrey,
          ),
          Container(
            height: 200,
            color: Colors.cyan,
          ),
          Container(
            height: 200,
            color: Colors.deepOrange,
          ),
          Container(
            height: 200,
            color: Colors.deepPurple,
          ),
          Container(
            height: 200,
            color: Colors.indigo,
          ),
          Container(
            height: 200,
            color: Colors.lightBlue,
          ),
          Container(
            height: 200,
            color: Colors.lightGreen,
          ),
          Container(
            height: 200,
            color: Colors.lime,
          ),
          Container(
            height: 200,
            color: Colors.pinkAccent,
          ),
          Container(
            height: 200,
            color: Colors.purpleAccent,
          ),
          Container(
            height: 200,
            color: Colors.redAccent,
          ),
          Container(
            height: 200,
            color: Colors.tealAccent,
          ),
          Container(
            height: 200,
            color: Colors.yellowAccent,
          ),
          Container(
            height: 200,
            color: Colors.amberAccent,
          ),
          Container(
            height: 200,
            color: Colors.blueAccent,
          ),
          Container(
            height: 200,
            color: Colors.cyanAccent,
          ),
          Container(
            height: 200,
            color: Colors.greenAccent,
          ),
          Container(
            height: 200,
            color:
                Colors.deepOrangeAccent, // This is the last color in the list, so it will be the last one to be shown
          ),
        ],
      ),
    );
  }
}
