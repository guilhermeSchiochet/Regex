import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:regex/domain/usecases/validate_phone_number_usecase.dart';
import 'package:regex/presentation/widgets/text_form_field_builder.dart';

class PhoneInputField extends StatefulWidget {
  final ValidatePhomeMumberUseCase validatePhoneUseCase;

  const PhoneInputField({Key? key, required this.validatePhoneUseCase}): super(key: key);

  @override
  _PhoneInputFieldState createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {

  final TextEditingController _phoneController = TextEditingController();

  bool _isValid = true;
  bool _isInitialValidation = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _validatePhone(String phone) async {
    final isValid = await widget.validatePhoneUseCase(phone);

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
      labelText: 'Telefone',
      onChanged: _validatePhone,
      controller: _phoneController,
      hintText: 'Digite o seu telefone',
      keyboardType: TextInputType.phone,
      autovalidateMode: AutovalidateMode.onUserInteraction ,
      errorText: _isInitialValidation && !_isValid ? 'Telefone inválido' : null,
      formatter: [
        MaskTextInputFormatter(mask: '(##) #####-####')
      ],
    );
  }
}