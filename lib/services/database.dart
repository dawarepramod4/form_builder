import 'package:form_builder/data.dart';
import 'package:http/http.dart' as http;

String uri = "http://192.168.169.165:4000";

class DbService {
  //send datat to db
  void addData({required String question, required dynamic answer}) async {
    try {
      Data data = Data(
        id: '',
        question: '',
        answer: null,
      );

      http.post(Uri.parse('$uri/api/question'),
          body: data.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
    } catch (e) {
      print(e.toString());
    }
  }
}
