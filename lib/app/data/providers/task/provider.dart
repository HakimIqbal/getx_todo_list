import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_todo_list/app/core/utils/keys.dart';
import 'package:getx_todo_list/app/data/models/task.dart';
import 'package:getx_todo_list/app/data/services/storage/services.dart';

class TaskProvider {
  final _storage = Get.find<StorageService>();

//  {'tasks' : [
//   {'title' : 'Work',
//    'color' : '#ff123456',
//   'icon': 0xe123}
//  ]}

  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskkey).toString())
          .forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;

  }
  
  void writeTasks(List<Task> tasks) {
    _storage.write(taskkey, jsonEncode(tasks));
  }
}