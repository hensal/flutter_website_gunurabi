import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.red,
            centerTitle: true,
            title: const Text(
              'Home Screen',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Times',
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: const [
                  //images aassets
                  SizedBox(
                    height: 10,
                    width: 10,
                  ),                            
                      Text(
                        'Welcome to my app ❤️',
                         style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                    Text(
                        'Follow me at GitHub @josephyaduvanshi .',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontFamily: 'Times New Roman',
                        ),                    
                  ),
                ],
              ),
            ),
          ),
          drawer: const Drawer(),
        ),
      ),
    );
  }
}