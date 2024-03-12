import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_screen_provider.dart';

class PostCardScreen extends StatefulWidget{
  const PostCardScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PostCardScreenState();
  }
}

class PostCardScreenState extends State<PostCardScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     body: SingleChildScrollView(
       physics: const BouncingScrollPhysics(),
       child: ListView.builder(
         physics: const BouncingScrollPhysics(),
         shrinkWrap: true,
         itemCount: 10, // Number of posts
         itemBuilder: (BuildContext context, int index) {
           return getPostCardWidget();
         },
       ),
     ),
   );
  }
  Widget getPostCardWidget(){
    return Consumer<HomeScreenProvider>(builder: (context , provider , child){
      return Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://source.unsplash.com/random/50x50'), // Sample image URL
              ),
              title: Text('Username'),
              subtitle: Text('Location'),
              trailing: Icon(Icons.more_vert),
            ),
            Container(
              constraints: const BoxConstraints(
                maxHeight: 300.0,
                minHeight: 200.0,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://source.unsplash.com/random/500x500'), // Sample image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap:(){
                            if(provider.likeCount == "215"){
                              provider.changeLikeCount("216");
                            }
                            else{
                              provider.changeLikeCount("215");
                            }
                          },
                          child:  Icon(Icons.favorite_border, color: provider.likeCount == "216" ? Colors.red : Colors.black)),
                      const SizedBox(width: 8.0),
                      Text(provider.likeCount),
                      const SizedBox(width: 8.0),
                      const Icon(Icons.comment_outlined),
                      const SizedBox(width: 8.0),
                      const Text('215 comments'),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(Icons.send),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Caption Text...',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'View all comments',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 8.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 15.0,
                    backgroundImage: NetworkImage(
                        'https://source.unsplash.com/random/50x50'), // Sample image URL
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.favorite_border),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '2 hours ago',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      );
    });
  }
}