import 'package:flutter/material.dart';
import 'package:lnt_final_project/pages/area_calc.dart';
import 'package:lnt_final_project/pages/counter.dart';
import 'package:lnt_final_project/utils/drawer.dart';

class VolumeCalc extends StatefulWidget {
  const VolumeCalc({ Key? key }) : super(key: key);

  @override
  State<VolumeCalc> createState() => _VolumeCalcState();
}

class _VolumeCalcState extends State<VolumeCalc> {
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _radiusController = TextEditingController();

  final double _pi = 3.14;
  bool isCircle = false;
  bool isTriangle = false;
  bool isSquare = true;
  
  double _result = 0;

  void _calculateVolume() {
    setState(() {
      if (isCircle) {
        _result = _pi * double.parse(_radiusController.text) * double.parse(_radiusController.text) * double.parse(_radiusController.text);
      } else if (isSquare){
        _result = double.parse(_lengthController.text) * double.parse(_heightController.text) * double.parse(_lengthController.text);
      } else if(isTriangle) {
        _result = (double.parse(_lengthController.text) * double.parse(_heightController.text) * double.parse(_lengthController.text)) / 6;
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
        title: const Text("Volume Calculator"),
      ),
      drawer: const ProfileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: !isTriangle,
              child: Container(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
                child: TextFormField(
                  controller: _radiusController,
                  decoration: InputDecoration(
                    labelText: isSquare ? 'Side' : 'Radius',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              ),
            ),
            Visibility(
              visible: isTriangle,
              child: Container(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
                child: TextFormField(
                  controller: _lengthController,
                  decoration: InputDecoration(
                    labelText: 'Length',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              ),
            ),
            Visibility(
              visible: isTriangle,
              child: Container(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                child: TextFormField(
                  controller: _heightController,
                  decoration: InputDecoration(
                    labelText: 'Height',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.all(35.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
                ),
                onPressed: () {_calculateVolume();}, 
                child: const Text(
                  'Count Volume',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 40.0),
              child: Row(
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
        currentIndex: 2,
        onTap: _onItemTapped,
      ),
    );
  }
}