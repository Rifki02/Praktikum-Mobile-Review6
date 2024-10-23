import 'package:flutter/material.dart';
import 'package:pertemuan_7/widgets/task_tile.dart';

import '../model/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  State<TaskList> createState() => _TasksListState();
}


class _TasksListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final task = widget.tasks[index];
        return TaskTile(
          taskTitle: task.name,
          isChecked: task.isDone,
          checkboxCallback: (checkboxState) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
          longPressCallback: () {
            setState(() {
              widget.tasks.removeAt(index);
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
