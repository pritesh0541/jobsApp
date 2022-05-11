import 'package:jobs/model/search_model.dart';
import 'package:http/http.dart' as http;

class searchRepository {
  Future<List<SearchModel>?> getSearchModels() async {
    var client = http.Client();

    var url = Uri.parse("https://reqres.in/api/users");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      //  postFromJson(json);
    }
  }
}
