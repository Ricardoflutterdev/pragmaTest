import 'package:flutter/material.dart';
import 'package:test_pragma/src/environment/environment.dart';

class SpaceHor extends StatelessWidget {
  final double widthSpace;

  const SpaceHor({Key? key, required this.widthSpace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * widthSpace / 100,
    );
  }
}

class SpaceVer extends StatelessWidget {
  final double heightSpace;

  const SpaceVer({Key? key, required this.heightSpace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * heightSpace / 100,
    );
  }
}

// ignore: use_key_in_widget_constructors
class NoReturn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(),
    );
  }
}

//clases & widgets para la interfaz
class Logo extends StatelessWidget {
  final String logo;
  final double widthLogo;
  final double heightLogo;
  const Logo(
      {Key? key,
      required this.logo,
      required this.widthLogo,
      required this.heightLogo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * widthLogo / 100,
      height: MediaQuery.of(context).size.height * heightLogo / 100,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(logo), fit: BoxFit.cover)),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String text;
  final String font;
  final double size;
  final Color color;
  final TextAlign textalign;
  final TextDecoration textDecoration;
  const TextWidget(
      {Key? key,
      required this.text,
      required this.font,
      required this.size,
      required this.color,
      required this.textalign,
      required this.textDecoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Text(
      text,
      style: TextStyle(
          fontFamily: font,
          fontSize: size,
          color: color,
          decoration: textDecoration),
      textAlign: textalign,
    ));
  }
}

// ignore: must_be_immutable
class TextForms extends StatefulWidget {
  final double width;
  final TextEditingController controller;
  final String hintText;
  late bool obscureText;
  late String passwordType;
  late IconData iconData;
  TextForms(
      {Key? key,
      required this.width,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.passwordType,
      required this.iconData})
      : super(key: key);

  @override
  State<TextForms> createState() => _TextFormsState();
}

class _TextFormsState extends State<TextForms> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      width: widget.width,
      height: media.height * 0.07,
      decoration: BoxDecoration(
        color: blancoColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: negroSombraColor,
            offset: const Offset(4.0, 4.0),
          )
        ],
        border: Border.all(color: negroSombraColor, width: 0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        controller: widget.controller,
        style:
            TextStyle(color: negroColor, fontFamily: "Poppins", fontSize: 15),
        autofocus: false,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.left,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: Icon(
            widget.iconData,
            color: negroColor,
          ),
          hintStyle: TextStyle(color: negroColor, fontFamily: "Poppins"),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    );
  }
}

class Alerts extends StatefulWidget {
  final double width;
  final double height;
  final double widthButton;
  final String title;
  final String message;
  final String textButton;
  final Function() function;
  const Alerts(
      {Key? key,
      required this.width,
      required this.height,
      required this.title,
      required this.message,
      required this.function,
      required this.widthButton,
      required this.textButton})
      : super(key: key);

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: blancoColor,
      content: Container(
        width: MediaQuery.of(context).size.width * widget.width / 100,
        height: MediaQuery.of(context).size.height * widget.height / 100,
        decoration: BoxDecoration(
            color: blancoColor,
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width *
                    (widget.width / 100) /
                    100)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
                text: widget.title,
                font: "PoppinsBold",
                size: 14,
                color: grisColor,
                textalign: TextAlign.center,
                textDecoration: TextDecoration.none),
            const SpaceVer(heightSpace: 2),
            TextWidget(
                text: widget.message,
                font: "Poppins",
                size: 14,
                color: grisColor,
                textalign: TextAlign.center,
                textDecoration: TextDecoration.none),
            const SpaceVer(heightSpace: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: widget.function,
                  child: buttonAccept(
                      context, widget.widthButton, 5, widget.textButton, 14),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ValidationAlert extends StatefulWidget {
  final double width;
  final double height;
  final double widthButton;
  final String mensaje;
  final String textoBotonAceptar;
  final String textoBotonCancelar;
  final Function() functionAceptar;
  final Function() functionCancelar;
  const ValidationAlert({
    Key? key,
    required this.width,
    required this.height,
    required this.mensaje,
    required this.functionAceptar,
    required this.functionCancelar,
    required this.widthButton,
    required this.textoBotonAceptar,
    required this.textoBotonCancelar,
  }) : super(key: key);

  @override
  State<ValidationAlert> createState() => _ValidationAlertState();
}

class _ValidationAlertState extends State<ValidationAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: blancoColor,
      content: Container(
        width: MediaQuery.of(context).size.width * widget.width / 100,
        height: MediaQuery.of(context).size.height * widget.height / 100,
        decoration: BoxDecoration(
            color: blancoColor,
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width *
                    (widget.width / 100) /
                    100)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SpaceVer(heightSpace: 2),
            TextWidget(
                text: widget.mensaje,
                font: "Poppins",
                size: 14,
                color: grisColor,
                textalign: TextAlign.center,
                textDecoration: TextDecoration.none),
            const SpaceVer(heightSpace: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: widget.functionCancelar,
                  child: buttonCancel(context, widget.widthButton, 5,
                      widget.textoBotonCancelar, 14),
                ),
                InkWell(
                  onTap: widget.functionAceptar,
                  child: buttonAccept(context, widget.widthButton, 5,
                      widget.textoBotonAceptar, 14),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget buttonAccept(
    BuildContext context, widthButton, heightButton, textButton, size) {
  return Container(
    width: MediaQuery.of(context).size.width * widthButton / 100,
    height: MediaQuery.of(context).size.height * heightButton / 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          blurRadius: 5.0,
          color: negroColor,
          offset: const Offset(2.0, 2.0),
        )
      ],
    ),
    child: Center(
        child: TextWidget(
            text: textButton,
            font: "Poppins",
            size: size,
            color: blancoColor,
            textalign: TextAlign.center,
            textDecoration: TextDecoration.none)),
  );
}

Widget buttonCancel(
    BuildContext context, widthButton, heightButton, textButton, size) {
  return Container(
    width: MediaQuery.of(context).size.width * widthButton / 100,
    height: MediaQuery.of(context).size.height * heightButton / 100,
    decoration: BoxDecoration(
      color: blancoColor,
      border: Border.all(width: 2, color: grisColor),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Center(
        child: TextWidget(
            text: textButton,
            font: "Poppins",
            size: size,
            color: grisColor,
            textalign: TextAlign.center,
            textDecoration: TextDecoration.none)),
  );
}
