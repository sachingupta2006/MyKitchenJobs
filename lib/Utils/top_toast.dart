import 'package:fluttertoast/fluttertoast.dart';

topToast(String msg) {
  Fluttertoast.showToast(msg: msg, gravity: ToastGravity.TOP);
}
