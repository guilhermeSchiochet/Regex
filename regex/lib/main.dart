import 'dart:io';
import 'package:flutter/material.dart';

/*
  > @ Guilherme Schiochet
  > Intagram @starkzhx
  > Relizado testes ultilizando regex
*/ 

void main(){

  runApp(ValidacaoCampoText());

  final String texto = stdin.readLineSync() ?? '';
  _tipoText(texto);
  _filtraCodigo();
}

  /// As validações do Reg foram feitas com base no aprendizado do curso de Regex do flutterando( Comunidade de dart )
  String _tipoText(String texto){

    ///Valida se é um gmail. guilherme3_teste@gmail.com
    if(RegExp('[a-z 0-9 _!.]+@[a-z.]+').hasMatch(texto)){
      return 'Email';
      ///Valida se é uma hora. 13:24
    } else if(RegExp(r'\d{2}:\d{2}').hasMatch(texto)){
      return 'Hora';
      ///Valida se é uma data. 27/04/2022
    } else if(RegExp(r'\d?\d[-./]\d?\d[-./]\d?\d?\d\d').hasMatch(texto)){
      return 'Data';
      ///Valida se é um numero. (47) 92131-3253 
    } else if(RegExp(r'(\(\d{2}\)\s)?(\d{4,5}[-. ]\d{4})').hasMatch(texto)){
      return 'Numero';
      ///Valida se é um cpf. 987.654.321-00
    } else if(RegExp(r'\d{3}\.\d{3}\.\d{3}-\d{2}|\d{11}').hasMatch(texto)){
      return 'Cpf';
      ///Valida se é um cpnpj. 23.082.589/0001-10
    } else if(RegExp(r'([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})').hasMatch(texto)){
      return 'cnpj';
    }
    return '';
  }

  void _filtraCodigo(){
    ///Ultilizado a lista negada. todo que NÃO estiver dentro dessa lista sera excluido.
    final RegExp regex = RegExp(r'[^\D-]');

    print('Seu codigo é 123-456'.replaceAll(regex, ''));
    print('123-093 esse é seu codigo'.replaceAll(regex, ''));
    print('098-123 poderia ser seu codigo, mas seu codigo na verdade é 123-098'.replaceAll(regex, ''));

    ///Metodo com melhor eficiencia.
    final RegExp grupRegex = RegExp(r'(\d{3}-\d{3})');
    final match = grupRegex.firstMatch('Eu declaro o seu codigo como 163-154');
    print(match?.group(1));
  }

class ValidacaoCampoText extends StatelessWidget{
  const ValidacaoCampoText({Key? key}) : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meus projetos',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Regex')),
        ),
        body: Column(
          children: [
            this._textFormField()
          ],
        ),
      ),
    );
  }

  ///Campo de para por um cpf 
  Widget _textFormField(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder()
        ),
        autocorrect: true,
        maxLength: 14,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (text) {
          if(!RegExp(r'\d{3}\.\d{3}\.\d{3}-\d{2}|\d{11}').hasMatch(text ?? '')){
            return 'Digite um cpf valido';
          }
          return null;
        },
      ),
    );
  }
    
}