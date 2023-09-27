import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('todo_box');
  runApp(MaterialApp(
    home: HiveTodo(),
  ));
}

class HiveTodo extends StatefulWidget {
  const HiveTodo({super.key});

  @override
  State<HiveTodo> createState() => _HiveTodoState();
}

class _HiveTodoState extends State<HiveTodo> {
  List<Map<String, dynamic>> task = [];

  /// to store values from hive
  ///hive object
  final my_box = Hive.box('todo_box');
  @override
  void initState() {
    readTask_refreshUi();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Task'),
      ),
      body: task.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: task.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        task[index]['taskname'],
                        style: GoogleFonts.alatsi(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        task[index]['taskdesc'],
                        overflow: TextOverflow.visible,
                        maxLines: 1,
                      ),
                      Expanded(
                          child: Row(
                        children: [
                          IconButton(
                              onPressed: () => showAlertbox(task[index]
                                  ['id']), //open alertbox which create before
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () => deleteTask(task[index]['id']),
                              icon: Icon(Icons.delete)),
                        ],
                      ))
                    ],
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAlertbox(null),
        child: Icon(Icons.task),
      ),
    );
  }

  final title_cntrl = TextEditingController(); //collecting using controler
  final descr_cntrl = TextEditingController(); //collecting using controler

  void showAlertbox(int? key) {
    //key= task[index][''id]
    if (key != null) {
      final existing_task = task.firstWhere((element) => element['id'] == key);
      title_cntrl.text = existing_task['taskname'];
      descr_cntrl.text = existing_task['taskdesc'];
    }
    // key is similar to id in sqflite

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.greenAccent,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Title"),
                  controller: title_cntrl,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Content"),
                  controller: descr_cntrl,
                  maxLines: 5,
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (title_cntrl.text != "" && descr_cntrl.text != "") {
                      createTeask({
                        'tname': title_cntrl.text.trim(),
                        'tcontent': descr_cntrl.text.trim(),
                      });
                    }
                    title_cntrl.text = ""; //clear  aftr create
                  },
                  child: Text('Create Task')),
              TextButton(
                  onPressed: () {
                    updateTask(key, {
                      'tname': title_cntrl.text.trim(),
                      'tcontent': descr_cntrl.text.trim()
                    });
                    descr_cntrl.text = "";
                  },
                  child: Text('Update Task')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
            ],
          );
        });
  }

  Future<void> createTeask(Map<String, dynamic> mytask) async {
    await my_box.add(mytask);
    readTask_refreshUi(); //refresh ui after each creation,deleton ,update
  }

  readTask_refreshUi() {
    final task_from_hive = my_box.keys.map((key) {
      //fetch all the keys fro hive box  //to read from hive

      final value = my_box.get(key); //single map correspoding to the key
      return {
        'id': key,
        'taskname': value['tname'],
        'taskdesc': value['tcontent']
      }; //to read from hive
    }).toList(); //convert map to list

    setState(() {
      task = task_from_hive.reversed
          .toList(); //sort in normal they sort as alphebetic order but we need ascending order bcz this is todoo notepad so we use this "reversed"
    });
  }

  Future<void> updateTask(int? key, Map<String, dynamic> updateTask) async {
    await my_box.put(key, updateTask);
    readTask_refreshUi();
  }

  Future<void> deleteTask(int key) async {
    await my_box.delete(key);
    readTask_refreshUi();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("succesfully deleted"),
      ),
    );
  }
}
