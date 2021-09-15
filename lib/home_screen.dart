import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Delivery to",
            style: Theme.of(context).textTheme.subtitle2,),
            InkWell(
              onTap:(){
                print("Clicked");
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Search Location" ,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold,fontSize: 20) ,),
                  Icon(Icons.keyboard_arrow_down , color: Colors.green,size: 30,),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              
              Expanded(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onTap: (){},
                      borderRadius: BorderRadius.circular(20),
                      child: Row(
                      
                        children: [
                      
                        Icon(Icons.search),
                        Text("Search food",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black45)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.filter_center_focus)
                ),
            ],
          ),
        ],

      ),
    
    
    );
  }
}