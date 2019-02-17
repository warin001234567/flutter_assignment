import 'package:flutter/material.dart';
import 'login_page.dart';


class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() {
    return new RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> 
{
  TextEditingController idcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController passconfcontroller =TextEditingController();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();


  void checkregister(){
    _formKey.currentState.save();
    if (idcontroller.text == '' || passwordcontroller.text == '' || passconfcontroller.text == '') {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('กรุณาระบุข้อมูลให้ครบถ้วน')));
    }
    else{
      if (idcontroller.text == 'admin') {
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('user นี้มีอยู่ในระบบแล้ว')));
      }
      else{
        if(passwordcontroller.text != passconfcontroller.text){
          _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Password not match.')));
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    


    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
        ),
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 50, left: 22, right: 22),
          children: <Widget>[
            TextFormField(
              controller: idcontroller,
              decoration: InputDecoration(
                hintText: 'Email',
                icon: Icon(Icons.email)
              ),
            ),
            TextFormField(
              controller: passwordcontroller,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                icon: Icon(Icons.lock)
              ),
            ),
            TextFormField(
              obscureText: true,
              controller: passconfcontroller,
              decoration: InputDecoration(
                hintText: "Confirm",
                icon: Icon(Icons.lock)
              ),
            ),
            Padding
            (
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: RaisedButton
              (
                onPressed: checkregister,
                padding: EdgeInsets.all(5),
                color: Colors.grey,
                child: Text('LOGIN', style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}