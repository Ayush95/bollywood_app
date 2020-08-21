import 'package:flutter/material.dart';

class NewsOverView extends StatelessWidget {
  final String content;
  final String imageUrl;

  NewsOverView(
    this.content,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 130,
                width: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2.0),
                        blurRadius: 6,
                      )
                    ]),
                padding: EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      content,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      softWrap: true,
                    ),
                    SizedBox(height: 7),
                    Padding(
                      padding: EdgeInsets.only(right: 105),
                      child: Text(
                        '2 HOURS AGO',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(thickness: 1.5),
      ],
    );
  }
}
