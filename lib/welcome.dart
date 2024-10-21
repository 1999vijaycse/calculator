import 'package:flutter/material.dart';
import 'calculator.dart'; // Import your calculator screen

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _progress = 0.0; // Variable to track the progress

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() async {
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(Duration(milliseconds: 60)); // Adjust duration for loading speed
      setState(() {
        _progress = i / 100; // Update the progress
      });
    }
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Calculator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/welcome_image.jpg'), // Your splash image
            fit: BoxFit.fill, // Resize image to fit without cropping
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 100, // Width of the progress indicator
                height: 100, // Height of the progress indicator
                child: CircularProgressIndicator(
                  value: _progress, // Set the progress value
                  backgroundColor: Colors.white54, // Background color of the progress circle
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.brown), // Color of the progress
                ),
              ),
              SizedBox(height: 20), // Spacing between the indicator and the text
              Text(
                '${(_progress * 100).toInt()}%', // Display percentage
                style: TextStyle(color: Colors.brown, fontSize: 28),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use a Future.delayed to navigate to the Calculator screen after a delay
    Future.delayed(Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Calculator()),
      );
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/welcome_image.jpg'), // Your splash image
            //fit: BoxFit.cover, // Cover the entire screen
            //fit: BoxFit.contain, // Resize image to fit without cropping
            fit: BoxFit.fill, // Resize image to fit without cropping

          ),
        ),
        /*
        //For circular indicator
        child: Center(
          //child: CircularProgressIndicator(), // Optional loading indicator
          child: LinearProgressIndicator(),
        ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LinearProgressIndicator(
              backgroundColor: Colors.white54, // Background color of the progress bar
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Color of the progress
            ),
            SizedBox(height: 20), // Spacing between the indicator and the image
            Text(
              'Loading...',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
*/