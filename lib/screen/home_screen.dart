import 'package:flutter/material.dart';
import 'package:practical_task/screen/post_card_screnn.dart';

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

  List<String> storyImage = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJEB-lN-jOWFEyGU9br7br-cYQCOmuZIlInQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh1mk5eIUKicuPR8Fqo3NXCW1u3nmMq21-FQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5wJW8FKf4lIFvic-0EKuANFe8013L-_u7Uw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc7Zy6rcBCoLAq7xDzckixcjRQg8tqpqSC_A&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPRlfwTD0Fd0Nid1Jn5BT7dsfZaTM1eVf6ug&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJEB-lN-jOWFEyGU9br7br-cYQCOmuZIlInQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh1mk5eIUKicuPR8Fqo3NXCW1u3nmMq21-FQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5wJW8FKf4lIFvic-0EKuANFe8013L-_u7Uw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc7Zy6rcBCoLAq7xDzckixcjRQg8tqpqSC_A&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPRlfwTD0Fd0Nid1Jn5BT7dsfZaTM1eVf6ug&usqp=CAU",
  ];

  @override
  Widget build(BuildContext context) {
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
                 itemCount: storyImage.length,
                   physics: const BouncingScrollPhysics(),
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context , index){
                 return Container(
                   margin: const EdgeInsets.only(right: 10),
                   height: 55,
                     width: 65,
                     decoration:  BoxDecoration(
                       borderRadius: const BorderRadius.all(Radius.circular(50)),
                     border: Border.all(width: 2,color: Colors.redAccent),
                     image:   DecorationImage(
                     image:  NetworkImage(storyImage[index]),
                     fit: BoxFit.fill,
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
                             Center(child: Text("Competition Screen"),),
                             Center(child: Text("Mentors Screen"),)
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
}
