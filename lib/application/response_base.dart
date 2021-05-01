class Response {
  final bool isError;
  dynamic data;
  dynamic errors;

  Response(this.isError,[this.data, this.errors]);

  Response.withData({this.isError, this.data});
  Response.withErrors({this.isError, this.errors});

}