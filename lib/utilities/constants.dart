//File containing custom design of various UI elements along with the required variables

import 'package:flutter/material.dart';

int userEnteredSeatNo = -1;
bool userSearched = false;

//Custom colors for the app
Color baseColor = const Color(0xff91C9FF);
Color darkBaseColor = const Color(0xff2F6AC3);
Color lightBoxColor = const Color(0xffD3E9FF);
Color selectedBoxColor = const Color(0xff2493FE);

TextStyle headText = TextStyle(color: baseColor, fontSize: 30, fontWeight: FontWeight.w900);

//Styled border for the search bar
OutlineInputBorder searchBarBorder = OutlineInputBorder(
    borderSide: BorderSide(
        width: 3, color: baseColor
    ),
    borderRadius: BorderRadius.circular(10.0)
);

InputDecoration searchBarDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
  border: searchBarBorder,
  enabledBorder: searchBarBorder,
  focusedBorder: searchBarBorder,
  hintStyle: TextStyle(color: baseColor),
  hintText: 'Enter Seat Number..',
);

//Styling of the find button
ButtonStyle searchButtonStyle (){
  return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      backgroundColor: baseColor
  );
}
//Styled top/down borders for the row of seats
BoxDecoration seatBorderStyle (bool textDown){
  return BoxDecoration(
      border: textDown ? Border(
          top: BorderSide(width: 6, color: baseColor)
      ) : Border(
          bottom: BorderSide(width: 6, color: baseColor)
      )
  );
}