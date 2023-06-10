import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String sub;

  const Card1({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.sub,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 240,
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                child: Image.asset(
                    imageUrl,
                    fit: BoxFit.fitHeight,
                  ),
              ),

              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Color(0xff598BED),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      description,
                      style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w700,),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      sub,
                      style: TextStyle(
                        color: Color(0xff6D747A),
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
