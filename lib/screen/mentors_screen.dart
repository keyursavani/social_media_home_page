import 'package:flutter/material.dart';
import 'package:practical_task/provider/home_screen_provider.dart';
import 'package:provider/provider.dart';

class MentorsScreen extends StatefulWidget{
  const MentorsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return MentorsScreenState();
  }
}


class MentorsScreenState extends State<MentorsScreen>{
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeScreenProvider>(context , listen: false);
    // TODO: implement build
   return Scaffold(
     body: Container(
       padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
       child: SingleChildScrollView(
         physics: const BouncingScrollPhysics(),
         child: ListView.builder(
           shrinkWrap: true,
             physics: const BouncingScrollPhysics(),
             itemCount: provider.storyImage.length,
             itemBuilder: (context, index){
           return Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Row(
                     children: [
                       Container(
                         height: 50,
                         width: 50,
                         decoration:  BoxDecoration(
                           borderRadius: const BorderRadius.all(Radius.circular(50)),
                           image:  DecorationImage(
                             image:  AssetImage(provider.storyImage[index]),
                             fit: BoxFit.fill,
                           ),
                         ),
                       ),
                       const SizedBox(width: 20,),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Mentor $index",style: const TextStyle(
                             fontSize: 17,
                             color: Colors.black,
                           ),),
                           const SizedBox(height: 7,),
                           Text("User $index",style: const TextStyle(
                             fontSize: 13,
                             color: Colors.black,
                           ),),
                         ],
                       )
                     ],
                   ),
                   Icon(Icons.more_vert)
                 ],
               ),
               const SizedBox(height: 5,),
               const Divider(),
             ],
           );
         }),
       ),
     ),
   );
  }
}