import 'package:flutter/material.dart';
import 'package:regex/data/repositories/regex_repository.dart';
import 'package:regex/domain/usecases/validate_email_usecase.dart';
import 'package:regex/domain/usecases/validate_phone_number_usecase.dart';
import 'package:regex/presentation/screens/home_page.dart';
import 'package:regex/presentation/widgets/theme_app.dart';

class AppRegex extends StatefulWidget {
  const AppRegex({super.key});

  @override
  State<AppRegex> createState() => _AppRegexState();
}

class _AppRegexState extends State<AppRegex> {
  
  late final regexRepository;
  late final validateEmailUseCase;
  late final validatePhoneNumberUseCase;

  @override
  void initState() {
    regexRepository = RegexRepositoryImpl();
    validateEmailUseCase = ValidateEmailUseCase(regexRepository);
    validatePhoneNumberUseCase = ValidatePhomeMumberUseCase(regexRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.themeData,
      debugShowCheckedModeBanner: false,
      home: HomePage(
        validateEmailUseCase: validateEmailUseCase,
        validatePhoneNumberUseCase: validatePhoneNumberUseCase,
      )
    );
  }
}