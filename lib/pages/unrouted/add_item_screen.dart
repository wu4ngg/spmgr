import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget{
  const AddItemScreen({
    super.key,
  });
  @override
  State<StatefulWidget> createState() => _AddItemScreenStates();
}
class _AddItemScreenStates extends State<AddItemScreen>{
  int _selection = 0;
  void changeSelection(int newVal){
    setState(() {
      _selection = newVal;
    });
  }
  final controller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text("Thêm")), 
    body: Center(
      child: Column(children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "test return"),
        ),
        Text(controller.text),
        TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: const Text("Ok")),
        TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: const Text("Not ok"))
      ],),
    ),);
  }
}