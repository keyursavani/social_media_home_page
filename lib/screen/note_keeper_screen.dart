import 'package:flutter/material.dart';
import 'package:practical_task/provider/note_provider.dart';
import 'package:practical_task/screen/add_note_screen.dart';
import 'package:provider/provider.dart';

class NoteKeeperScreen extends StatefulWidget{
  const NoteKeeperScreen({Key? key}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteKeeperScreenState();
  }
}

class NoteKeeperScreenState extends State<NoteKeeperScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:const Text("Your Notes"),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context){
                  return const AddNoteScreen();
                }));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Consumer<NoteProvider>(
                  builder: (context , provider , child){
                return ListView.builder(
                  shrinkWrap: true,
                  physics:const BouncingScrollPhysics(),
                  itemCount: provider.noteList.length,
                    itemBuilder: (context,index){
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius:const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(width: 1 , color: Colors.black45),
                    ),
                    child: Text(provider.noteList[index].toString()),
                  );
                });
              })
            ],
          ),
        ),
      ),
    );
  }
}