import 'package:flutter/material.dart';
import 'package:regex/domain/usecases/validate_email_usecase.dart';
import 'package:regex/domain/usecases/validate_phone_number_usecase.dart';
import 'package:regex/presentation/widgets/email_input_field.dart';
import 'package:regex/presentation/widgets/phone_input_field.dart';
import 'package:regex/presentation/widgets/theme_app.dart';

class HomePage extends StatefulWidget {

  final ValidateEmailUseCase validateEmailUseCase;
  final ValidatePhomeMumberUseCase validatePhoneNumberUseCase;
  
  const HomePage({super.key, required this.validateEmailUseCase, required this.validatePhoneNumberUseCase});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _widgetsScreen,
    );
  }

  AppBar get _appBar {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      toolbarHeight: 120,
      backgroundColor: ThemeApp.blueGrey,
      title: Text(
        'Regex',
        style: TextStyle(
          fontSize: 28,
          color: ThemeApp.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget get _widgetsScreen {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          EmailInputField(
            validateEmailUseCase: widget.validateEmailUseCase,
          ),
          SizedBox(
            height: 30,
          ),
          PhoneInputField(
            validatePhoneUseCase: widget.validatePhoneNumberUseCase,
          )
        ],
      ),
    );
  }
}