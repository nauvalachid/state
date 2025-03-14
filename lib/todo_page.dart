import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _taskController = TextEditingController();
  List<String> listTugas = [];

  void addData() {
    setState(() {
      listTugas.add(_taskController.text);
      _taskController.clear();
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
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('./assets/images/mu.jpg'),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Manchester United',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _taskController,
                      decoration: InputDecoration(
                        label: const Text(
                          'Player',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            fontSize: 20,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Masukkan tugas yang ingin dilakukan',
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 3),
                        ),
                      ),
                      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Task tidak boleh kosong';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 10),
                    FilledButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          addData();
                        }
                      },
                      child: const Text('Submit',style: TextStyle(fontFamily: 'Poppins')),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listTugas.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 193, 40, 40),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Nama Tugas :', style: TextStyle(color: Colors.white,fontFamily: 'Poppins')),
                          Text(listTugas[index], style: const TextStyle(color: Colors.white,fontFamily: 'Poppins')),
                        ],
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