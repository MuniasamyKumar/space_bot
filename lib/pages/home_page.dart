import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/space_pg.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Container(
              height: 120,
              // padding: ,
             child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Space Bot"),
                IconButton(onPressed: (){}, icon: Icon(Icons.image_search_rounded))
              ],
             ),
            ),
            Expanded(child: ListView()),
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                          style: TextStyle(color: Colors.black),
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ))),
                          const SizedBox(width: 12,),
                          CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Icon(Icons.send,color: Colors.white,),
                            ),
                          )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
