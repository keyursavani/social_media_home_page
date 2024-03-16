import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  TextEditingController controller = TextEditingController();
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeScreenProvider>(context , listen: false);
    // TODO: implement build
   return Scaffold(
     body: SingleChildScrollView(
       physics: const BouncingScrollPhysics(),
       child: ListView.builder(
         physics: const BouncingScrollPhysics(),
         shrinkWrap: true,
         itemCount: provider.storyImage.length, // Number of posts
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
                       Text(provider.commentCount.toString()),
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
                'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Minima veritatis ab culpa hic, neque blanditiis rerum esse cum sapiente doloremque ullam, voluptate dolor vel omnis libero placeat incidunt dolore facere?',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 8.0),
            GestureDetector(
              onTap: (){
                _showModalBottomSheet(context);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'View all comments',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
             Padding(
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
                      controller: controller,
                      onSubmitted:(value) {
                        if(value != null && value.isNotEmpty){
                          provider.addComment(value);
                          controller.clear();
                          provider.changeCommentCount(1);
                          Fluttertoast.showToast(
                            msg: "Comment Added Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                          );
                        }
                        else{
                          Fluttertoast.showToast(
                            msg: "Please enter some comment",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                          );
                        }
                      },
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        hintText: 'Add a comment...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Icon(Icons.favorite_border),
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

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Consumer<HomeScreenProvider>(
            builder: (context , provider , child){
          return Container(
            margin: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
            child: ConstrainedBox(
                constraints:BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.6,
                  minHeight: MediaQuery.of(context).size.height * 0.2,
                ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: provider.commentList.length,
                  itemBuilder: (context,index){
                return Center(
                  child: Column(
                    children: [
                     Container(
                       width: MediaQuery.of(context).size.width,
                       margin: const EdgeInsets.only(top: 10),
                       padding: const EdgeInsets.all(10),
                       decoration: BoxDecoration(
                         borderRadius: const BorderRadius.all(Radius.circular(15)),
                         border: Border.all(width: 1, color: Colors.black45),
                           color: Colors.white
                       ),
                       child:  Text(provider.commentList[index]),
                     )
                    ],
                  ),
                );
              }),
            ),
          );
        });
      },
    );
  }
}