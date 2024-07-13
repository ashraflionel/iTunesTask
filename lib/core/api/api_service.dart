import 'package:http/http.dart' as http;
import 'package:m2pfintech_task/core/utils/constants.dart';


class ApiService {
  Future<http.Response> fetchVideoService() async {
    try {
      final response = await http.get(Uri.parse(Constants.baseUrl));
      if (response.statusCode == 200) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
