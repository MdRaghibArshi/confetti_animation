import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimateScreen extends StatefulWidget {
  const AnimateScreen({Key key}) : super(key: key);

  @override
  State<AnimateScreen> createState() => _AnimateScreenState();
}

class _AnimateScreenState extends State<AnimateScreen> {
  final confettiController = ConfettiController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                confettiController.play();
                dialogForWinner('The Codeme','assets.png');
              }, child: Text('Tap To Animate'),
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: confettiController,
          shouldLoop: false,
          blastDirectionality: BlastDirectionality.explosive,
        ),
      ],
    );
  }

  void dialogForWinner(String name, String image) {
    showDialog(
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            contentPadding: const EdgeInsets.all(0.0),
            content: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/winnn.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                height: 220.0,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, right: 2.0, bottom: 10.0, left: 2.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              confettiController.stop();
                              Navigator.pop(context);
                            },
                            child: Card(
                              elevation: 6.0,
                              color: Colors.grey.shade700,
                              child: Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/trophy.png',
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        'Congratulations',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                                'assets/no_profile_image.png',
                                height: 50,
                                width: 50,
                              ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
