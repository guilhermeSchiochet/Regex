import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:regex/domain/usecases/validate_email_usecase.dart';
import 'package:regex/presentation/widgets/text_form_field_builder.dart';

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
    
    if(isValid != _isValid) {
      setState(() {
        _isValid = isValid;
        _isInitialValidation = true;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return TextFormFieldBuilder(
      labelText: 'E-mail',
      onChanged: _validateEmail,
      controller: _emailController,
      hintText: 'Digite o seu e-mail',
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction ,
      errorText: _isInitialValidation && !_isValid ? 'E-mail inválido' : null,
      formatter: [],
    );
  }
}
