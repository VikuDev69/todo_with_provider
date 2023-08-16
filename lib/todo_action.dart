import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class TodoAction extends StatelessWidget {
  const TodoAction({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //store the value in a variable
    final task = Provider.of<TodoProvider>(context);

    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      scrollDirection: Axis.vertical,
      itemCount: task.allTasks.length,
      itemBuilder: ((context, index) => Padding(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(width: 2, color: Colors.green.shade700)),
              tileColor: Colors.green.shade300,
              leading: Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.green.shade800,
                // toggle the task as index item
                value: task.allTasks[index].completed,
                onChanged: ((_) => task.toggleTask(task.allTasks[index])),
              ),
              //show all the task title
              title: Text(
                task.allTasks[index].title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 4,
                softWrap: true,
              ),

              trailing: task.allTasks[index].completed
                  ? IconButton(
                      onPressed: () {
                        //delete task as index item
                        if (task.allTasks[index].completed == true) {
                          task.deleteTask(task.allTasks[index]);
                        }
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red.shade600,
                      ))
                  : IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Colors.grey.shade600,
                      )),
            ),
          )),
    );
  }
}
