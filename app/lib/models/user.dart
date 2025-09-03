class AppUser {
  final String id;
  final String displayName;
  final String? photoUrl;
  final String provider; // 'kakao' | 'apple' | 'guest'
  const AppUser({
    required this.id,
    required this.displayName,
    required this.provider,
    this.photoUrl,
  });
}
