import 'dart:async';
import '../models/user.dart';

/// 실제 배포 전까지는 In-Memory Mock.
/// 이후 Kakao/Apple SDK 연결 시 여기 메소드 내부만 바꾸면 됨.
class AuthService {
  AuthService._();
  static final I = AuthService._();

  final _ctrl = StreamController<AppUser?>.broadcast();
  AppUser? _current;

  Stream<AppUser?> get stream => _ctrl.stream;
  AppUser? get current => _current;

  Future<AppUser?> loginKakao() async {
    // TODO: kakao_flutter_sdk_user로 교체
    _current = const AppUser(
        id: 'kakao_123', displayName: '카카오 사용자', provider: 'kakao');
    _ctrl.add(_current);
    return _current;
  }

  Future<AppUser?> loginApple() async {
    // TODO: sign_in_with_apple로 교체
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
