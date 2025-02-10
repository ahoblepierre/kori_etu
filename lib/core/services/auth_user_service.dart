import 'dart:convert';
import 'dart:io';

class AuthUserService {
  String filePath = "auth.json";

  AuthUserService() {
    createFile();
  }

  bool attempt(String emailOrPhone) {
    File file = File(filePath);
    if (file.existsSync()) {
      String content = file.readAsStringSync();
      Map<String, dynamic> data = jsonDecode(content);
      return data.containsKey(emailOrPhone);
    }
    return false;
  }

  Future<void> save(String name, String lastname, String emailOrPhone) async {
    File file = File(filePath);
    Map<String, dynamic> data = {};
    if (file.existsSync()) {
      String content = file.readAsStringSync();
      data = jsonDecode(content);
    }
    data[emailOrPhone] = {
      'name': name,
      'lastname': lastname,
      'emailOrPhone': emailOrPhone,
    };
    file.writeAsStringSync(jsonEncode(data));
  }

  void createFile() {
    File file = File(filePath);
    try {
      if (!file.existsSync()) {
        file.createSync(
            recursive: true); // Create the file and any necessary directories
        file.writeAsStringSync(
            jsonEncode({})); // Initialize with an empty JSON object
      }
    } catch (e) {
      print('Error creating file: $e');
    }
  }
}
