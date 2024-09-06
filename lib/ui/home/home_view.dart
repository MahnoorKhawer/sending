

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starting_todo_app/routes/app_routes.dart';
import 'package:starting_todo_app/ui/calender/calenderview.dart';
import 'package:starting_todo_app/ui/home/ToDo/todoitem.dart';
import 'package:starting_todo_app/ui/home/ToDo/todomodel.dart';
import 'package:starting_todo_app/utils/color.dart';
import '../../utils/constant.dart';
import '../notification/notificationLogic.dart';
import 'Drawer/aboutpage.dart';
import 'Drawer/header.dart';
import 'home_logic.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Notificationlogic notificationController = Get.put(Notificationlogic());
  var currentPage = DrawerSections.dashboard;
  final HomeController controller = Get.put(HomeController());
  TextEditingController add = TextEditingController();
  List<ToDo> foundToDo = [];
  final List<ToDo> todoList = ToDo.todoList();

  @override
  void initState() {
    foundToDo = todoList;
    super.initState();
    fetchToDoItems();
  }

  void fetchToDoItems() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(
        'ToDoItem').get();

    List<ToDo> todos = querySnapshot.docs.map((doc) {
      return ToDo(
        id: doc['id'],
        todoText: doc['todoText'],
        isDone: doc['isDone'],
      );
    }).toList();

    setState(() {
      todoList.clear();
      todoList.addAll(todos);
      foundToDo = List.from(todoList);
    });
  }

  handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });

    FirebaseFirestore.instance.collection('ToDoItem')
        .where('id', isEqualTo: todo.id)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.update({
          'isDone': todo.isDone,
        });
      });
    });
  }

  deleteToDoItem(String id) {
    FirebaseFirestore.instance.collection('ToDoItem')
        .where('id', isEqualTo: id)
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        doc.reference.delete();
      }
    });
    setState(() {
      todoList.removeWhere((item) => item.id == id);
      foundToDo = List.from(todoList);
    });
  }

  addToDoItem(String todo) {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();

    ToDo newToDo = ToDo(id: id, todoText: todo);
    setState(() {
      todoList.add(newToDo);
      foundToDo = List.from(todoList);
    });
    add.clear();

    FirebaseFirestore.instance.collection('ToDoItem').add({
      'id': id,
      'todoText': todo,
      'isDone': false,
    });
    notificationController.showNotification(
      title: 'ToDo',
      body: 'New Task: $todo',
    );
  }

  runFilter(String enter) {
    List<ToDo> results = [];
    if (enter.isEmpty) {
      results = todoList;
    } else {
      results = todoList.where((item) =>
      item.todoText != null &&
          item.todoText!.toLowerCase().contains(enter.toLowerCase())
      ).toList();
    }

    setState(() {
      foundToDo = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: AppColor.darkGreen,
            ),
            backgroundColor: AppColor.white,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.task),
                  text: 'ToDo Task',),
                Tab(icon: Icon(Icons.calendar_month_sharp),
                  text: 'Calender ToDo',),
              ],
              labelColor: AppColor.darkGreen,
              unselectedLabelColor: AppColor.gray,
              indicatorColor: AppColor.colorGreen,
            ),
          ),
          body: _getDrawerPage(),
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    MyHeaderDrawer(),
                    MyDrawerList(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  _getDrawerPage() {
    if (currentPage == DrawerSections.dashboard) {
      return TabBarView(
        children: [
          _buildToDoListView(),
          CalendarView(),
        ],
      );
    } else {
      return Container();
    }
  }


  Widget _buildToDoListView() {
    return Stack(
      children: [
        GetBuilder<HomeController>(
            id: Constant.idHome,
            builder: (logic) {
              return Container(
                color: AppColor.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          onChanged: (value) => runFilter(value),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search, color: AppColor.colorGreen,
                              size: 20,),
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: TextStyle(color: AppColor.gray),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20, bottom: 20),
                              child: Text('All TODOs', style: TextStyle(
                                  color: AppColor.darkGreen,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),),
                            ),
                            for(ToDo todo in foundToDo.reversed)
                              ToDoItem(todo: todo,
                                onToDoChanged: handleToDoChange,
                                onDeleteItem: deleteToDoItem,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20,),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.white,
                    ),
                    child: TextField(
                      controller: add,
                      decoration: InputDecoration(
                        hintText: 'Add ToDo Item',
                        hintStyle: TextStyle(color: AppColor.gray),
                        border: InputBorder.none,
                      ),
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.colorGreen,
                    foregroundColor: AppColor.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70),
                    ),
                  ),
                  onPressed: () {
                    addToDoItem(add.text);
                  },
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, 'Dashboard', Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, 'About', Icons.help,
              currentPage == DrawerSections.about ? true : false),
          menuItem(3, 'Logout', Icons.logout,
              currentPage == DrawerSections.logout ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? AppColor.gray : AppColor.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Aboutpage()),
              );
            } else if (id == 3) {
              Navigator.pushNamed(context, AppRoutes.Logout);
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                  child: Icon(
                    icon,
                    color: AppColor.colorGreen,
                    size: 20,
                  )),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(color: AppColor.darkGreen),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}