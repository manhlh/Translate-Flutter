import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(EasyLocalization(child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;

    return EasyLocalizationProvider(
      data: data,
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasyLocalizationDelegate(locale: data.locale, path: "i18n")
        ],
        locale: data.locale,
        supportedLocales: [Locale("vi", "VN"), Locale("en", "US")],
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo translate'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var dataLocal = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: dataLocal,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(onPressed: (){
                    setState(() {
                      dataLocal.changeLocale(Locale("vi","VN"));
                       print(Localizations.localeOf(context).languageCode);
                    });
                  }, 
                  child: Image.asset("vietnam.png", width: 50, height: 50,)),
                  FlatButton(onPressed: (){
                    setState(() {
                      dataLocal.changeLocale(Locale("en", "US"));
                      print(Localizations.localeOf(context).languageCode);
                    });
                  }, child: Image.asset("united-kingdom.png", width: 50, height: 50,))
             
                ],
              ),
              Container(
                child: Text(tr("hello"), style: TextStyle(
                  fontSize: 40,
                  color: Colors.red,
                  fontWeight: FontWeight.bold
                ),),
              )
            ],
          )),
    );
  }
}
