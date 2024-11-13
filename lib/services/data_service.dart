import 'package:sample/model/post_model.dart';
import 'package:sample/services/http_service.dart';

class DataService {
  static final DataService _singleton = DataService._internal();

  final HttpService _httpService = HttpService();

  factory DataService() {
    return _singleton;
  }

  DataService._internal();

//From getPosts() - get post list
  Future<Posts> getPosts() async {
    String path = 'posts/';

    var response = await _httpService.get(path);
    if (response?.statusCode == 200 && response?.data != null) {
      Posts post = Posts.fromJson(response!.data);
      return post;
    }
    // Handle errors or unexpected cases
    return Posts(
      posts: [],
      total: 0,
      skip: 0,
      limit: 0,
    );
  }
}
