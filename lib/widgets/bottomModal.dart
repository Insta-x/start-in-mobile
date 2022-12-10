import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

//USAGE: 
// must be used with outer/ wrapper function

// _wrapperFunction(){

//   showBottomModal(context, content)

// }
// import this function to your page app, then use event handler e.g onTap, onPressed to invoke the wrapper function.

// content should extends StatefulWidget without SCAFFOLDING!
showBottomModal(context, StatefulWidget content) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return content;
      });
  }