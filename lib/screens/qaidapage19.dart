import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Page19 extends StatefulWidget {
  bool isMultipleSelectionEnabled;
  Page19({super.key, required this.isMultipleSelectionEnabled});

  @override
  State<Page19> createState() => _Page19State();
}

class _Page19State extends State<Page19> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          color: Colors.grey,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                right: BorderSide(width: 1),
                                top: BorderSide(width: 1),
                                left: BorderSide(width: 1),
                              )),
                              child: InkWell(
                                onTap: () async {
                                  await _audioPlayer
                                      .setAsset('assets/alif.mp3');
                                  _audioPlayer.play();
                                },
                                child: Image.asset(
                                  'assets/page19/p19img1.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                right: BorderSide(width: 1),
                                top: BorderSide(width: 1),
                              )),
                              child: InkWell(
                                onTap: () async {
                                  await _audioPlayer
                                      .setAsset('assets/alif.mp3');
                                  _audioPlayer.play();
                                },
                                child: Image.asset(
                                  'assets/page19/p19img2.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(width: 1),
                                      top: BorderSide(width: 1),
                                      left: BorderSide(width: 1),
                                      bottom: BorderSide(width: .5))),
                              child: InkWell(
                                onTap: () async {
                                  await _audioPlayer
                                      .setAsset('assets/alif.mp3');
                                  _audioPlayer.play();
                                },
                                child: Image.asset(
                                  'assets/page19/p19img3.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(width: 1),
                                      top: BorderSide(width: .5),
                                      bottom: BorderSide(width: .5))),
                              child: InkWell(
                                onTap: () async {
                                  await _audioPlayer
                                      .setAsset('assets/alif.mp3');
                                  _audioPlayer.play();
                                },
                                child: Image.asset(
                                  'assets/page19/p19img4.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(width: 1),
                                      top: BorderSide(width: .5),
                                      bottom: BorderSide(width: .5))),
                              child: InkWell(
                                onTap: () async {
                                  await _audioPlayer
                                      .setAsset('assets/alif.mp3');
                                  _audioPlayer.play();
                                },
                                child: Image.asset(
                                  'assets/page19/p19img5.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(width: 0.5),
                                      right: BorderSide(width: 1),
                                      left: BorderSide(width: 1))),
                              child: InkWell(
                                onTap: () async {
                                  await _audioPlayer
                                      .setAsset('assets/alif.mp3');
                                  _audioPlayer.play();
                                },
                                child: Image.asset(
                                  'assets/page19/p19img6.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                right: BorderSide(width: 1),
                                top: BorderSide(width: 0.5),
                              )),
                              child: InkWell(
                                onTap: () async {
                                  await _audioPlayer
                                      .setAsset('assets/alif.mp3');
                                  _audioPlayer.play();
                                },
                                child: Image.asset(
                                  'assets/page19/p19img7.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(width: 1),
                                      top: BorderSide(width: 1),
                                      left: BorderSide(width: 1))),
                              child: InkWell(
                                onTap: () async {
                                  await _audioPlayer
                                      .setAsset('assets/alif.mp3');
                                  _audioPlayer.play();
                                },
                                child: Image.asset(
                                  'assets/page19/p19img8.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                right: BorderSide(width: 1),
                                top: BorderSide(width: 1),
                              )),
                              child: InkWell(
                                onTap: () async {
                                  await _audioPlayer
                                      .setAsset('assets/alif.mp3');
                                  _audioPlayer.play();
                                },
                                child: Image.asset(
                                  'assets/page19/p19img9.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                top: BorderSide(width: 1),
                                right: BorderSide(width: 1),
                              )),
                              child: InkWell(
                                onTap: () async {
                                  await _audioPlayer
                                      .setAsset('assets/alif.mp3');
                                  _audioPlayer.play();
                                },
                                child: Image.asset(
                                  'assets/page19/p19img10.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                top: BorderSide(width: 1),
                                right: BorderSide(width: 1),
                              )),
                              child: InkWell(
                                onTap: () async {
                                  await _audioPlayer
                                      .setAsset('assets/alif.mp3');
                                  _audioPlayer.play();
                                },
                                child: Image.asset(
                                  'assets/page19/p19img11.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(width: 1),
                                      top: BorderSide(width: .5),
                                      left: BorderSide(width: 1))),
                              child: InkWell(
                                onTap: () async {
                                  await _audioPlayer
                                      .setAsset('assets/alif.mp3');
                                  _audioPlayer.play();
                                },
                                child: Image.asset(
                                  'assets/page19/p19img12.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                right: BorderSide(width: 1),
                                top: BorderSide(width: .5),
                              )),
                              child: InkWell(
                                onTap: () async {
                                  await _audioPlayer
                                      .setAsset('assets/alif.mp3');
                                  _audioPlayer.play();
                                },
                                child: Image.asset(
                                  'assets/page19/p19img13.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                decoration:
                                    BoxDecoration(border: Border.all(width: 1)),
                                child: InkWell(
                                  onTap: () async {
                                    await _audioPlayer
                                        .setAsset('assets/alif.mp3');
                                    _audioPlayer.play();
                                  },
                                  child: Image.asset(
                                    'assets/page19/p19img14.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
