import 'package:examen_flutter/routes/Producto.dart';
import 'package:examen_flutter/routes/Registro.dart';
import 'package:examen_flutter/routes/ForgotPassword.dart';
import 'package:flutter/material.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:examen_flutter/widgets/raisedgradbutton.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());
//este comentario es prueba xdxd
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examen',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Montserrat'
      ),
      home: MyHomePage(title: 'PLAT'),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

 class MainScreen extends StatelessWidget  {
   final style =  new TextStyle(fontFamily: 'Montserrat');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /* appBar: AppBar(
        title: Text('Home'),
      ),  */
      appBar: GradientAppBar(
        title: Text('Home'),
        gradient: /* LinearGradient(colors: [Colors.blue, Colors.purple, Colors.red]) */
                  LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xFF064B71), const Color(0xFF2692C2)],
              ),
      ),
      drawer: AppDrawer(),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
          height: 160.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              InkWell(
                child: SizedBox(
                  width: 160.0,
                  child: Image.asset("assets/sneakers.png", fit: BoxFit.contain),
                  
                ),
                onTap: () { Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Producto1(image: 'assets/sneakers.png')));} ,
              ),
              InkWell(
                child: SizedBox(
                  width: 160.0,
                  child: Image.asset("assets/hoodie.png", fit: BoxFit.contain),
                  
                ),
                onTap: () { Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Producto1(image: 'assets/hoodie.png')));} ,
              ),
             InkWell(
                child: SizedBox(
                  width: 160.0,
                  child: Image.asset("assets/supreme.png", fit: BoxFit.contain),
                  
                ),
                onTap: () { Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Producto1(image: 'assets/supreme.png')));} ,
              ),
              InkWell(
                child: SizedBox(
                  width: 160.0,
                  child: Image.asset("assets/tee.png", fit: BoxFit.contain),
                  
                ),
                onTap: () { Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Producto1(image: 'assets/tee.png')));} ,
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        Divider(),
        Expanded(
           child: ListView(
          children: <Widget>[
            SizedBox(height: 20,),
            Card(
              child: ListTile(
                leading: Icon(Icons.book, size: 50),
                title: Text('Nike AirForce 1', style: TextStyle(fontSize: 30)),
                subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Producto1(image: 'assets/sneakers.png')));
                }
              ),
            ),
            SizedBox(height: 20,),
            Card(
              child: ListTile(
                leading: Icon(Icons.book, size: 50),
                title: Text('Champion Hoodie', style: TextStyle(fontSize: 30)),
                subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Producto1(image: 'assets/hoodie.png')));
                }
              ),
            ),
            SizedBox(height: 20,),
            Card(
              child: ListTile(
                leading: Icon(Icons.book, size: 50),
                title: Text('Supreme Fanny Pack', style: TextStyle(fontSize: 30)),
                subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Producto1(image: 'assets/supreme.png')));
                }
              ),
            ),
            SizedBox(height: 20,),
            Card(
              child: ListTile(
                leading: Icon(Icons.book, size: 50),
                title: Text('Supreme Tee', style: TextStyle(fontSize: 30)),
                subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Producto1(image: 'assets/tee.png')));
                }
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
        ),
        /* ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.book, size: 50),
                title: Text('Producto 1', style: TextStyle(fontSize: 30)),
                subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Producto1()));
                }
              ),
            ),
          ],
        ), */
          ],
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new Login(),
      title: new Text('Welcome to PLAT',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: new Image.asset(
                        "assets/logo.png",
                      ),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.red
    );
  }
}

class Login extends StatelessWidget {
  final username = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    final emailField = TextField(
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
              controller: username,
        );
    final passwordField = TextField(
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
          controller: password,
        );
    final loginButton = RaisedGradientButton(
          gradient: LinearGradient(
            colors: <Color>[Color(0xff01ac4d3),Color(0xff0299cce),]
          ),
          
          onPressed: () {
            if(username.text == 'admin' && password.text =='admin')
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MainScreen()));
              else
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // Retrieve the text the that user has entered by using the
                      // TextEditingController.
                      content: Text('Usuario y/o contraseña incorrectos!'),
                    );
                  },
                );    
              },
          child: Text("Log in",
            textAlign: TextAlign.center,
            style: style.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold)),
        );

        final registerButton = RaisedGradientButton(
          gradient: LinearGradient(
            colors: <Color>[Color(0xff01ac4d3),Color(0xff0299cce),]
          ),
          onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Registro()));
            },
          child: Text("Sign up",
            textAlign: TextAlign.center,
            style: style.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold)
          ),          
        );

    return Scaffold(
      appBar: GradientAppBar(
        title: Text('Login'),
        gradient: /* LinearGradient(colors: [Colors.blue, Colors.purple, Colors.red]) */
                  LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xFF064B71), const Color(0xFF2692C2)],
              ),
              actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MainScreen()));
              },
            ),
          ],
      ),
      body:  ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                       child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ), 
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButton,
                    SizedBox(
                      height: 10.0,
                    ),
                    registerButton,
                    SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      child: Text('Forgot your password?', style: TextStyle(fontSize: 18, decoration: TextDecoration.underline, fontWeight: FontWeight.bold)
                      ,),
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ForgotPassword()))  
                      }
                      ,)
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}

