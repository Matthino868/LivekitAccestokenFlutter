import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

String createToken(){
  // Minutes to live
  final int ttl = 2;
  final String API_KEY = '<API_KEY>';
  final String SECRET_KEY = '<SECRET_KEY>';
  final String room_name = '<name_of_room>';
  final String nickname = '<your_name>';

  final opts = JWT({
    'iss': API_KEY,
    'sub': nickname,
    'iat': DateTime.now().millisecondsSinceEpoch,
    'exp': DateTime.now().millisecondsSinceEpoch + ttl*1000,
    'video': {
      'roomJoin': true,
      'room': room_name,
    }
  });
  final token = opts.sign(Secretkey(SECRET_KEY));
  return token;
}
