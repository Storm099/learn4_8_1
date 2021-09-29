import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 1200,));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: FadeTransition(
        opacity: _animation,
        child: Center(
          child: Container(

            height: 200,
            width: 200,
            child: const Image(
              image: AssetImage("assets/images/per4.jpg"),
            ),


          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _animationController.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),

    );


  }
}
