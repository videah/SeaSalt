import 'package:backfit/backfit.dart';
import 'package:hive/hive.dart';

final client = BackfitClient(
  baseUrl: "https://e621.net",
  interceptors: [UserAgentInterceptor(), BasicAuthInterceptor()],
);

/// An interceptor for [BackfitClient] to add a User-Agent header, which e621
/// expects when using the API to prevent abuse.
class UserAgentInterceptor extends RequestInterceptor {
  @override
  BaseRequest? onInterceptRequest(BaseRequest request) {
    request.headers.addAll({
      "User-Agent": "SeaSalt/1.0 (e621/e926 viewer)",
    });
    return request;
  }
}

class BasicAuthInterceptor extends RequestInterceptor {
  @override
  BaseRequest? onInterceptRequest(BaseRequest request) {
    var secrets = Hive.box("secrets");

    // Make sure the secrets box is open first before we do anything crazy.
    if (!secrets.isOpen) return request;

    if (secrets.containsKey("credentials")) {
      // The credentials are encoded with base64, we just assume that
      // due diligence has been done elsewhere to enforce this.
      String credentials = secrets.get("credentials");
      request.headers.addAll({"Authorization": "Basic $credentials"});
      print(request.headers);
      print("Authenticated request made!");
      return request;
    }

    print("Request is not authenticated");

    return request;
  }
}
