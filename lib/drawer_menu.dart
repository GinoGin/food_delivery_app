import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
      
        gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.green.shade400,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListView(
          children: [
            
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/myAvatar.jpg"),
                backgroundColor: Colors.grey,
              ),
              accountName: Text("Name",
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.bold
              ),), 
              accountEmail: Text("yourname@gmail.com",
              style: TextStyle(
                fontSize:16
              ),
              ),
              
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            ListMenu(iconMenu: Icons.border_color,title: "Orders"),
            ListMenu(iconMenu: Icons.bookmark,title: "Address"),
            ListMenu(iconMenu: Icons.notifications,title: "Notification",),
            ListMenu(iconMenu: Icons.account_box,title: "Account",),
            ListMenu(iconMenu: Icons.star_half, title: "Rate us"),
            ListMenu(iconMenu: Icons.exit_to_app, title: "Log Out"),
            
          ],
        ),
      ),
    );
  }
}

class ListMenu extends StatelessWidget {
  final IconData iconMenu;
  final String title;
  ListMenu({
    required this.iconMenu,
    required this.title,
  });
  
  

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        
      },
      leading: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        
        color: Colors.white24,
        borderRadius: BorderRadius.circular(30),
      ),
      child:Icon(
        iconMenu,
        color: Colors.white,),
      ),
    title: Text(title,
        style: TextStyle(color: Colors.white),
    ),
    );
  }
}