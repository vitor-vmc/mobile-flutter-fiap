import 'package:app_15/helper/task_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:app_15/models/task.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoList createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  TextEditingController _titleController = TextEditingController();
  var _db = TasksHelper();
  List<Tasks> _tasks = List<Tasks>();

  _showAddScreen({Tasks task}) {
    String textSaveUpdate = "";
    if (task == null) {
      _titleController.text = "";
      textSaveUpdate = "Salvar";
    } else {
      _titleController.text = task.title;
      textSaveUpdate = "Atualizar";
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("$textSaveUpdate tarefa"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Título", hintText: "Digite título..."),
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    //salvar
                    _saveUpdateTask(selectedTask: task);

                    Navigator.pop(context);
                  },
                  child: Text(textSaveUpdate))
            ],
          );
        });
  }

  _recoverTasks() async {
    List recoveredTasks = await _db.recoverTasks();

    List<Tasks> auxTasks = List<Tasks>();
    for (var item in recoveredTasks) {
      Tasks task = Tasks.fromMap(item);
      auxTasks.add(task);
    }

    setState(() {
      _tasks = auxTasks;
    });
    auxTasks = null;
  }

  _saveUpdateTask({Tasks selectedTask}) async {
    String title = _titleController.text;

    if (selectedTask == null) {
      Tasks task = Tasks(title, DateTime.now().toString());
      int result = await _db.saveTask(task);
    } else {
      selectedTask.title = title;
      selectedTask.date = DateTime.now().toString();
      int result = await _db.updateTask(selectedTask);
    }

    _titleController.clear();

    _recoverTasks();
  }

  _formatDate(String date) {
    initializeDateFormatting("pt_BR");
    var formatter = DateFormat.yMd("pt_BR");

    DateTime convertedDate = DateTime.parse(date);
    String formattedDate = formatter.format(convertedDate);

    return formattedDate;
  }

  _deleteTask(int id) async {
    await _db.removeTask(id);

    _recoverTasks();
  }

  @override
  void initState() {
    super.initState();
    _recoverTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    final task = _tasks[index];

                    return Card(
                      child: ListTile(
                        title: Text(task.title),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _showAddScreen(task: task);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _deleteTask(task.id);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () {
            _showAddScreen();
          }),
    );
  }
}
