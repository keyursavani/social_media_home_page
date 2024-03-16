import 'package:flutter/material.dart';
import 'package:practical_task/provider/home_screen_provider.dart';
import 'package:provider/provider.dart';
class GridViewScreen extends StatefulWidget{
  const GridViewScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return GridViewScreenState();
  }
}

class GridViewScreenState extends State<GridViewScreen>{
   List<String> imageUrls = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Scaffold(
    body: Consumer<HomeScreenProvider>(builder: (context , provider, child){
      return Center(
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount:provider.storyImage.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 4.0, // Spacing between columns
            mainAxisSpacing: 4.0, // Spacing between rows
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                openStoryWidget(provider.storyImage[index]);
              },
                child: Image.asset(provider.storyImage[index],fit: BoxFit.cover,));
          },
        ),
      );
    }
    ),
  );
  }
   void openStoryWidget(String imageUrl){
     bool like = false;
     showDialog(
         context: context,
         builder: (context){
           return Container(
             padding: const EdgeInsets.symmetric(horizontal: 10),
             child: WillPopScope(
               onWillPop: () async {
                 return true;
               },
               child: AlertDialog(
                 insetPadding: const EdgeInsets.all(5),
                 shape: const RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(8.0))),
                 content: StatefulBuilder(
                   builder: (context, setState){
                     return Wrap(
                       children: [
                         Column(
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 GestureDetector(
                                   onTap: (){
                                     Navigator.pop(context);
                                   },
                                   child: Container(
                                       height: 40,
                                       width: 40,
                                       decoration:  BoxDecoration(
                                           borderRadius: const BorderRadius.all(Radius.circular(50)),
                                           color: Colors.purple.withOpacity(0.3)
                                       ),
                                       child: const Align(
                                           alignment:Alignment.center,
                                           child: Padding(
                                             padding: EdgeInsets.only(left: 5),
                                             child: Icon(Icons.arrow_back_ios, color: Colors.white,size: 20,),
                                           ))),
                                 ),
                                 Text("" ,style: TextStyle(
                                     fontSize: 20,
                                     color: Colors.purple.withOpacity(0.7),
                                     fontWeight: FontWeight.w500
                                 ),),
                                 Icon(Icons.more_vert ,
                                   color: Colors.purple.withOpacity(0.4),),
                               ],
                             ),
                             const SizedBox(height: 25,),
                             Image.asset(imageUrl, height: MediaQuery.of(context).size.height * 0.43,
                               width: MediaQuery.of(context).size.width ,fit: BoxFit.fill,),
                             Align(
                               alignment: Alignment.bottomRight,
                               child: IconButton(
                                 onPressed: (){
                                   setState((){
                                     if(like){
                                       like= false;
                                     }
                                     else{
                                       like = true;
                                     }
                                   });
                                 },
                                 icon:  Icon(Icons.favorite_border_outlined,color: like ? Colors.redAccent : Colors.black,),
                               ),
                             )
                           ],
                         ),
                       ],
                     );
                   },
                 ),
               ),
             ),
           );
         });
   }
}