import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'login_page.dart';
import 'sign_up_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
    VideoPlayerController.asset("videos/welcome_background.mp4")
      ..initialize().then((_) {
        setState(() {
          chewieController = ChewieController(
            videoPlayerController: videoPlayerController,
            aspectRatio: videoPlayerController.value.aspectRatio,
            autoPlay: true,
            looping: true,
            showControls: false,
          );
        });
      });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: chewieController == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
        fit: StackFit.expand,
        children: [
          // 🎥 Background video
          FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: videoPlayerController.value.size.width,
              height: videoPlayerController.value.size.height,
              child: Chewie(controller: chewieController!),
            ),
          ),

          // 🧱 Overlay UI
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 60),
              Text(
                "NEWZIFY",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.1,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: const [
                    BoxShadow(offset: Offset(1, 1)),
                    BoxShadow(offset: Offset(-1, 1)),
                    BoxShadow(offset: Offset(1, -1)),
                    BoxShadow(offset: Offset(-1, -1)),
                  ],
                ),
              ),
              //Image.asset('images/bannerArt.png', fit: BoxFit.contain),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: Container(
                        height:
                        MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.grey, width: 2),
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                        );
                      },
                      child: Container(
                        height:
                        MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.black, width: 2),
                        ),
                        child: const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
