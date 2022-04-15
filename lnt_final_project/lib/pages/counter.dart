import 'package:flutter/material.dart';
import 'package:lnt_final_project/pages/area_calc.dart';
import 'package:lnt_final_project/pages/volume_calc.dart';

class Counter extends StatefulWidget {
  const Counter({ Key? key }) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {  
  int _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter(){
    setState(() {
      _counter--;
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
        title: const Text("Counter"),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Profile'),
            ),
            ListTile(
              title: Text('Item 1'),
            ),
            ListTile(
              title: Text('Item 1'),
            ),
            ListTile(
              title: Text('Item 1'),
            ),
            ListTile(
              title: Text('Item 1'),
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {_incrementCounter();}, 
                    child: const Icon(Icons.add),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 1.2,
                    alignment: Alignment.center,
                    child: Text(
                      _counter.toString(),
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    )
                  ),
                  ElevatedButton(
                    onPressed: () {_decrementCounter();}, 
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.plus_one), label: "Counter"),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Area Calc"),
          BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined), label: "Volume Calc"),
        ],
        currentIndex: 0,
        onTap: _onItemTapped,
      ),
    );
  }
}