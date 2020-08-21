import 'package:demo_app/widgets/images_grid_page1.dart';
import 'package:demo_app/widgets/news_overview.dart';
import 'package:demo_app/models/gallery_data.dart';
import 'package:demo_app/services/gallery_service.dart';
import 'package:flutter/material.dart';

import 'widgets/images_grid_page2.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Welcome _nodes;

  var _isLoading = false;

  Future<void> apiCallPage() async {
    final value = await Services.getGalleryDataPage();
    setState(() {
      _nodes = value;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    apiCallPage();
  }

  Widget _heading(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Text(
        text,
        
        style: TextStyle(
          color: Colors.pink[600],
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _heading('Latest Bollywood Updates'),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: _nodes.nodes.length,
                        itemBuilder: (ctx, i) => NewsOverView(
                          _nodes.nodes[i].node.title,
                          _nodes.nodes[i].node.fieldPhotoImageSection,
                        ),
                      ),
                    ),
                    _heading('Bollywood Gallery Page 1'),
                    ImagesGridPage1(),
                    Divider(thickness: 2,),
                    _heading('Bollywood Gallery Page 2'),
                    ImagesGridPage2(),
                  ],
                ),
              ),
            ),
    );
  }
}
