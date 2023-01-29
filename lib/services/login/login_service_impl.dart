import 'package:firebase_auth/firebase_auth.dart';

import 'package:app_filmes/repositories/login/login_repository.dart';
import 'login_service.dart';

class LoginServiceImpl implements LoginService {
  LoginServiceImpl({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  final LoginRepository _loginRepository;

  @override
  Future<UserCredential> login() => _loginRepository.login();

  @override
  Future<void> logout() => _loginRepository.logout();
}
