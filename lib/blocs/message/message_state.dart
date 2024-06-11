import 'package:flutter/material.dart';

enum TypeMessage { warning, error, information, none }

abstract class MessageState {}

class MessageSend extends MessageState {
  String message = '';
  TypeMessage type = TypeMessage.none;
  bool translate;
  bool dialog;
  Color? backgroundColor;
  Color? foregroundColor;
  AlignmentDirectional? alignmentDirectional;
  double? width;

  MessageSend(
      {required this.message,
      required this.type,
      this.translate = true,
      this.dialog = false,
      this.backgroundColor,
      this.foregroundColor,
      this.alignmentDirectional,
      this.width});

  factory MessageSend.fromDefault() {
    return MessageSend(message: '', type: TypeMessage.none);
  }
}
