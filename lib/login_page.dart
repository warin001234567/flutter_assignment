import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> 
{
  TextEditingController idcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  void checklogin()
  {
    _formKey.currentState.save();
    if (idcontroller.text == '' || passwordcontroller.text == '')
    {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('กรุณาระบุ user or password')));
    } else
    { 
      if (idcontroller.text == 'admin' && passwordcontroller.text == 'admin') 
      {
        Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
      }
      else
      {
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('user or password ไม่ถูกต้อง')));
      }
    
    }
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      key: _scaffoldKey,
      body: Form
      (
        key: _formKey,
        child: ListView
        (
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 50, left: 22, right: 22),
          children: <Widget>
          [
            Image.asset
            (
              'image/logo2.png',
              height: 150,
              width: 150,
            ),
            TextFormField
            (
              autofocus: false,
              controller: idcontroller,
              decoration: InputDecoration
              (
                  icon: Icon(Icons.people),
                  hintText: 'User Id'
              ),
            ),
            TextFormField
            (
              autofocus: false,
              controller: passwordcontroller,
              obscureText: true,
              decoration:
                  InputDecoration
                  (
                    icon: Icon(Icons.lock),
                    hintText: 'Password'
                  ),
            ),
            Padding
            (
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: RaisedButton
              (
                onPressed: checklogin,
                padding: EdgeInsets.all(5),
                color: Colors.grey,
                child: Text('LOGIN', style: TextStyle(color: Colors.white)),
              ),
            ),
            FlatButton
            (
              child: SizedBox
              (
                  width: double.infinity,
                  child: Text('Register new account',
                      style: TextStyle(color: Colors.blue),
                      textAlign: TextAlign.right)
              ),
              onPressed: () 
              {
                Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
