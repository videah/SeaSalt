import 'package:backfit/backfit.dart';

final client = BackfitClient(
  baseUrl: "https://e621.net",
  interceptors: [UserAgentInterceptor()],
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