import 'package:flutter/material.dart';
import 'package:insta_clone/screens/signup_screen.dart';
import 'package:insta_clone/services/auth_service.dart';

class LoginScreen extends StatefulWidget {

  static final String id = 'login_  screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      // Login in the user w/Firebase
      AuthService.login(_email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
         child: Container(
           height: MediaQuery.of(context).size.height,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center ,
             crossAxisAlignment: CrossAxisAlignment.center  ,
             children: <Widget>[
               Text(
                 "Gitgram",
                 style: TextStyle(
                   fontSize: 50.0,
                   fontFamily: 'Billabong'
                 ),
               ),
               Form(
                 key: _formKey,
                 child: Column(
                   mainAxisSize: MainAxisSize.min ,
                   children: <Widget>[
                     Padding(
                       padding: EdgeInsets.symmetric(
                           horizontal: 30.0,
                           vertical: 10.0
                       ),
                       child: TextFormField(
                         decoration: InputDecoration(
                            labelText: "Email",
                         ),
                         validator: (input) => !input.contains('@') ? 'Insira um email valido' :  null, // validando o email
                         onSaved: (input) => _email = input,
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.symmetric(
                           horizontal: 30.0,
                           vertical: 10.0
                       ),
                       child: TextFormField(
                         decoration: InputDecoration(
                           labelText: "Senha",
                         ),
                         validator: (input) => input.length < 6  // Validando a senha
                             ? 'A senha deve conter no minimo 6 caracteres '
                             :  null,
                         onSaved: (input) => _password = input,
                         obscureText: true,  // Olcutar a senha com bolinhas
                       ),
                     ),
                     //Botao de Login
                     SizedBox(height: 20.0,),
                     Container(
                       width: 250.0,
                       child: FlatButton(
                         onPressed: _submit,
                         color: Colors.blue,
                         padding: EdgeInsets.all(10.0 ),
                         child: Text(
                           "Entrar",
                           style: TextStyle(
                              color: Colors.white,
                             fontSize: 18.0,
                           ),
                         ),
                       ),
                     ),
                     //Botao de Criar Conta
                     SizedBox(height: 20.0,),
                     Container(
                       width: 250.0,
                       child: FlatButton(
                         onPressed: () => Navigator.pushNamed(context, SignupScreen.id),
                         color: Colors.blue,
                         padding: EdgeInsets.all(10.0 ),
                         child: Text(
                           "Criar Conta",
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 18.0,
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
       ),
    );
  }
}
