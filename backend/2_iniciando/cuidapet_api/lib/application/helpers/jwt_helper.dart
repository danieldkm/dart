import 'package:dotenv/dotenv.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class JwtHelper {
  static final String _jwtSecret = DotEnv()
      .getOrElse('JWT_SECRET', () => DotEnv().getOrElse('jwtSecret', () => ''));

  JwtHelper._();

  static String generateJWT(int userId, int? supplierId) {
    final claimSet = JwtClaim(
      issuer: 'cuidapet',
      subject: userId.toString(),
      expiry: DateTime.now().add(const Duration(days: 1)),
      // expiry: DateTime.now().add(const Duration(seconds: 20)), // tests
      notBefore: DateTime.now(),
      issuedAt: DateTime.now(),
      otherClaims: {
        'supplier': supplierId,
      },
      maxAge: const Duration(days: 1),
      // maxAge: const Duration(seconds: 1), // tests
    );
    return 'Bearer ${issueJwtHS256(claimSet, _jwtSecret)}';
  }

  static JwtClaim getClaims(String token) {
    return verifyJwtHS256Signature(token, _jwtSecret);
  }

  static String refreshToken(String accessToken) {
    final claimSet = JwtClaim(
      issuer: accessToken,
      subject: 'RefreshToken',
      expiry: DateTime.now().add(const Duration(days: 20)),
      notBefore: DateTime.now().add(Duration(hours: 12)), // comments for tests
      issuedAt: DateTime.now(),
      otherClaims: {},
    );
    return 'Bearer ${issueJwtHS256(claimSet, _jwtSecret)}';
  }
}
