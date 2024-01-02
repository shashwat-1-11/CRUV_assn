//File Containing all the utility functions to generate UI for the app

import 'package:flutter/material.dart';
import 'seat.dart';
import 'constants.dart';

//Function to build the seat of the train
Widget buildSeat (int seatNo, String seatType, bool textDown){
  bool highlightSeat = false;
  if(userEnteredSeatNo == seatNo && userSearched) highlightSeat = true;
  if(seatNo % 8 == 0) seatType = 'SIDE UPPER';
  return Seat(highlightSeat: highlightSeat, textDown: textDown, seatNo: seatNo, seatType: seatType);
}

//Function to build row of seats including the side seat
Row buildSeatRow (int startSeat, int endSeat, bool textDown){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        decoration: seatBorderStyle(textDown),
        child: Row(
          crossAxisAlignment: textDown ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Container(width: 6, height: 30, color: baseColor),
            buildSeat(startSeat, 'LOWER', textDown),
            buildSeat(startSeat + 1, 'MIDDLE', textDown),
            buildSeat(startSeat + 2, 'UPPER', textDown),
            Container(width: 6, height: 30, color: baseColor)
          ],
        ),
      ),
      Container(
        decoration: seatBorderStyle(textDown),
        child: Row(
          crossAxisAlignment: textDown ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Container(width: 6, height: 30, color: baseColor),
            buildSeat(endSeat, 'SIDE LOWER', textDown),
            Container(width: 6, height: 30, color: baseColor)
          ],
        ),
      )
    ],
  );
}

//Function to build the compartment of the train
Column buildCompartment (int startNum, int endNum){
  return Column(
    children: [
      buildSeatRow(startNum, endNum - 1, true),
      const SizedBox(height: 35),
      buildSeatRow(startNum + 3, endNum, false),
    ],
  );
}

//Function to generate AlertBox in case user enters invalid credentials
Widget buildIInvalidCredentialPopUp(BuildContext context) {
  return AlertDialog(
    title: const Text('Invalid Credentials!'),
    content: const Text('Please enter a valid seat number which is between 1 - 64.'),
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('Close', style: TextStyle(color: darkBaseColor, fontSize: 15))
        ),
      ),
    ],
  );
}

//Function to scroll to the entered seat number
void scrollToSeat(ScrollController scrollController, int seatNumber) {
  double offset = (seatNumber ~/ 8) * 200.0;

  scrollController.animateTo(
    offset,
    duration: const Duration(seconds: 1),
    curve: Curves.easeInOut,
  );
}
