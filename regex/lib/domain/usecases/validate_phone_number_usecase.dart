import 'package:regex/data/repositories/regex_repository.dart';

class ValidatePhomeMumberUseCase {
  final RegexRepository _regexRepository;

  ValidatePhomeMumberUseCase(this._regexRepository);

  Future<bool> call(String phoneNumber) async {
    final regexPattern = await _regexRepository.getRegexPattern('phone');

    if (RegExp(regexPattern.pattern!).hasMatch(phoneNumber)) {
      return true;
    } else {
      return false;
    }
  }
}
