import 'package:flutter/material.dart';

class Card3 extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String sub;
  final String lock;

  const Card3({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.sub,
    required this.lock,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          sub,
                          style: TextStyle(
                            color: Color(0xff6D747A),
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(lock=="false"?Icons.lock_open_rounded:Icons.lock_outline_rounded,color: Color(0xff6D747A),),
                      ],
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
