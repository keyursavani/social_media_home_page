import 'package:flutter/material.dart';
import 'package:practical_task/provider/home_screen_provider.dart';
import 'package:practical_task/screen/grid_screen.dart';
import 'package:practical_task/screen/mentors_screen.dart';
import 'package:practical_task/screen/post_card_screnn.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    imageLoad(context);
  }

  void imageLoad(BuildContext context) {
    precacheImage(const AssetImage('assets/images/mainLogo.png'), context);
    precacheImage(const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJEB-lN-jOWFEyGU9br7br-cYQCOmuZIlInQ&usqp=CAU'), context);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeScreenProvider>(context , listen: false);
    // TODO: implement build
   return Scaffold(
     resizeToAvoidBottomInset: true,
     backgroundColor: Colors.white,
     body: GestureDetector(
       onTap: (){
         FocusScope.of(context).unfocus();
       },
       child: Container(
         margin: const EdgeInsets.only(
             top: 5,
             bottom: 0),
         child: Column(
           children: [
             Container(
               padding: const EdgeInsets.only(left: 10,right: 10),
               height: 60,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Image.asset("assets/images/mainLogo.png",height: 60,width: 100,fit: BoxFit.contain,),
                   IconButton(
                     icon: const Icon(Icons.add_box_outlined ,size: 30,),
                     onPressed: () {},
                   ),
                 ],
               ),
             ),
             Container(
               padding: const EdgeInsets.only(left: 10,right: 10),
               height: 65,
               child: ListView.builder(
                 itemCount: provider.storyImage.length,
                   physics: const BouncingScrollPhysics(),
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context , index){
                 return InkWell(
                   onTap: (){
                     openStoryWidget(provider.storyImage[index]);
                   },
                   child: Container(
                     margin: const EdgeInsets.only(right: 10),
                     height: 55,
                       width: 65,
                       decoration:  BoxDecoration(
                         borderRadius: const BorderRadius.all(Radius.circular(50)),
                       border: Border.all(width: 2,color: Colors.redAccent),
                       image:   DecorationImage(
                       image:  AssetImage(provider.storyImage[index]),
                       fit: BoxFit.fill,
                       ),
                       ),
                   ),
                 );
               }),
             ),
             Expanded(
               child: DefaultTabController(
                 length: 3,
                 initialIndex: 0,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                       padding: const EdgeInsets.only(left: 10,right: 10),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           TabBar(
                             controller: _controller,
                             tabs: const [
                               Tab(
                                 child: Text("SM Space"),
                               ),
                               Tab(
                                 child: Text("Competitions"),
                               ),
                               Tab(
                                 child: Text("Mentors"),
                               ),
                             ],
                             indicator: const UnderlineTabIndicator(
                               borderSide: BorderSide(
                                   width: 3.0,
                                   color:Colors.deepPurpleAccent),
                               insets: EdgeInsets.symmetric(
                                 horizontal: 0.0,
                               ),
                             ),
                             isScrollable: true,
                             physics: const BouncingScrollPhysics(),
                             labelStyle: const TextStyle(
                                 color: Colors.deepPurpleAccent,
                               fontSize: 14
                             ),
                             indicatorColor: Colors.deepPurpleAccent,
                             unselectedLabelColor: Colors.grey,
                             labelColor: Colors.deepPurpleAccent,
                           ),
                         ],
                       ),
                     ),
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.only(top: 10),
                         child: TabBarView(
                           physics: const BouncingScrollPhysics(),
                           controller: _controller,
                           children: const [
                             PostCardScreen(),
                             GridViewScreen(),
                            MentorsScreen(),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ],
         ),
       ),
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
                                 Text("Story" ,style: TextStyle(
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
