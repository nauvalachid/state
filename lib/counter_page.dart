import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  List<String> listCounter = [];
  int _counter = 1;

  void addData(){
    setState(() {
      _counter += 1;
      listCounter.add(_counter.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Page', style: TextStyle(fontSize: 25, fontFamily: 'Poppins', fontWeight: FontWeight.bold),),
      centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 5,
          ), 
          itemCount: listCounter.length,
          itemBuilder: (context, index) {
            return CircleAvatar(
              backgroundColor: (index % 2 == 0) ? const Color.fromARGB(255, 13, 60, 98) : const Color.fromARGB(255, 118, 17, 10),
              child: Text('${listCounter[index]}', style: TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.bold),), 
            );
          },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 10,
          children: [
            FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 126, 126, 126), 
              onPressed: () {
                setState(() {
                  if(_counter >= 0 && listCounter.isNotEmpty){
                    _counter--;
                    listCounter.removeLast();
                  }
                  // _counter --;
                  // listCounter.removeLast();
                });
              }, 
              child: Icon(Icons.remove),
            ),
            FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 126, 126, 126), 
              onPressed: () {
                addData();
              }, 
              child: Icon(Icons.add),
            ),
          ],
        ),
    );
  }
}