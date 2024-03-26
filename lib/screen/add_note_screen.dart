import 'package:flutter/material.dart';
import 'package:practical_task/provider/note_provider.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget{
  const AddNoteScreen({Key? key}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddNoteScreenState();
  }
}

class AddNoteScreenState extends State<AddNoteScreen>{
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NoteProvider>(context, listen: false);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:const Text("Add Notes"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:const EdgeInsets.symmetric(vertical: 15),
                  child: TextFormField(
                  controller: controller,
                              ),
                ),
                InkWell(
                  onTap: (){
                    if(controller != null){
                      provider.addNote(controller.text.trim().toString());
                    }
                    else{
                      print("Please enter something");
                    }
                  },
                  child: Container(
                    padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    decoration:const BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child:const Text("Add",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}