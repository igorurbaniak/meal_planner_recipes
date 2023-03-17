import 'package:flutter/material.dart';

SnackBar snackBarWhenFailure({required String snackBarFailureText}) {
  return SnackBar(
    content: Text(snackBarFailureText),
    backgroundColor: Colors.red,
  );
}

SnackBar snackBarWhenSuccess() {
  return const SnackBar(
    content: Text("Bravo! Success!"),
    backgroundColor: Colors.lightGreen,
  );
}
