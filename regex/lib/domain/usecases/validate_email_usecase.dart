import 'package:regex/data/repositories/regex_repository.dart';

class ValidateEmailUseCase {
  final RegexRepository _regexRepository;

  ValidateEmailUseCase(this._regexRepository);

  Future<bool> call(String email) async {
    final regexPattern = await _regexRepository.getRegexPattern('email');

    if (RegExp(regexPattern.pattern!).hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }
}
