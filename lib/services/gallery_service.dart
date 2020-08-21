import 'package:http/http.dart' as http;
import '../models/gallery_data.dart';

class Services {
  static Future<Welcome> getGalleryDataPage() async {
    try {
      final pageUrl = 'http://www.pinkvilla.com/photo-gallery-feed-page';
      final response = await http.get(pageUrl);
      if (200 == response.statusCode) {
        final Welcome nodes = welcomeFromJson(response.body);
        return nodes;
      } else {
        return Welcome();
      }
    } catch (e) {
      return Welcome();
    }
  }

  static Future<Welcome> getGalleryDataPage1() async {
    try {
      final pageUrl1 =
          "http://www.pinkvilla.com/photo-gallery-feed-page/page/1";
      final response = await http.get(pageUrl1);
      if (200 == response.statusCode) {
        final Welcome nodes = welcomeFromJson(response.body);
        return nodes;
      } else {
        return Welcome();
      }
    } catch (e) {
      return Welcome();
    }
  }

  static Future<Welcome> getGalleryDataPage2() async {
    try {
      final pageUrl2 =
          "http://www.pinkvilla.com/photo-gallery-feed-page/page/2";
      final response = await http.get(pageUrl2);
      if (200 == response.statusCode) {
        final Welcome nodes = welcomeFromJson(response.body);
        return nodes;
      } else {
        return Welcome();
      }
    } catch (e) {
      return Welcome();
    }
  }
}
