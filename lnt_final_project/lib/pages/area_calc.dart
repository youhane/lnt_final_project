import 'package:flutter/material.dart';
import 'package:lnt_final_project/pages/counter.dart';
import 'package:lnt_final_project/pages/volume_calc.dart';
import 'package:lnt_final_project/utils/drawer.dart';

class AreaCalc extends StatefulWidget {
  const AreaCalc({ Key? key }) : super(key: key);

  @override
  State<AreaCalc> createState() => _AreaCalcState();
}

class _AreaCalcState extends State<AreaCalc> {
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _radiusController = TextEditingController();

  final double _pi = 3.14;
  bool isCircle = false;
  bool isTriangle = false;
  bool isSquare = true;
  
  double _result = 0;

  void _calculateArea() {
    setState(() {
      if (isCircle) {
        _result = _pi * double.parse(_radiusController.text) * double.parse(_radiusController.text);
      } else if (isSquare){
        _result = double.parse(_lengthController.text) * double.parse(_widthController.text);
      } else if(isTriangle) {
        _result = (double.parse(_lengthController.text) * double.parse(_widthController.text)) / 2;
      }
    });
  }

  void _changeShape(String shape) {
    setState(() {
      if (shape == "Circle") {
        isCircle = true;
        isTriangle = false;
        isSquare = false;
      } else if (shape == "Triangle") {
        isCircle = false;
        isTriangle = true;
        isSquare = false;
      } else if (shape == "Square") {
        isCircle = false;
        isTriangle = false;
        isSquare = true;
      }
    });
  }

    void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Counter(),
            ),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AreaCalc(),
            ),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VolumeCalc(),
            ),
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Area Calculator"),
      ),
      drawer: const ProfileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: isCircle,
              child: Container(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
                child: TextFormField(
                  controller: _radiusController,
                  decoration: InputDecoration(
                    labelText: 'Radius',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              ),
            ),
            Visibility(
              visible: !isCircle,
              child: Container(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
                child: TextFormField(
                  controller: _lengthController,
                  decoration: InputDecoration(
                    labelText: isTriangle ? 'Base' : 'Length',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              ),
            ),
            Visibility(
              visible: !isCircle,
              child: Container(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                child: TextFormField(
                  controller: _widthController,
                  decoration: InputDecoration(
                    labelText: isTriangle ? 'Height' : 'Width',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              ),
            ),
            ElevatedButton(
              onPressed: () {_calculateArea();}, 
              child: const Text('Count Area')
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {_changeShape("Square");}, 
                  child: const Icon(Icons.square),
                  heroTag: null,
                ),
                FloatingActionButton(
                  onPressed: () {_changeShape("Circle");}, 
                  child: const Icon(Icons.circle),
                  heroTag: null,
                ),
                FloatingActionButton(
                  onPressed: () {_changeShape("Triangle");}, 
                  child: const Icon(Icons.arrow_drop_up, size: 50.0,),
                  heroTag: null,
                ),
              ],
            ),
            Text(
              _result.toStringAsFixed(2).toString(), 
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.plus_one), label: "Counter"),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Area Calc"),
          BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined), label: "Volume Calc"),
        ],
        currentIndex: 1,
        onTap: _onItemTapped,
      ),
    );
  }
}