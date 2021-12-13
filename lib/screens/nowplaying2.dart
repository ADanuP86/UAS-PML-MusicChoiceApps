import 'package:flutter/material.dart';
import 'package:projectflutter_musiccoiceapps/constants.dart';
import 'package:projectflutter_musiccoiceapps/screens/library.dart';
import 'package:wave_progress_bars/wave_progress_bars.dart';
import 'package:audioplayers/audioplayers.dart';

class NowPlaying2 extends StatefulWidget {
  @override
  _NowPlaying2State createState() => _NowPlaying2State();
}

class _NowPlaying2State extends State<NowPlaying2> {
  AudioPlayer audioPlayer;
  String durasi = "00:00:00";
  final List<double> values = [9.0, 31.0, 20.0, 15.0, 15.0, 16.0, 14.0, 27.0, 41.0, 0.0, 27.0, 51.0, 67.0, 42.0, 54.0, 60.0, 36.0, 66.0, 16.0, 3.0, 3.0, 64.0, 61.0, 51.0, 37.0, 41.0, 29.0, 46.0, 16.0, 55.0, 0.0, 0.0, 41.0, 44.0, 9.0, 66.0, 58.0, 64.0, 45.0, 29.0, 23.0, 50.0, 35.0, 21.0, 34.0, 7.0, 27.0, 35.0, 63.0, 29.0, 4.0, 36.0, 63.0, 60.0, 62.0, 59.0, 48.0, 38.0, 48.0, 23.0, 22.0, 49.0, 2.0, 39.0, 47.0, 1.0, 32.0, 43.0, 33.0, 27.0];

_NowPlaying2State() {
  audioPlayer = AudioPlayer();
  audioPlayer.onAudioPositionChanged.listen((duration) {
    setState(() {
      durasi = duration.toString();
    });
  });
  audioPlayer.setReleaseMode(ReleaseMode.LOOP);
}

void playSound(String url) async {
  // await audioPlayer.seek(Duration(seconds: 30)); // kalau mau mulai dari second ke 30.
  await audioPlayer.play(url);
}
void pauseSound() async {
  await audioPlayer.pause();
}
void stopSound() async {
  await audioPlayer.stop();
}
void resumeSound() async {
  audioPlayer.resume();
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: cwhite,
        //appBar: AppBar(title: Text("Playing Music"),),
        body: SingleChildScrollView(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 30,),
              Row(
              children: <Widget>[
                SizedBox(width: 10,),
                GestureDetector(
                child: Container(
                  child: Icon(Icons.arrow_back),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                     MaterialPageRoute(builder: (context) => Library()
                     ),
                  );
                },
              ),

                Spacer(),
                Text(
                  'NOW PLAYING',
                  style: TextStyle(
                    color: cblue,
                    fontSize: 17,
                    fontWeight: FontWeight.w300
                  ),
                ),

                Spacer(),
                Icon(Icons.more_vert),
                SizedBox(width: 20,),
              ],
            ),

            Container(
              padding: EdgeInsets.all(50),
              height:350,
              width:350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(disk)
                ),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(art2),
                child: CircleAvatar(
                  backgroundColor: cwhite,
                  radius: 25,
                )
              ),
            ),

            SizedBox(height: 10,),
            // Now we will create Song Title and Artist name Texts
            Text("The Box",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900
              ),
            ),

            SizedBox(height: 10,),
            Text("Roddy Rich",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300
              ),
            ),

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                onPressed: () {
                  playSound("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3");
                },
                child: Icon(Icons.play_arrow_outlined),
              ),
              RaisedButton(
                onPressed: () {
                  pauseSound();
                },
                child: Icon(Icons.pause_outlined),
              ),
              RaisedButton(
                onPressed: () {
                  stopSound();
                },
                child: Icon(Icons.stop_outlined),
              ),
              RaisedButton(
                onPressed: () {
                  resumeSound();
                },
                child: Icon(Icons.replay_outlined),
              ),
              ],
            ),

            SizedBox(height: 20,),

            Center(
              child: WaveProgressBar(
                progressPercentage: 30,
                listOfHeights: values,
                width: 350,
                initalColor: cblue.withAlpha(100),
                progressColor: cblue,
                backgroundColor: cwhite,
                timeInMilliSeconds: 30,
                isHorizontallyAnimated: false,
                isVerticallyAnimated: false,
              ),
            ),

            SizedBox(height: 10,),

            Text(durasi, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)
            ],
          ),
        ),
      ),
    );
  }
}
