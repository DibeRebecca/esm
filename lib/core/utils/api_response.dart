class APIresponse {
  final bool succes;
  final Map<String, dynamic>? data;
  String? erreur;
  String? token;
  APIresponse({ this.data, this.erreur, required this.succes, this.token});
}
