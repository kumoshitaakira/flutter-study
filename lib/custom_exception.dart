class CustomException implements Exception {
  const CustomException({this.message = 'Auth Error!'});

  final String? message;

  @override
  String toString() => 'CustomException { message: $message}';
}
