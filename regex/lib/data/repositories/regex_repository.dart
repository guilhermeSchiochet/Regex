import 'package:regex/data/models/regex_pattern.dart';

abstract class RegexRepository {
  Future<RegexPattern> getRegexPattern(String key);
}

class RegexRepositoryImpl implements RegexRepository {

  final Map<String, String> _patterns = {
    'cep': r'^\d{5}-\d{3}$',
    'cpf': r'^\d{3}\.\d{3}\.\d{3}-\d{2}$',
    'phone': r'^\(\d{2}\) \d{4,5}-\d{4}$',
    'email': r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    'cnpj': r'^\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}$',
    'hora': r'^(0?\d|1\d|2[0-3]):([0-5]\d):([0-5]\d)$',
    'data': r'^(0?[1-9]|[12]\d|3[01])\/(0?[1-9]|1[0-2])\/\d{4}$',
    'cpfcnpj': r'^\d{3}\.\d{3}\.\d{3}-\d{2}|\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}$',
  };

  @override
  Future<RegexPattern> getRegexPattern(String key) async {
    final pattern = _patterns[key];
    return RegexPattern(key, pattern);
  }
}
