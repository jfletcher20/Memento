import 'package:http/http.dart' as http;

abstract class WebService {
  static String root = "https://cortex.foi.hr/lav/memento/";
  static String newsRoute = "news.php";

  static Future<String> getNews() async {
    return http.get(Uri.parse("$root$newsRoute")).then((response) {
      return response.body;
    });
  }

  static String image(String imagePath) => "$root$imagePath";
}
