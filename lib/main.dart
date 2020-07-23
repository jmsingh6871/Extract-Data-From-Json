import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.teal,
  ),
  home: HomePage(),
  debugShowCheckedModeBanner: false,
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List  data;
  final textstyle = TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Budding Programmers"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("load_json/person.json"),
            builder: (context, snapshot){
              //Decode Json
              var mydata = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      height: 200.0,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[

                            Image(
                              height: 180,
                              width: 180,
                              fit: BoxFit.cover,
                              image : AssetImage(
                                mydata[index]['image'],
                              ),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                Text("Name : "+ mydata[index]['name'],style: textstyle,),
                                Text("Age : "+ mydata[index]['age'],style: textstyle),
                                Text("Height : "+ mydata[index]['height'],style: textstyle),
                                Text("Gender : "+ mydata[index]['gender'],style: textstyle),
                                Text("Hair Colour : "+ mydata[index]['hair_color'],style: textstyle),
                              ],
                            ),
                          ],
                        ) ,
                      ),
                    ),
                  );

                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
