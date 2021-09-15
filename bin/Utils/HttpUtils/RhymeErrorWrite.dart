

import 'dart:async';
import 'dart:io';
import 'package:stack_trace/stack_trace.dart';
import 'package:jaguar/jaguar.dart';


//报错的监听
class RhymeErrorWrite extends ErrorWriter{

  @override
  FutureOr<Response> make404(Context ctx) {
    //找不到页面时返回
    final resp =
    Response('''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
404
</body>
</html>''', statusCode: HttpStatus.notFound);
    resp.headers.contentType = ContentType.html;
    ctx.response = resp;
  }

  @override
  FutureOr<Response> make500(Context ctx, Object error, [StackTrace stack]) {
    // 服务器出错返回
    final resp =
    Response('''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
500
</body>
</html>''', statusCode: HttpStatus.internalServerError);
    resp.headers.contentType = ContentType.html;
    ctx.response = resp;
  }
}