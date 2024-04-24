import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int _rating = 0;
  // Dimension
  double width = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(    
        body: Stack(children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: width,
              height: height,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: Container(
              width: width * 0.85,
              height: height * 0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Rate your experience:',
                      style: TextStyle(fontSize: 20.0)),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        iconSize: 50.0,
                        icon: Icon(Icons.star,
                            color: _rating >= 1 ? Colors.orange : Colors.grey),
                        onPressed: () {
                          setState(() {
                            _rating = 1;
                          });
                        },
                      ),
                      IconButton(
                        iconSize: 50.0,
                        icon: Icon(Icons.star,
                            color: _rating >= 2 ? Colors.orange : Colors.grey),
                        onPressed: () {
                          setState(() {
                            _rating = 2;
                          });
                        },
                      ),
                      IconButton(
                        iconSize: 50.0,
                        icon: Icon(Icons.star,
                            color: _rating >= 3 ? Colors.orange : Colors.grey),
                        onPressed: () {
                          setState(() {
                            _rating = 3;
                          });
                        },
                      ),
                      IconButton(
                        iconSize: 50.0,
                        icon: Icon(Icons.star,
                            color: _rating >= 4 ? Colors.orange : Colors.grey),
                        onPressed: () {
                          setState(() {
                            _rating = 4;
                          });
                        },
                      ),
                      IconButton(
                        iconSize: 50.0,
                        icon: Icon(Icons.star,
                            color: _rating >= 5 ? Colors.orange : Colors.grey),
                        onPressed: () {
                          setState(() {
                            _rating = 5;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {                     
                      print('You rated us $_rating stars.');
                       Navigator.pop(context);
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          )
        ]));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setDimension();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _setDimension() {
    setState(() {
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
    });
  }
}
