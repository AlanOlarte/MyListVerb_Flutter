import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:list_verbs/src/provider/order_provider.dart';
import 'package:list_verbs/src/provider/show_spanish_verb.dart';
import 'package:list_verbs/src/provider/theme_provider.dart';
import 'package:list_verbs/src/provider/filter_verb.dart';

import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final showVerb = Provider.of<ShowSpanishVerb>(context);
    final orderVerb = Provider.of<OrderProvider>(context);
    final theme = Provider.of<ThemeChanger>(context);
    final type = Provider.of<FilterTypeVerb>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: FittedBox(
          fit: BoxFit.contain,
          child: Text('Configuración',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.028,
                fontFamily: "BalsamiqSans",
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
              )),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Column(
          children: <Widget>[
            _crearSwitchListMostrar(showVerb, theme.getThemeType()),
            _crearSwitchListTheme(theme),
            _crearSwitchListOrdenar(orderVerb, theme.getThemeType()),
            _crearDropDown(type),
            ElevatedButton(
              child: Text(
                'Acerca de',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontFamily: "BalsamiqSans",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w200,
                    color: Colors.white
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.only(
                    left: 40.0, right: 40.0, top: 10.0, bottom: 10.0),
                primary: Theme.of(context).primaryColor,
                onPrimary: Theme.of(context).splashColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
              onPressed: () => _mostrarAlert(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSwitchListMostrar(ShowSpanishVerb showSpanishVerb, bool theme) {
    return Container(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: SwitchListTile(
        title: Text('Mostrar pronunciación',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.0225,
              fontFamily: "BalsamiqSans",
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w200,
            )
        ),
        activeColor: Colors.red[900],
        activeTrackColor: Colors.red[300],
        inactiveThumbColor: theme ? Colors.blueGrey[500] : Colors.blueGrey[900],
        inactiveTrackColor: theme ? Colors.blueGrey[100] : Colors.blueGrey[500],
        value: showSpanishVerb.showVerb,
        onChanged: (valor) {
          showSpanishVerb.showVerb = valor;
        },
      ),
    );
  }

  Widget _crearSwitchListTheme(ThemeChanger theme) {
    return Container(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: SwitchListTile(
        title: Text('Tema obscuro',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.0225,
              fontFamily: "BalsamiqSans",
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w200,
            )
        ),
        activeColor: Colors.red[900],
        activeTrackColor: Colors.red[300],
        inactiveThumbColor: Colors.blueGrey[900],
        inactiveTrackColor: Colors.blueGrey[500],
        value: theme.getThemeType(),
        onChanged: (valor) {
          theme.setTheme(valor);
        },
      ),
    );
  }

  Widget _crearSwitchListOrdenar(OrderProvider order, bool theme) {
    return Container(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: SwitchListTile(
        title: Text(
          'Ordenar verbos alfabéticamente',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.0225,
            fontFamily: "BalsamiqSans",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w200,
          ),
        ),
        subtitle: Text('(verbos infinitivos en ingles)',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.018,
              fontFamily: "BalsamiqSans",
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w200,
            )
        ),
        activeColor: Colors.red[900],
        activeTrackColor: Colors.red[300],
        inactiveThumbColor: theme ? Colors.blueGrey[500] : Colors.blueGrey[900],
        inactiveTrackColor: theme ? Colors.blueGrey[100] : Colors.blueGrey[500],
        value: order.orderVerb,
        onChanged: (valor) {
          order.orderVerb = valor;
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(List<String> list) {
    List<DropdownMenuItem<String>> lista = [];
    list.forEach((verbo) {
      lista.add(DropdownMenuItem(
        child: Text(
          verbo,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.025,
            fontFamily: "BalsamiqSans",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w200,
          ),
        ),
        value: verbo,
      ));
    });
    return lista;
  }

  Widget _crearDropDown(FilterTypeVerb type) {
    return Container(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(right: 10.0, left: 20.0),
              child: Text(
                'Ver verbos: ',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontFamily: "BalsamiqSans",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: DropdownButton(
              dropdownColor: Theme.of(context).backgroundColor,
              icon: Icon(Icons.arrow_drop_down_circle_outlined),
              isExpanded: true,
              value: type.getVerboSeleccionado(),
              items: getOpcionesDropdown(type.getList()),
              onChanged: (opt) {
                type.setTypeVerb(type.getList().indexOf(opt));
                type.setVerboSeleccionado(opt.toString());
              },
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).backgroundColor,
            contentPadding: EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            title: Text(
              "Acerca de",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.025,
                fontFamily: "BalsamiqSans",
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w200,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Esta aplicacion fue desarrollada por Alan Eduardo Trinidad Olarte, estudiante de ingeniería en software de la Universidad Politécnica del Centro.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontFamily: "BalsamiqSans",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.mail_outline,
                      size: MediaQuery.of(context).size.height * 0.022,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'xlxnolxrte@gmail.com',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                        fontFamily: "BalsamiqSans",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.copy_outlined,
                        size: MediaQuery.of(context).size.height * 0.022,
                      ),
                      onPressed: () {
                        Clipboard.setData(
                            ClipboardData(text: 'xlxnolxrte@gmail.com'));
                        Fluttertoast.showToast(
                            msg: "Copiado",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            fontSize: 16.0);
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/github.png",
                      color: Theme.of(context).iconTheme.color,
                      width: MediaQuery.of(context).size.height * 0.022,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'repositorio GitHub',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                        fontFamily: "BalsamiqSans",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.open_in_browser_outlined,
                        size: MediaQuery.of(context).size.height * 0.022,
                      ),
                      onPressed: () async {
                        const url =
                            'https://github.com/AlanOlarte/MyListVerb_Flutter';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Theme.of(context).splashColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                child: Text(
                  'Cerrar',
                  //style: Theme.of(context).textTheme.headline2,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.white),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        });
  }
}
