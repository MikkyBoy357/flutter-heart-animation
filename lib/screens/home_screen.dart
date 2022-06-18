import 'package:flutter/material.dart';
import 'package:heart_animation/providers/HeartProvider.dart';
import 'package:heart_animation/utils/const.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color heartColor = Const.heartColor;
    Color heartColor2 = Const.heartColor2;
    HeartProvider viewModel = Provider.of<HeartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.title),
      ),
      body: Consumer<HeartProvider>(
        builder: (context, heart, _) {
          int heartLevel = heart.heartLevel;
          int heartLevel2 = heart.heartLevel2;
          bool isBeating = heart.isBeating;

          return Container(
            width: size.width,
            // height: 300,
            color: Colors.deepPurple[100],
            // color: Colors.white,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    size: (50 + heartLevel).toDouble() * 2.8,
                    color: heartColor.withOpacity(0.4),
                  ),
                  Icon(
                    Icons.favorite,
                    size: (100 + heartLevel).toDouble() * 1.6,
                    color: heartColor.withOpacity(0.6),
                  ),
                  Icon(
                    Icons.favorite,
                    size: (160 + heartLevel).toDouble(),
                    color: heartColor.withOpacity(0.8),
                  ),
                  Icon(
                    Icons.favorite,
                    size: 160,
                    color: heartColor,
                  ),
                  Icon(
                    Icons.favorite,
                    size: (50 + heartLevel2).toDouble(),
                    color: heartColor2,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple.shade200,
        onPressed: () {
          viewModel.changeFirstHeart();
        },
        tooltip: 'Increment',
        child: Icon(
          Icons.favorite,
          color: Colors.purple,
        ),
      ),
    );
  }
}
