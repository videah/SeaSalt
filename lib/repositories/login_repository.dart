import 'dart:async';

import 'package:backfit/backfit.dart';
import 'package:hive/hive.dart';

import 'package:seasalt/services/posts_service.dart';

class LoginRepository {
  final PostsService service;

  LoginRepository({required this.service});

  Future<void> storeCredentials(String username, String password) async {
    var secrets = Hive.box("secrets");
    var encodedCredentials = base64Encode(utf8.encode("$username:$password"));
    await secrets.put("username", username);
    await secrets.put("credentials", encodedCredentials);
  }

  Future<void> clearCredentials() async {
    await Hive.box("secrets").delete("username");
    await Hive.box("secrets").delete("credentials");
  }

  Future<String> checkCredentials() async {
    var secrets = Hive.box("secrets");
    if (secrets.containsKey("credentials")) {
      try {
        var response = await service.getPosts();
        return response.reasonPhrase ?? "Unknown";
      } on TimeoutException catch(_) {
        return "Timeout";
      }
    } else {
      return "Unknown";
    }
  }
}
