import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:list_verbs/src/pages/setting_page.dart';

import 'package:list_verbs/src/provider/app_bar_provider.dart';
import 'package:list_verbs/src/provider/search_provider.dart';

import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {

  final double _prefferedHeight = 80.0;

  @override
  Widget build(BuildContext context) {

    final selectedAppBar = Provider.of<SelectedAppBar>(context);
    final search = Provider.of<SearchProvider>(context);

    switch (selectedAppBar.selectedAppBarOpt) {
      case 0:
        return _showTitle(context, selectedAppBar);
      case 1:
        return _showTextFild(context, selectedAppBar, search);
      default:
        return _showTitle(context, selectedAppBar);
    }
  }

  Widget _showTitle( BuildContext context, SelectedAppBar selectedAppBar ) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(top: 25.0),
      height: _prefferedHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: Theme.of(context).appBarTheme.iconTheme.color,
            icon: Icon(Icons.search_outlined),
            onPressed: (){
              selectedAppBar.selectedAppBarOpt = 1;
            },
          ),
          AutoSizeText(
            'Mi Lista de Verbos',
            style: Theme.of(context).appBarTheme.textTheme.title,
            minFontSize: 25,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          IconButton(
            color: Theme.of(context).appBarTheme.iconTheme.color,
            icon: Icon(Icons.more_vert_outlined),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
            },
          )
        ],
      ),
    );
  }

  Widget _showTextFild( BuildContext context, SelectedAppBar selectedAppBar, SearchProvider search ) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(top: 25.0),
      width: MediaQuery.of(context).size.width,
      height: _prefferedHeight,
      child: Row(
        children: [
          IconButton(
            color: Theme.of(context).appBarTheme.iconTheme.color,
            icon: Icon(Icons.close_outlined),
            onPressed: (){
              search.setSearch("");
              selectedAppBar.selectedAppBarOpt = 0;
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width - 50,
            child: TextField(
              //style: TextStyle(color: Colors.white),
              autofocus: true,
              //controller: _filter,
              decoration: new InputDecoration(
                labelText: 'Escriba un verbo',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search, color: Colors.white),
              ),
              onChanged: (text) {
                search.setSearch(text);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}