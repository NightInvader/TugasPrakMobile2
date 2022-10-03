import 'package:flutter/material.dart';
import 'package:tugas_2/tourism_place.dart';

class OpenScreen extends StatefulWidget {
  final TourismPlace place;
  const OpenScreen({Key? key, required this.place}) : super(key: key);

  @override
  State<OpenScreen> createState() => _OpenScreenState();
}

class _OpenScreenState extends State<OpenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.place.name}"),
      ),
      body: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height)/3,
            child:  ListView.builder(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                itemCount: widget.place.imageUrls.length,
                itemBuilder: (context, index){
                  return  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10
                    ),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(50)
                    // ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                        child: Image.network(widget.place.imageUrls[index],
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,)
                    )

                  );
                }
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Card(
              shape: ContinuousRectangleBorder(
                side: BorderSide(
                  color: Colors.indigoAccent
                ),
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(widget.place.name,
                  style: TextStyle(
                    fontSize: 27,fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(widget.place.description,
                      style: TextStyle(
                        fontSize: 15,fontWeight: FontWeight.bold,
                      ),),
                  ),
                  SizedBox(height: 15,),
                  Text("Lokasi  :  ${widget.place.location}",
                    style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),),
                  Text("Tiket   :  ${widget.place.ticketPrice}",
                    style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),),
                  Text(widget.place.openDays,
                    style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),),
                  Text("Jam     :  ${widget.place.openTime}",
                    style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
