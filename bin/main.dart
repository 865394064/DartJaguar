import 'package:jaguar/jaguar.dart';
import 'package:path/path.dart' as path;

import 'Utils/HttpUtils/RhymeErrorWrite.dart';
// path.relative("static/vaud.html", from: path2)
// main()=>new Jaguar()
//
//   ..staticFile('/', '/Users/hoge/Desktop/work/package/flutterapp/DartJaguar/static/vaud.html')
//   ..staticFiles('/Users/hoge/Desktop/work/package/flutterapp/DartJaguar/static/*', '/Users/hoge/Desktop/work/package/flutterapp/DartJaguar/static/')
//   ..log.onRecord.listen(print)
//   ..serve(logRequests: true);

main()=>new Jaguar(errorWriter: new RhymeErrorWrite())
  // ..get('/api/doGet/:id', (ctx){
  //   String id=ctx.pathParams['id'];
  //   ctx.response=Response('path Id:$id');
  // })
  ..get('/api/doGet/', (ctx) {

    //这样子可以通过http://localhost:8080/api/doGet?id=322 来获取到参数 //可以添加默认值
      String id=ctx.query.get('id');
      ctx.response = Response('query Id:$id');
    })
  ..getJson('/api/doGetJson', (ctx)=>'{"id":3221}')

  //post 处理
  // ..post('/api/doPost', (ctx) =>ctx.bodyAsJson())
  ..post('/api/User/login', (ctx) async{
    Map<String,String> params=await ctx.bodyAsUrlEncodedForm();
    String userName=params['username'];
    String passWord=params['password'];
    ctx.response=Response('UserName:$userName\nPassWord:$passWord');
  })
  ..postJson('/api/doPostJson', (ctx)=>'{"id":4234}')
  ..delete('/api/doDelete', (ctx)=>'delete')
  ..deleteJson('/api/doDelete', (ctx) =>'{"id":253}')
  ..put('/api/doPut', (ctx)=>'put')
  ..putJson('/api/doPutJson', (ctx)=>'{"id":2343}')
  ..options('/api/doOptions', (ctx)=>'options')
  ..patch('/api/doPatch', (ctx)=>'Patch')
  ..html('api/doHtml', (ctx)=>'''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
Body
</body>
</html>''')
  ..json('/api/doJson', (ctx)=>'{"id":123}')
  ..serve(logRequests: true);