import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class TutorialPriza extends StatefulWidget {
  @override
  _TutorialPrizaState createState() => _TutorialPrizaState();
}

class _TutorialPrizaState extends State<TutorialPriza> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    controller = VideoPlayerController.asset('assets/videos/priza.mp4');
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  void seekVideo(Duration duration) {
    Duration newPosition = controller.value.position + duration;
    if (newPosition < Duration.zero) {
      newPosition = Duration.zero;
    } else if (newPosition > controller.value.duration!) {
      newPosition = controller.value.duration!;
    }
    controller.seekTo(newPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Play Video from Assets/URL"),
        backgroundColor: Color.fromRGBO(17, 138, 178, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.value.isPlaying) {
                        controller.pause();
                      } else {
                        controller.play();
                      }
                      setState(() {});
                    },
                    behavior: HitTestBehavior.opaque, // Add this line
                    child: Padding(
                      padding: const EdgeInsets.all(16.0), // Add padding here
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          alignment: Alignment.center,
                          child: VideoPlayer(controller),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 22.0,
                        right: 22.0,
                        bottom: 16.0,
                      ),
                      child: VideoProgressIndicator(
                        controller, //video player controller
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          //video player progress bar
                          backgroundColor: Colors.grey,
                          playedColor: Colors.red,
                          bufferedColor: Colors.redAccent.shade400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16), // Add spacing between video and steps
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text('Pasi:',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 26, fontWeight: FontWeight.w800))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                '1.Opreşte curentul în casă. Introdu vârful şurubelniţei-tester în ambele orificii ale prizei, ţinând un deget pe contactul metalic din capătul mânerului.Rezistenţa din interiorul testerului trebuie să fie stinsă. Desfă şuruburile prizei vechi şi îndepărtează capacul.\n',
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                '2.Corpul prizei are pe laterale două şuruburi care trebuie şi ele desfăcute. Când priza se poate scoate din perete, apuc-o de părţile ceramice.În partea din spatele ei se află două orificii în care intră cele două fire metalice.Acestea sunt prinse în priză cu două şurubele. Slăbeşte-le pentru a le scoate şi a te uita la ele.\n',
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                '3.Dacă izolaţia din plastic este casantă sau înnegrită, tai-o cu un cuţit atât cât este nevoie.Apoi, îndepărtează din nou izolaţia pe o porţiune de câţiva milimetri. Introdu capetele metalice în orificiile din spatele noii prize şi strânge din nou şuruburile până când firele stau fixe.\n',
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                '4.Introdu priza înapoi în perete, iar apoi strânge şuruburile laterale. Pune capacul şi strânge-i şuruburile.\n',
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                  'Ai grija cand montezi o priza ca trebui sa ai in vedere si puterea ceruta de aparatele ce urmeaza sa le conectezi la aceasta. Priza, inainte de toate, presupune conectarea la sursa de energie electrica a aparate...mai mare, va trebui sa tii seama de capacitatea ei, dar si de materialul din care e facuta.',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w800))),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  //Aici adaugi sa te duca la pagina ta
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromRGBO(17, 138, 178, 1),
                  padding: EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0), // Change text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust button border radius
                  ),
                ),
                child: Text(
                  'Cere ajutorul unui specialist',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800)), // Change text size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
