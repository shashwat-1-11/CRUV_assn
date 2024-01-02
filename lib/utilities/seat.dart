import 'package:flutter/material.dart';
import 'constants.dart';


// Seat class representing one seat in the train coach
class Seat extends StatefulWidget {
  Seat({Key? key, required this.highlightSeat, required this.textDown, required this.seatNo, required this.seatType}) : super(key: key);
  bool highlightSeat;
  final bool textDown;
  final int seatNo;
  final String seatType;

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.highlightSeat = !widget.highlightSeat;
        });
      },
      child: Container(
          decoration: BoxDecoration(
            color: widget.highlightSeat ? selectedBoxColor : lightBoxColor,
          ),
          padding: widget.textDown ? const EdgeInsets.fromLTRB(10,15,10,5) : const EdgeInsets.fromLTRB(10,5,10,15),
          margin: const EdgeInsets.symmetric(horizontal: 1),

          child: widget.textDown ? Column(
            children: [
              Text('${widget.seatNo}',
                  style: TextStyle(color: widget.highlightSeat ? Colors.white : darkBaseColor, fontSize: 22)
              ),
              Text(widget.seatType,
                  style: TextStyle(color: widget.highlightSeat ? Colors.white : darkBaseColor, fontSize: 12)
              )
            ],
          ) : Column(
            children: [
              Text(widget.seatType,
                  style: TextStyle(color: widget.highlightSeat ? Colors.white : darkBaseColor, fontSize: 12)
              ),
              Text('${widget.seatNo}',
                  style: TextStyle(color: widget.highlightSeat ? Colors.white : darkBaseColor, fontSize: 22)
              ),
            ],
          )
      ),
    );
  }
}
