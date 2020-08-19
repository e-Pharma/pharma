import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:epharma/services/auth_service.dart';

class StartMenu extends StatefulWidget {
  @override
  _StartMenuState createState() => _StartMenuState();
}

class _StartMenuState extends State<StartMenu> with TickerProviderStateMixin {
  // ignore: non_constant_identifier_names
  String _user_name, _password;
  // ignore: unused_field
  static final _formKey = new GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isenabled;

  @override
  void initState() {
    super.initState();
    isenabled = true;
  }

  Future _handleLogin(
    // ignore: non_constant_identifier_names
    String _user_name,
    String _password,
    BuildContext context,
  ) async {
    AuthService().login(_user_name, _password).then((res) {
      if (res) {
        Navigator.pushNamed(context, '/home');
//        Application.router.navigateTo(context, '/home', clearStack: true);
      } else {
        isenabled = true;
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Invalid credentials"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Okay"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      }
    });
    //isenabled = true;
  }

  // ignore: non_constant_identifier_names
  Widget StartMenuPage() {
    return Flexible(
          child: Scaffold(
        backgroundColor: Colors.cyan[200],
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 120.0, bottom: 60.0),
              child: Center(
                child: Icon(
                  Icons.local_hospital,
                  color: Colors.white,
                  size: 80.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 30.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "ePharma ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 150.0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.white,
                      onPressed: () => gotoSignIn(),
                      child: new Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: Text(
                                "SIGN IN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.cyan[600],
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
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
    );
  }

  // ignore: non_constant_identifier_names
  Widget SignInPage() {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 100.0),
            child: Center(
              child: Icon(
                Icons.local_hospital,
                color: Colors.cyanAccent[400],
                size: 60.0,
              ),
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 85.0, 0.0, 0.0),
                      child: new TextFormField(
                        obscureText: false,
                        onChanged: (value) {
                          setState(() {
                            _user_name = value;
                          });
                        },
                        decoration: new InputDecoration(
                          labelText: "User Name",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          labelStyle:
                              TextStyle(color: Colors.cyan, fontSize: 20.0),
                        ),
//                    validator: OfficerIDValidator.validate,
                        keyboardType: TextInputType.text,
                      )),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 0.0),
                    child: new TextFormField(
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      decoration: new InputDecoration(
                        labelText: "Password",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                        labelStyle:
                            TextStyle(color: Colors.cyan, fontSize: 20.0),
                      ),
//                    validator: PasswordValidator.validate,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 80.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Colors.cyan,
                    onPressed: () {
                      if (isenabled) {
                        isenabled = false;
                        _handleLogin(_user_name, _password, context);
                      } else {
                        return null;
                      }
                    },
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  

  gotoSignIn() {
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }


  PageController _controller = new PageController(
    initialPage: 1,
    viewportFraction: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: PageView(
          controller: _controller,
          physics: new AlwaysScrollableScrollPhysics(),
          children: <Widget>[SignInPage(), StartMenuPage()],
          scrollDirection: Axis.horizontal,
        ));
  }
}
