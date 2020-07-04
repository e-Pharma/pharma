import 'package:flutter/material.dart';

class StartMenu extends StatefulWidget {
  @override
  _StartMenuState createState() => _StartMenuState();
}

class _StartMenuState extends State<StartMenu> with TickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
  }

  Widget StartMenuPage() {
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 120.0),
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
                  "E-pharma ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 125.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(40.0)),
                    color: Colors.cyan[400],
                    onPressed: () => gotoSignUp(),
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
                              "SIGN UP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
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
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
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
    );
  }

  Widget SignInPage(){
    return Scaffold (
      resizeToAvoidBottomPadding: false,
      body:
      Column(
        children: <Widget>[
          Container(
            child: SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/auth');
                    },
                    color: Colors.cyan,
                    textColor: Colors.white,
                    child: Text('Menu')
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            child: Center(
              child: Icon(
                Icons.local_hospital,
                color: Colors.cyanAccent[400],
                size: 60.0,
              ),
            ),
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                  child: new Text(
                    "EMAIL",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.cyan,
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: TextField(
                    obscureText: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'youremail@email.com',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 10.0,
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: new Text(
                    "PASSWORD",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.cyan,
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '*********',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 10.0,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: new FlatButton(
                  child: new Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  onPressed: () => {},
                ),
              ),
            ],
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
                    onPressed: (){
                      Navigator.pushNamed(context, '/home');
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
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(border: Border.all(width: 0.25)),
                  ),
                ),
                Text(
                  "OR CONNECT WITH",
                  style: TextStyle(
                    color: Colors.cyan[200],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(border: Border.all(width: 0.25)),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.only(right: 8.0),
                    alignment: Alignment.center,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: Color(0Xff3B5998),
                            onPressed: () => {},
                            child: new Container(
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(
                                    child: new FlatButton(
                                      onPressed: ()=>{},
                                      padding: EdgeInsets.only(
                                        top: 20.0,
                                        bottom: 20.0,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Icon(
                                            const IconData(0xea90,
                                                fontFamily: 'icomoon'),
                                            color: Colors.white,
                                            size: 15.0,
                                          ),
                                          Text(
                                            "FACEBOOK",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
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
                ),
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.only(left: 8.0),
                    alignment: Alignment.center,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: Color(0Xffdb3236),
                            onPressed: () => {},
                            child: new Container(
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(
                                    child: new FlatButton(
                                      onPressed: ()=>{},
                                      padding: EdgeInsets.only(
                                        top: 20.0,
                                        bottom: 20.0,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Icon(
                                            const IconData(0xea88,
                                                fontFamily: 'icomoon'),
                                            color: Colors.white,
                                            size: 15.0,
                                          ),
                                          Text(
                                            "GOOGLE",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget SignUpPage() {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body:
      Column(
        children: <Widget>[
          Container(
            child: SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/auth');
                    },
                    color: Colors.cyan,
                    textColor: Colors.white,
                    child: Text('Menu')),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(50.0),
            child: Center(
              child: Icon(
                Icons.local_hospital,
                color: Colors.cyanAccent[400],
                size: 60.0,
              ),
            ),
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.fromLTRB(40.0 , 0.0, 0.0, 0.0),
                  child: new Text(
                    "EMAIL",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan[400],
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.cyan[400],
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: TextField(
                    obscureText: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'youremail@email.com',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 10.0,
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "PASSWORD",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan[400],
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.cyan[400],
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '*********',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 10.0,
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "CONFIRM PASSWORD",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan[400],
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.cyan[400],
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '*********',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 24.0,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: new FlatButton(
                  child: new Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan[400],
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  onPressed: () => {},
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Colors.cyan[400],
                    onPressed: (){
                      Navigator.pushNamed(context, '/home');
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
                              "SIGN UP",
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

  gotoSignUp() {
    _controller.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  PageController _controller = new PageController(
    initialPage: 1, viewportFraction: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: PageView(
          controller: _controller,
          physics: new AlwaysScrollableScrollPhysics(),
          children: <Widget>[SignInPage(), StartMenuPage(), SignUpPage()],
          scrollDirection: Axis.horizontal,
        ));
  }
}
