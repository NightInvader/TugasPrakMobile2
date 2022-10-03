

import 'package:flutter/material.dart';
import 'package:tugas_2/tourism_place.dart';
import 'package:tugas_2/open_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body:ListView.builder(
          itemBuilder: (context, index){
            final TourismPlace place = tourismPlaceList[index];
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OpenScreen(place: place);
                }));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  shape: ContinuousRectangleBorder(),
                  child: Column(
                    children: [
                      Image.network(place.imageUrls[0],),
                      Text(place.name,
                        style:TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ) ,
                      ),
                      Text(place.ticketPrice,
                        style:TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  ),
                ),
              );
          },
        itemCount: tourismPlaceList.length,
      ),
    );
  }

}
