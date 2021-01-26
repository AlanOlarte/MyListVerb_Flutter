import 'package:auto_size_text/auto_size_text.dart';
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
      appBar: AppBar(
        title: AutoSizeText('Configuracion',
          style: Theme.of(context).appBarTheme.textTheme.title,
          minFontSize: 25,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 10.0,
          bottom: 10.0
        ),
        child: Column(
          children: <Widget>[
            _crearSwitchListMostrar( showVerb, theme.getThemeType() ),
            Divider(),
            _crearSwitchListTheme( theme ),
            Divider(),
            _crearSwitchListOrdenar(orderVerb, theme.getThemeType()),
            Divider(),
            _crearDropDown( type ),
            Divider(),
            RaisedButton(
              elevation: 0,
              padding: EdgeInsets.only(left: 40.0 ,right: 40.0, top: 10.0, bottom: 10.0),
              child: Text('Acerca de', style: Theme.of(context).textTheme.button,),
              color: Theme.of(context).dividerColor,
              onPressed: () => _mostrarAlert(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSwitchListMostrar( ShowSpanishVerb showSpanishVerb, bool theme ) {
    return SwitchListTile(
      title: Text(
        'Mostrar pronunciación',
        style: Theme.of(context).textTheme.headline4,
      ),
      activeColor: Colors.red[900],
      activeTrackColor: Colors.red[300],
      inactiveThumbColor: theme ? Colors.blueGrey[500]:Colors.blueGrey[900],
      inactiveTrackColor: theme ? Colors.blueGrey[100]:Colors.blueGrey[500],
      value: showSpanishVerb.showVerb,
      onChanged: (valor) {
        showSpanishVerb.showVerb = valor;
      },
    );
  }

  Widget _crearSwitchListTheme(ThemeChanger theme) {
    return SwitchListTile(
      title: Text(
        'Tema obscuro',
        style: Theme.of(context).textTheme.headline4,
      ),
      activeColor: Colors.red[900],
      activeTrackColor: Colors.red[300],
      inactiveThumbColor: Colors.blueGrey[900],
      inactiveTrackColor: Colors.blueGrey[500],
      value: theme.getThemeType(),
      onChanged: (valor) {
        theme.setTheme( valor );
      },
    );
  }

  Widget _crearSwitchListOrdenar(OrderProvider order, bool theme) {
    return SwitchListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
          'Ordenar verbos alfabéticamente',
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          '(verbos infinitivos en ingles)',
          style: Theme.of(context).textTheme.headline3,
        ),
        ],
      ),
      activeColor: Colors.red[900],
      activeTrackColor: Colors.red[300],
      inactiveThumbColor: theme ? Colors.blueGrey[500]:Colors.blueGrey[900],
      inactiveTrackColor: theme ? Colors.blueGrey[100]:Colors.blueGrey[500],
      value: order.orderVerb,
      onChanged: (valor) {
        order.orderVerb = valor;
      },
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(List<String> list) {
    List<DropdownMenuItem<String>> lista = new List();
    list.forEach( (verbo) {
      lista.add(DropdownMenuItem(
        child: Text(verbo, style: Theme.of(context).textTheme.headline2, textAlign: TextAlign.left,),
        value: verbo,
      ));
    });
    return lista;
  }

  Widget _crearDropDown(FilterTypeVerb type) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.only(right: 10.0,left: 20.0),
            child: Text(
                'Ver verbos: ',
                style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: DropdownButton(
            dropdownColor: Theme.of(context).accentColor,
            icon: Icon(Icons.arrow_drop_down_circle_outlined),
            iconEnabledColor: Theme.of(context).dividerColor,
            isExpanded: true,
            value: type.getVerboSeleccionado(),
            items: getOpcionesDropdown(type.getList()),
            onChanged: (opt){
              type.setTypeVerb(type.getList().indexOf(opt));
              type.setVerboSeleccionado(opt);
            },
          ),
        ),
      ],
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
            title: Text('Acerca de'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Esta aplicacion fue desarrollada por Alan Eduardo Trinidad Olarte, '
                    'estudiante de ingeniería en software de la Universidad Politécnica del Centro.',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: 50.0,),
                Row(
                  children: [
                    Icon(Icons.mail_outline),
                    SizedBox(width: 5.0,),
                    Text('xlxnolxrte@gmail.com',style: Theme.of(context).textTheme.headline2),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.copy_outlined),
                      onPressed: (){
                        Clipboard.setData(ClipboardData(text: 'xlxnolxrte@gmail.com'));
                        Fluttertoast.showToast(
                            msg: "Copiado",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            fontSize: 16.0
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/github.png",
                      color: Theme.of(context).iconTheme.color,
                      width: 22.5,
                    ),
                    SizedBox(width: 5.0,),
                    Text('repositorio GitHub', style: Theme.of(context).textTheme.headline2,),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.open_in_browser_outlined),
                      onPressed: () async {
                        const url = 'https://github.com/AlanOlarte';
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
              FlatButton(
                child: Text('Cerrar', style: Theme.of(context).textTheme.headline2,),
                onPressed: ()=> Navigator.of(context).pop(),
              ),
            ],
          );
        }
    );
  }

}