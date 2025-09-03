import 'dart:async';
import '../models/user.dart';

class AuthService {
  AuthService._();
  static final I = AuthService._();

  final _ctrl = StreamController<AppUser?>.broadcast();
  AppUser? _current;

  Stream<AppUser?> get stream => _ctrl.stream;
  AppUser? get current => _current;

  Future<AppUser?> loginKakao() async {
    _current = const AppUser(
        id: 'kakao_123', displayName: '카카오 사용자', provider: 'kakao');
    _ctrl.add(_current);
    return _current;
  }

  Future<AppUser?> loginApple() async {
    _current = const AppUser(
        id: 'apple_123', displayName: 'Apple 사용자', provider: 'apple');
    _ctrl.add(_current);
    return _current;
  }

  Future<void> logout() async {
    _current = null;
    _ctrl.add(null);
  }
}
