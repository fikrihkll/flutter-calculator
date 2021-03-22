import 'package:flutter/material.dart';

class CalcButton extends StatefulWidget {
  CalcButton({Key key, this.title ,this.onPressed }) : super(key: key);
  CalcButton.withColor({Key key, this.title,  this.color1,  this.color2, this.onPressed }): super(key: key);

  String title="";
  Color color1 = Color.fromRGBO(242, 86, 35, 100);
  Color color2 = Color.fromRGBO(255, 187, 147, 100);
  Function onPressed;

  @override
  _CalcButtonState createState() => _CalcButtonState();
}

class _CalcButtonState extends State<CalcButton> {

  bool onTouch = false;

  @override
  Widget build(BuildContext context) {

    void _onTouch(PointerEvent details){
      onTouch = true;
      setState(() {

      });
    }

    void _onReleaseTouch(PointerEvent details){
      onTouch = false;
      setState(() {

      });
    }

    var unTouchedShadow = BoxShadow(
        color: widget.color1,
        blurRadius: 5,
        spreadRadius: 0.3,
        offset: Offset(2,2)
    );

    var touchedShadow = BoxShadow(
        color: Colors.black26.withOpacity(0),
        blurRadius: 3,
        spreadRadius: 0.1,
        offset: Offset(0.3,0.3)
    );

    return  AnimatedContainer(
      margin: EdgeInsets.all(5),
      duration: Duration(milliseconds: 200),
      child: Listener(
        child: RawMaterialButton(
          onPressed: widget.onPressed,
          shape: CircleBorder(),
          child: Container(
            padding: EdgeInsets.all(12),
            child: Text(widget.title,style: TextStyle(fontSize: 32, color: Colors.white),),
          ),
        ),
        onPointerDown: _onTouch,
        onPointerUp: _onReleaseTouch,
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [ widget.color1, widget.color2]
          ),
          shape: BoxShape.circle,
          boxShadow: [
            onTouch ? touchedShadow : unTouchedShadow
          ]
      ),
    );
  }


}