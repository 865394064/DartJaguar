import 'package:jaguar/jaguar.dart';

main()=>new Jaguar()
  ..staticFile('/', 'static/vaud.html')
  ..staticFiles('/static/*', 'static')
  ..log.onRecord.listen(print)
  ..serve(logRequests: true);