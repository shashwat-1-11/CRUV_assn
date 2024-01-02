import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../utilities/utils.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard> {

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Seat Finder', style: headText),
                const SizedBox(height: 25),
                buildSearchBar(),
                const SizedBox(height: 20),
                Column(
                  children: [
                    for (int i = 0; i < 8; i++) buildCompartment(8 * i + 1, 8 * (i + 1))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // Function to build the search bar in the dashboard
  Stack buildSearchBar() {
    return Stack(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          style: TextStyle(color: baseColor),
          decoration: searchBarDecoration,
          onChanged: (value) {
            setState(() {
              userSearched = false;
              if (value.isEmpty) {
                userEnteredSeatNo = -1;
              } else {
                userEnteredSeatNo = int.parse(value);
              }
            });
          },
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: ElevatedButton(
              onPressed: userEnteredSeatNo == -1
                  ? null
                  : () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (userEnteredSeatNo == 0 || userEnteredSeatNo > 64) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => buildIInvalidCredentialPopUp(context),
                  );
                }
                setState(() {
                  userSearched = true;
                });
                scrollToSeat(_scrollController, userEnteredSeatNo);
              },
              style: searchButtonStyle(),
              child: const Text('Find'),
            ),
          ),
        ),
      ],
    );
  }
}