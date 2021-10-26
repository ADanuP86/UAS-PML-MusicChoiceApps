import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/images_abu.jpg',fit: BoxFit.cover,),
          searchBarUI(),
        ],
      ),
    );
  }

  Widget searchBarUI() {
    return FloatingSearchBar(
      hint: 'Search Music...',
      openAxisAlignment: 0.0,
      maxWidth: 600,
      axisAlignment:0.0,
      scrollPadding: EdgeInsets.only(top: 16,bottom: 20),
      elevation: 4.0,
      physics: BouncingScrollPhysics(),
      onQueryChanged: (query){
      }, //Your methods will be here
      showDrawerHamburger: false,
      transitionCurve: Curves.easeInOut,
      transitionDuration: Duration(milliseconds: 500),
      transition: CircularFloatingSearchBarTransition(),
      debounceDelay: Duration(milliseconds: 500),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(icon: Icon(Icons.search),
            onPressed: (){
            print('Places Pressed');
            },
          ),
        ),

        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition){
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Material(
            color: Colors.white,
            child: Container(
              height: 200.0,
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Everyday Live'),
                    subtitle: Text('more info here...'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
