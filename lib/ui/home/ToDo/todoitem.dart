import 'package:flutter/material.dart';
import 'package:starting_todo_app/ui/home/ToDo/todomodel.dart';
import 'package:starting_todo_app/utils/color.dart';
class ToDoItem extends StatefulWidget {
  const ToDoItem({super.key, required this.todo, this.onToDoChanged, this.onDeleteItem});
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          if (widget.onToDoChanged != null) {
            widget.onToDoChanged!(widget.todo);
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: AppColor.white,
        leading: Icon(widget.todo.isDone? Icons.check_box: Icons.check_box_outline_blank,color: AppColor.colorGreen,),
        title: Text(widget.todo.todoText!,style: TextStyle(color: AppColor.darkGreen,
        decoration: widget.todo.isDone? TextDecoration.lineThrough: null)),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: AppColor.colorGreen,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: AppColor.darkGreen,
              iconSize: 18,
              onPressed: (){
                if (widget.onDeleteItem != null) {
                  widget.onDeleteItem!(widget.todo.id);
                }
              },
              icon: Icon(Icons.delete)),
        ),
      ),
    );
  }
}
