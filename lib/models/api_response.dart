import 'package:flutter/material.dart';

class APIResponse <T> {
  late T data ;
  late bool error ;
  late String errorMessage;

  APIResponse({required this.data, this.error=false});
  
}