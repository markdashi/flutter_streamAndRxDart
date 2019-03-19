import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  double _warningOpciaty = 0.0;

  Widget LogoImage(){
    return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 41),
              child: Image.asset(
                'images/logo.png',
                width: 88,
                height: 47,
                ),
            );
  }
  Widget accountInput({@required double top}){
    return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(230, 230, 230, 1)),
                borderRadius: BorderRadius.all(Radius.circular(4.0))
              ),
              margin: EdgeInsets.only(top: top,left: 20,right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    Container(
                      height: 48,
                      margin: EdgeInsets.only(left:16,right: 10),
                      child: Image.asset(
                        'images/icon_msg.png',
                        width: 20,
                        height: 16,
                        ),
                    ), // 图片
                    Container(
                      child: Expanded(
                        child: TextField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          hintText: 'Your email address',
                          hintStyle: TextStyle(color:Colors.black12,fontSize: 12),
                          // filled: true,
                          border: InputBorder.none
                        ),
                      ),
                      ),
                    ), // 输入框
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 15),
                      child: InkWell(
                        onTap: (){},
                        child: Image.asset(
                          'images/icon_msg.png',
                          width: 20,
                          height: 16,
                        ),
                      ),
                    ),
                ],
              ),
            );
  }
  Widget _forgetPassword(){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 18),
      child: InkWell(
        onTap: (){},
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: Color.fromRGBO(243, 155, 99, 1),fontSize: 14),
      ),
      ),
    );
  }
  //登录按钮
  Widget _loginButton(context){
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width - 20*2,
      margin: EdgeInsets.only(top: 8),
      child: FlatButton(
          color: Color.fromRGBO(243, 155, 99, 1),
          shape: StadiumBorder(),
          onPressed: (){
            setState(() {
              _warningOpciaty = 1.0;
            });
          },
          child: Text(
            'SIGN IN',
            style: TextStyle(
              color: Colors.white
            ),
            ),
      ),
    );
  }
  // 提示文本
  Widget warningLabel(){
    return Opacity(
              opacity: _warningOpciaty,
              child: Container(
                margin: EdgeInsets.only(top: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'images/warning.png',
                      width: 14,
                      height: 12,
                      ),
                    Text(
                      ' Invalid email address',
                      style: TextStyle(color: Color.fromRGBO(213, 43, 30, 1),fontSize: 12),
                      )
                  ],
                ),
              ),
            );
  }
  // 第三方登录文本
  Widget _thirdLoginText(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 90,
            height: 1,
            color: Colors.black12,
          ),
          Text('Sign in with'),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 90,
            height: 1,
            color: Colors.black12,
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
            SignUp(), // 登录
            LogoImage(),// logo图片
            accountInput(top: 41),
            accountInput(top: 10),
            warningLabel(),
            _loginButton(context),
            _forgetPassword(),
            // _thirdLoginText()
        ],
      ),
      ),
    );
  }
}

// 登录
class SignUp extends StatefulWidget {
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 36,right: 21),
            width: double.infinity,
            child: InkWell(
              onTap: (){
                print('Sign Up');
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Color.fromRGBO(243, 155, 99, 1)),
              ),
            ),
          );
  }
}
