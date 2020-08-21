import 'package:demo_app/models/gallery_data.dart';
import 'package:demo_app/services/gallery_service.dart';
import 'package:flutter/material.dart';

class ImagesGridPage2 extends StatefulWidget {
  @override
  _ImagesGridPage2State createState() => _ImagesGridPage2State();
}

class _ImagesGridPage2State extends State<ImagesGridPage2> {
  Welcome _nodes;
  var _isLoading = false;

  Future<void> apiCallPage2() async {
    final value = await Services.getGalleryDataPage2();
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
    apiCallPage2();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Wrap(
              spacing: 1.5,
              runSpacing: 1,
              children: List.generate(
                _nodes.nodes.length,
                (index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 3) / 3,
                      height: (MediaQuery.of(context).size.height - 170) / 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            _nodes.nodes[index].node.fieldPhotoImageSection,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
