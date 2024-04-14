import 'package:aplicatie_polihack_v15/SearchSpec.dart';
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
        title: Text('Socket replacement', style: GoogleFonts.openSans()),
        titleTextStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w800),
        foregroundColor: Color.fromRGBO(240, 241, 246, 1),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(69, 146, 197, 1),
                Color.fromRGBO(101, 194, 226, 1)
              ],
            ),
          ),
        ),
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
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
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
                        controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                'Steps:',
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TutorialStep(
                    stepNumber: 1,
                    description: 'Turn off the power in the house. Insert the tip of the tester screwdriver into both holes of the socket, keeping a finger on the metal contact at the end of the handle. The resistance inside the tester must be off. Unscrew the old socket and remove the cover.'),
                  TutorialStep(
                    stepNumber: 2,
                    description: 'The body of the socket has two screws on the sides that also need to be unscrewed. When the socket can be removed from the wall, grab it by the ceramic parts. At the back of it, there are two holes where the two metallic wires go in. These are held in the socket by two screws. Loosen them to remove them and take a look at them'),
                  TutorialStep(
                    stepNumber: 3,
                    description: 'If the plastic insulation is brittle or blackened, cut it with a knife as much as needed. Then, remove the insulation again on a few millimeters portion. Insert the metallic ends into the holes at the back of the new socket and tighten the screws again until the wires are fixed'),
                  TutorialStep(
                    stepNumber: 4,
                    description: 'Insert the socket back into the wall, then tighten the side screws. Put the cover on and tighten its screws'),
                  TutorialStep(
                    stepNumber: 5,
                    description: 'Be careful when installing a socket as you need to consider the power required by the devices that you will connect to it. The socket, first of all, involves connecting to the source of electrical energy of the devices... larger, you will have to take into account its capacity, but also the material it is made of'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchSpec(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromRGBO(17, 138, 178, 1),
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Ask for help',
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
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

class TutorialStep extends StatelessWidget {
  final int stepNumber;
  final String description;

  const TutorialStep({
    Key? key,
    required this.stepNumber,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$stepNumber.',
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.justify,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
