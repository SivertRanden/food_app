
import 'package:food_app/services/user_service.dart';

import "package:food_app/app_state.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class AppStateContainer extends StatefulWidget {

  final AppState state;
  final Widget child;

  AppStateContainer({@required this.child, this.state});

  static _AppStateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
            as _InheritedStateContainer)
        .data;
  }

  @override
  _AppStateContainerState createState() => _AppStateContainerState();
}

class _AppStateContainerState extends State<AppStateContainer> {

  AppState state;
  UserService userService = UserService();

  @override
  initState(){
    super.initState();
    if(widget.state != null) {
      state = widget.state;
    } else {
      state = AppState(null);
      _setUserToState("EvFrWpyVlERRlMuoVVJ7");
    }
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child
    );
  }

  void _setUserToState(String id) async {
    state.user = await userService.getUserById(id);
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final _AppStateContainerState data;

  _InheritedStateContainer({Key key, @required this.data, @required Widget child})
    : super(key: key, child: child);
  
   @override
   bool updateShouldNotify(_InheritedStateContainer old) => true;
}