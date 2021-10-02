class BaseUrl {
  String url = 'http://192.168.100.146:8080/api/';
}
class ImageUrl {
  String url = 'http://192.168.100.146:8080/images/';
}

String striptags(String data) {
  RegExp exp = RegExp(r'<[^>]*>|&[^;]+;');
  return data.replaceAll(exp, '');
}
