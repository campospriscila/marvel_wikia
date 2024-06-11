import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'message_state.dart';

class MessageCubit extends Cubit<MessageSend> {
  MessageCubit() : super(MessageSend.fromDefault());
  Timer? timer;

  void doShow({
    required String message,
    required TypeMessage type,
    bool translate = true,
    bool dialog = false,
    String? idContainer,
    AlignmentDirectional? alignmentDirectional,

    //  Utilize width = 0; para que o SnackBar fique do tamanho do texto.
    //  Utilize width = null, para que o SnackBar ocupe toda a linha
    //  Utilize width = x, para que o SnackBar fique com a largura fixa.
    double? width,
  }) {
    Color? backgroundColor;
    Color? foregroundColor;

    switch (type) {
      case TypeMessage.error:
        backgroundColor = const Color(0xFFB61D1D);
        foregroundColor = Colors.white;
        break;
      case TypeMessage.information:
        backgroundColor = const Color(0xFFE1E4E9);
        foregroundColor = const Color(0xFF111112);
        break;
      case TypeMessage.warning:
        backgroundColor = const Color(0xFFAACBFF);
        foregroundColor = Colors.black;
        break;
      default:
        break;
    }

    emit(MessageSend(
        message: message,
        type: type,
        translate: translate,
        dialog: dialog,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        alignmentDirectional: alignmentDirectional,
        width: width));
  }
}
