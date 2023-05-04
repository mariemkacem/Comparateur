import 'package:http/http.dart' as http ;
class ApiService {


static const String apiUrl = "https://localhost:7035/api/Auth/allusers";

  static Future<http.Response> get(String endpoint) async {
    var response = await http.get(Uri.parse('$apiUrl/$endpoint'));

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load data from API');
    }
  }




}
