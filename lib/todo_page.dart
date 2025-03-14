import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  final _key = GlobalKey<FormState>();
  final TextEditingController _Taskcontroller = TextEditingController();

  List<String> listTugas = [];

  void addData() {
    setState(() {
      listTugas.add(_Taskcontroller.text);
      _Taskcontroller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          children: [
            Row(
              spacing: 10,
              children: [
                CircleAvatar(
                   radius: 40,
                  backgroundImage: AssetImage('./assets/images/mu.jpg'),
                ),
                Text('Manchester United'),
              ],
            ),
            Form(
              key: _key,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _Taskcontroller,
                      decoration: InputDecoration(
                        label: Text('Task'),
                        hintText: 'Masukkan tugas yang ingin dilakukan',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Task tidak boleh kosong';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                  FilledButton(onPressed: () {
                    if (_key.currentState!.validate()) {
                      addData();
                    }
                  }, child: Text('Submit')),
                ],
              ),
            ),Expanded(
              child: ListView.builder(
              itemCount: listTugas.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 193, 40, 40),borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('Nama Tugas :'), Text(listTugas[index])],
                  ),
                );
              },
            ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}