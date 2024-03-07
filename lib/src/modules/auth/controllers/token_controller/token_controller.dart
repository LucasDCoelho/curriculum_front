import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'token_controller.g.dart';

class TokenController = _TokenController with _$TokenController;

abstract class _TokenController with Store{
  static const _tokenKey = "token_key";
  final _prefs = SharedPreferences.getInstance();

  @observable
  late String token = "";

  @observable
  late int tokenId = 0;

  @action
  Future saveToken(String value) async{
    final SharedPreferences prefs = await _prefs;
    if(value.isNotEmpty){
      prefs.setString(_tokenKey, value);
      token = value;
      print('Token salvo: $token');
    }
  }

  @action
  Future clearToken() async{
    final SharedPreferences prefs = await _prefs;
    final savedToken = prefs.getString(_tokenKey);
    prefs.remove(_tokenKey);
    token = "";
    print('Token limpo: $savedToken');
  }

  @action
  Future<bool> isGetToken() async{
    final SharedPreferences prefs = await _prefs;
    final savedToken = prefs.getString(_tokenKey);
    if (savedToken != null) {
      return true;
    }
    return false;
  }

  @action
  Future<String?> getToken() async{
    final SharedPreferences prefs = await _prefs;
    final savedToken = prefs.getString(_tokenKey);
    return savedToken;
  }

  Future<String> decodedToken() async{
    final token = await getToken();
    if(token != null){
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      String userRole = decodedToken['role'];
      return userRole;
    }
    return "";
  }

  Future<bool> isTokenValid() async{
    final token = await getToken();
    if(token != null){
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      int userExpiration = decodedToken['exp'] as int;
      if(userExpiration == 0){
        return false;
      }

      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      return now < userExpiration;
    }
    return false;
  }

  @computed
  int get getTokenId => tokenId;

  @action
  Future decodedTokenId() async{
      final token = await getToken();

      final decodedToken = JwtDecoder.decode(token!);
      tokenId = decodedToken["id"];
  }
}