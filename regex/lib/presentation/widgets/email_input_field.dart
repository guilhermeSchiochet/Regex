import 'package:flutter/material.dart';
import 'package:regex/domain/usecases/validate_email_usecase.dart';
import 'package:regex/presentation/widgets/theme_app.dart';

class EmailInputField extends StatefulWidget {
  final ValidateEmailUseCase validateEmailUseCase;

  const EmailInputField({Key? key, required this.validateEmailUseCase}): super(key: key);

  @override
  _EmailInputFieldState createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {

  final TextEditingController _emailController = TextEditingController();
  
  bool _isValid = true;
  bool _isInitialValidation = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _validateEmail(String email) async {
    final isValid = await widget.validateEmailUseCase(email);
    setState(() {
      _isValid = isValid;
      _isInitialValidation = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'E-mail',
        hintText: 'Digite o seu e-mail',
        errorText: _isInitialValidation && !_isValid ? 'E-mail inválido' : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: ThemeApp.blueGrey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: _validateEmail,
    );
  }
}
