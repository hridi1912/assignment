// Import necessary packages
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const ({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: BookList(),
    );
  }
}

class BookList extends StatelessWidget {
  //const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Book List',style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
        ),
        body:ListView(
          //: MainAxisAlignment.spaceEvenly,
          padding: EdgeInsets.all(16),
          children: [
            Books(name: 'Let Us C',author: 'Yashavanth Kanetkar',rating: 4.8,link: 'assets/images/Let_Us_C.jpg'),
            Books(name: 'Teach Yourself C',author: 'Herbert Schildt',rating: 5,link: 'assets/images/Teach_urself_C.jpg')
          ]
        )
      );
  }
}
class Books extends StatelessWidget {
 final String name;
 final String author;
 final double rating;
 final String link;

 Books({required this.name,required this.author,required this.rating,required this.link});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => BookDetails(name:name, author: author, link: link)));
      },
      child: Card(
        color: Colors.grey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Image.asset(link,
                width: 60.0,
                height: 80.0,
              ),
              SizedBox(width: 20.0),
              // Book name, author name, and rating
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500),
                  ),
                  Text(author),
                  Text('Rating: $rating'),
                ],
              ),
            ],
          ),
          ),
        )
      );
  }
}

class BookDetails extends StatelessWidget {
  final String name;
  final String author;
  final String link;

  BookDetails({required this.name,required this.author,required this.link});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 16.0),

            Image.asset(
              link,
              width: 150.0,
              height: 150.0,
            ),
            SizedBox(height: 20.0),
            Text(author),
            SizedBox(height: 16.0),
            // Short description
            Text(
                'This is very helpful to learn C language. You should give it a try!'
            ),
            SizedBox(height: 16.0),
            // Dropdown button
            DropdownButton<String>(
              items: ['Original Price: 6000/-', 'Replica Price: 1000/-', 'Poor version: 300/-']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
              },
              hint: Text('Price List:'),
            ),
            SizedBox(height: 120.0),
            // Go Back button

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back',style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}


 

