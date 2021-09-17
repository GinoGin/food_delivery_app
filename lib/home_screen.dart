import 'package:flutter/material.dart';

import 'drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with TickerProviderStateMixin {
  double  translateX=0.0;

  double translateY=0.0;

  double scale=1;

  bool toggle=false;

  late AnimationController _animationController;
  
  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DrawerMenu(),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          transform: Matrix4.translationValues(translateX, translateY, 0)..scale(scale),
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_arrow,
                  color: Colors.black,
                  progress: _animationController),
                onPressed: (){
                  toggle=!toggle;
                  if(toggle){
                    print("true");
                    translateX=200;
                    translateY=0;
                    scale=1;
                    _animationController.forward();
                  }
                  else{
                    print("false");
                    translateX=0;
                    translateY=0;
                    scale=1;
                    _animationController.reverse();
                  }
                  setState((){});
                }, 
              // icon: Icon(Icons.menu, 
              // color: Colors.black,
              // ),
              ),
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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  SizedBox(width: 10,),
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
                    SizedBox(height: 10),
                    subtitle(context,"Category"),
                    
                    Container(
                      height: 110,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        //physics: NeverScrollableScrollPhysics(),
                        itemCount: listCards.length,
                        itemBuilder: (context, index){
                          return CategoryModel(categoryModel: listCards[index],);
                        }
                      ),
                    ),
                    subtitle(context, "Popular"),
                    for(int i=0;i<popularItem.length;i++) ...{
                      Container(
                      
                      decoration: BoxDecoration(
                        
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            spreadRadius: 5,
                            blurRadius: 10,
                          
                          ),
                        ]
                      ),
                      margin: EdgeInsets.only(top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 220,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft:Radius.circular(15),topRight: Radius.circular(15)),
                              image:DecorationImage(image: NetworkImage(popularItem[i].imgUrl),
                              fit: BoxFit.cover,
                            ),
                            ),
                            ),
              
                          Text(popularItem[i].title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,
                              color: Colors.yellow.shade800,),
                              Text(" (250 ratings)"),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10 ),
                                child: Text("\$50",
                                style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18
                                ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                      
                    ),
                    
                    },
                    
                  ],          
                ),
              ),
            ),        
          ),
        ),
        
      ],
    );
  }

  Text subtitle(BuildContext context, String title) {
    return Text(title,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold,fontSize: 20) ,);
  }
}

class CategoryModel extends StatelessWidget {
  final CatModel1 categoryModel;
  CategoryModel({
     required this.categoryModel
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 2,right: 5,bottom: 3,left: 3),
        height: 70,
        width: 70,
        color: Colors.orangeAccent.shade100.withOpacity(0.3),
        child: Image.asset(categoryModel.imgUrl),
        ),
        Text(categoryModel.title,
        style:Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold,fontSize: 13) ,
        ),
    ],
    );
  }
}

List<CatModel1> listCards =[
  CatModel1("assets/burger.png", "Burger"),
  CatModel1("assets/cake.png","Cake"),
  CatModel1("assets/french-fries.png","French-Fries"),
  CatModel1("assets/hot-dog.png","Hot-Dog"),
  CatModel1("assets/juice.png","Juice"),
  CatModel1("assets/noodles.png","Noodles"),
  CatModel1("assets/pizza.png","Pizza"),
];

class CatModel1{
  String imgUrl;
  String title;
  CatModel1(
    this.imgUrl,
    this.title,
  );
}

class PopularItem{
  String imgUrl;
  String title;
  PopularItem(
    this.imgUrl,
    this.title
  );
}

List <PopularItem> popularItem=[
  PopularItem("https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?cs=srgb&dl=pexels-lisa-1279330.jpg&fm=jpg",
  "Noodles"),
  PopularItem("https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
  "Pizza"),
  PopularItem("https://images.pexels.com/photos/3590401/pexels-photo-3590401.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "Pasta"),
  PopularItem("https://images.pexels.com/photos/1854652/pexels-photo-1854652.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "Cake"),
];