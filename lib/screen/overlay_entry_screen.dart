import 'package:flutter/material.dart';

class OverlayEntryScreen extends StatefulWidget {
  const OverlayEntryScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return OverlayEntryScreenState();
  }
}

class OverlayEntryScreenState extends State<OverlayEntryScreen> {
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  OverlayEntry? _overlayEntry;
  GlobalKey globalKey = GlobalKey();
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    OverlayState? overlayState = Overlay.of(context);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      globalKey;
    });
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlay();

        overlayState!.insert(_overlayEntry!);
      } else {
        _overlayEntry!.remove();
      }
    });
  }

  OverlayEntry _createOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;

    var size = renderBox.size;
    return OverlayEntry(
        builder: (context) => Positioned(
              width: MediaQuery.of(context).size.width - 50,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: const Offset(18,50),
                child: const Material(
                  elevation: 5.0,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('India'),
                      ),
                      ListTile(
                        title: Text('Australia'),
                      ),
                      ListTile(
                        title: Text('USA'),
                      ),
                      ListTile(
                        title: Text('Canada'),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50,bottom: 50),
                child: CompositedTransformTarget(
                  link: _layerLink,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // _focusNode.hasFocus;
                        FocusScope.of(context).requestFocus(_focusNode);
                        // if(_focusNode.hasFocus){
                        //   FocusScope.of(context).requestFocus(_focusNode);
                        //   _focusNode.unfocus();
                        // }
                        // else{
                        //   FocusScope.of(context).requestFocus(_focusNode2);
                        // }
                      },
                      child: const Text("On Tap"),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 200,),
              ElevatedButton(
                  onPressed: (){
                    _focusNode.unfocus();
                    FocusScope.of(context).requestFocus(_focusNode2);
                  },
                  child: const Text("UnFocus"))
              // Container(
              //   width: 50,
              //   padding: const EdgeInsets.only(left: 20,right: 20),
              //   child: CompositedTransformTarget(
              //     link: _layerLink,
              //     child: TextFormField(
              //       focusNode: _focusNode,
              //       keyboardType: TextInputType.text,
              //       textCapitalization: TextCapitalization.words,
              //       textInputAction: TextInputAction.next,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
