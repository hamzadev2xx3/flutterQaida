import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Page2 extends StatefulWidget {
  bool isMultipleSelectionEnabled;

  Page2({super.key, required this.isMultipleSelectionEnabled});

  @override
  State<Page2> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Page2> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _startIndex;
  int? _endIndex;
  List<String> _selectedAudioFiles = [];
  Set<int> _selectedContainers = {};
  List<String> audioFilePaths = [
    'assets/page1/alif.mp3',
    'assets/page1/baa1.mp3',
    'assets/page1/taaah.mp3',
    'assets/page1/saad.mp3',
    'assets/page1/geem.mp3',
    'assets/page1/haa.mp3',
    'assets/page1/khaa.mp3',
    'assets/page1/daal.mp3',
    'assets/page1/zaal.mp3',
    'assets/page1/raaa.mp3',
    'assets/page1/zaaa.mp3',
    'assets/page1/seen.mp3',
    'assets/page1/sheen.mp3',
    'assets/page1/suaad.mp3',
    'assets/page1/zaad.mp3',
    'assets/page1/taaah.mp3',
    'assets/page1/zaaah.mp3',
    'assets/page1/aaen.mp3',
    'assets/page1/gaen.mp3',
    'assets/page1/faa.mp3',
  ];

  void _toggleSelection(int index, String filePath) {
    if (_startIndex != null && _endIndex != null) {
      // Selection already made, clear selection on any tap
      _selectedContainers.clear();
      _selectedAudioFiles.clear();
      _startIndex = null;
      _endIndex = null;
      AudioListHolder2.audioList.clear();
    } else if (_startIndex == null) {
      // Start index is null, select start index
      _selectedContainers.clear();
      _selectedAudioFiles.clear();
      _selectedContainers.add(index);
      _startIndex = index;
    } else {
      // Start index already selected, select end index
      _selectedContainers.clear();
      _selectedAudioFiles.clear();
      int start = _startIndex!;
      int end = index;
      for (int i = start; i <= end; i++) {
        _selectedContainers.add(i);
      }
      _endIndex = index;

      // Add audio files in range of selected containers
      List<String> selectedAudioFiles = [];
      for (int i = start; i <= end; i++) {
        selectedAudioFiles.add(audioFilePaths[i]);
        print('_selectedAudioFiles: $selectedAudioFiles');
      }
      AudioListHolder2.audioList = selectedAudioFiles;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                right: BorderSide(width: 1),
                                left: BorderSide(width: 1),
                                top: BorderSide(width: 1))),
                        child: const Text(
                          'جدول الحروف الا بجدیۃ',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                right: BorderSide(width: 1),
                                left: BorderSide(width: 1),
                                top: BorderSide(width: 1))),
                        child: Image.asset(
                          'assets/page2/cont2img.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 1),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    2, audioFilePaths[2]);
                                              }
                                            : () async {
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[2]);
                                                await _audioPlayer.play();
                                                await _audioPlayer.stop();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page2/r1c1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          if (_selectedContainers.contains(2))
                                            if (_startIndex == 2)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_left.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                            else if (_endIndex == 2)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_right.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                        ]))),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 1),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    4, audioFilePaths[4]);
                                              }
                                            : () async {
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[4]);
                                                await _audioPlayer.play();
                                                await _audioPlayer.stop();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page2/r2c1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          if (_selectedContainers.contains(4))
                                            if (_startIndex == 4)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_left.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                            else if (_endIndex == 4)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_right.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                        ]))),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 1),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    7, audioFilePaths[7]);
                                              }
                                            : () async {
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[7]);
                                                await _audioPlayer.play();
                                                await _audioPlayer.stop();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page2/r3c1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          if (_selectedContainers.contains(7))
                                            if (_startIndex == 7)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_left.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                            else if (_endIndex == 7)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_right.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                        ]))),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                          left: BorderSide(width: 1),
                                          top: BorderSide(width: 1),
                                          bottom: BorderSide(width: .5)),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    9, audioFilePaths[9]);
                                              }
                                            : () async {
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[9]);
                                                await _audioPlayer.play();
                                                await _audioPlayer.stop();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page2/r4c1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          if (_selectedContainers.contains(9))
                                            if (_startIndex == 9)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_left.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                            else if (_endIndex == 9)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_right.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                        ]))),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                          left: BorderSide(width: 1),
                                          top: BorderSide(width: .5),
                                          bottom: BorderSide(width: .5)),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    12, audioFilePaths[12]);
                                              }
                                            : () async {
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[12]);
                                                await _audioPlayer.play();
                                                await _audioPlayer.stop();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page2/r5c1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          if (_selectedContainers.contains(12))
                                            if (_startIndex == 12)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_left.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                            else if (_endIndex == 12)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_right.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                        ]))),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                          left: BorderSide(width: 1),
                                          top: BorderSide(width: .5),
                                          bottom: BorderSide(width: .8)),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    14, audioFilePaths[14]);
                                              }
                                            : () async {
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[14]);
                                                await _audioPlayer.play();
                                                await _audioPlayer.stop();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page2/r6c1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          if (_selectedContainers.contains(14))
                                            if (_startIndex == 14)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_left.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                            else if (_endIndex == 14)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_right.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                        ]))),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: .5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    17, audioFilePaths[17]);
                                              }
                                            : () async {
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[17]);
                                                await _audioPlayer.play();
                                                await _audioPlayer.stop();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page2/r7c1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          if (_selectedContainers.contains(17))
                                            if (_startIndex == 17)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_left.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                            else if (_endIndex == 17)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_right.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                        ]))),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                          left: BorderSide(width: 1),
                                          top: BorderSide(width: 1),
                                          bottom: BorderSide(width: 1)),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    19, audioFilePaths[19]);
                                              }
                                            : () async {
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[19]);
                                                await _audioPlayer.play();
                                                await _audioPlayer.stop();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page2/r8c1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          if (_selectedContainers.contains(19))
                                            if (_startIndex == 19)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_left.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                            else if (_endIndex == 19)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_right.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                        ]))),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                          left: BorderSide(width: 1),
                                          top: BorderSide(width: 1),
                                          right: BorderSide(width: 1)),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    1, audioFilePaths[1]);
                                              }
                                            : () async {
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[1]);
                                                await _audioPlayer.play();
                                                await _audioPlayer.stop();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page2/r1c2.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          if (_selectedContainers.contains(1))
                                            if (_startIndex == 1)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_left.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                            else if (_endIndex == 1)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_right.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                        ]))),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                          left: BorderSide(width: 1),
                                          top: BorderSide(width: 1),
                                          right: BorderSide(width: 1)),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    3, audioFilePaths[3]);
                                              }
                                            : () async {
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[3]);
                                                await _audioPlayer.play();
                                                await _audioPlayer.stop();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page2/r2c2.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          if (_selectedContainers.contains(3))
                                            if (_startIndex == 3)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_left.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                            else if (_endIndex == 3)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_right.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                        ]))),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 1),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    6, audioFilePaths[6]);
                                              }
                                            : () async {
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[6]);
                                                await _audioPlayer.play();
                                                await _audioPlayer.stop();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page2/r3c2.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          if (_selectedContainers.contains(6))
                                            if (_startIndex == 6)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_left.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                            else if (_endIndex == 6)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_right.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                        ]))),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                          left: BorderSide(width: 1),
                                          top: BorderSide(width: 1),
                                          bottom: BorderSide(width: .5)),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    8, audioFilePaths[8]);
                                              }
                                            : () async {
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[8]);
                                                await _audioPlayer.play();
                                                await _audioPlayer.stop();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page2/r4c2.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          if (_selectedContainers.contains(8))
                                            if (_startIndex == 8)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_left.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                            else if (_endIndex == 8)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_right.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                        ]))),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                          left: BorderSide(width: 1),
                                          top: BorderSide(width: .5),
                                          bottom: BorderSide(width: .5)),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    11, audioFilePaths[11]);
                                              }
                                            : () async {
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[11]);
                                                await _audioPlayer.play();
                                                await _audioPlayer.stop();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page2/r5c2.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          if (_selectedContainers.contains(11))
                                            if (_startIndex == 11)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_left.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                            else if (_endIndex == 11)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_right.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                        ]))),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: .5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    13, audioFilePaths[13]);
                                              }
                                            : () async {
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[13]);
                                                await _audioPlayer.play();
                                                await _audioPlayer.stop();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page2/r6c2.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          if (_selectedContainers.contains(13))
                                            if (_startIndex == 13)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_left.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                            else if (_endIndex == 13)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_right.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                        ]))),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 1),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    16, audioFilePaths[16]);
                                              }
                                            : () async {
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[16]);
                                                await _audioPlayer.play();
                                                await _audioPlayer.stop();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page2/r7c2.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          if (_selectedContainers.contains(16))
                                            if (_startIndex == 16)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_left.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                            else if (_endIndex == 16)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_right.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                        ]))),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                          left: BorderSide(width: 1),
                                          top: BorderSide(width: 1),
                                          bottom: BorderSide(width: 1)),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    18, audioFilePaths[18]);
                                              }
                                            : () async {
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[18]);
                                                await _audioPlayer.play();
                                                await _audioPlayer.stop();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page2/r8c2.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          if (_selectedContainers.contains(18))
                                            if (_startIndex == 18)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_left.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                            else if (_endIndex == 18)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/arrow_right.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              )
                                        ]))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(width: 1),
                                  top: BorderSide(width: 1),
                                  bottom: BorderSide(width: 1.5),
                                ),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              0, audioFilePaths[0]);
                                        }
                                      : () async {
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[0]);
                                          await _audioPlayer.play();
                                          await _audioPlayer.stop();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page2/aimg.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    if (_selectedContainers.contains(0))
                                      if (_startIndex == 0)
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            'assets/arrow_left.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                        )
                                      else if (_endIndex == 0)
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            'assets/arrow_right.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                        )
                                  ]))),
                        ),
                        Expanded(
                          child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(width: 1),
                                  left: BorderSide(width: 1),
                                  bottom: BorderSide(width: .5),
                                ),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              5, audioFilePaths[5]);
                                        }
                                      : () async {
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[5]);
                                          await _audioPlayer.play();
                                          await _audioPlayer.stop();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page2/bimg.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    if (_selectedContainers.contains(5))
                                      if (_startIndex == 5)
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            'assets/arrow_left.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                        )
                                      else if (_endIndex == 5)
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            'assets/arrow_right.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                        )
                                  ]))),
                        ),
                        Expanded(
                          child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(width: 1),
                                  left: BorderSide(width: 1),
                                  bottom: BorderSide(width: 1),
                                ),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              10, audioFilePaths[10]);
                                        }
                                      : () async {
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[10]);
                                          await _audioPlayer.play();
                                          await _audioPlayer.stop();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page2/taimg.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    if (_selectedContainers.contains(10))
                                      if (_startIndex == 10)
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            'assets/arrow_left.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                        )
                                      else if (_endIndex == 10)
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            'assets/arrow_right.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                        )
                                  ]))),
                        ),
                        Expanded(
                          child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(width: 1),
                                  left: BorderSide(width: 1),
                                  bottom: BorderSide(width: 0.5),
                                ),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              15, audioFilePaths[15]);
                                        }
                                      : () async {
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[15]);
                                          await _audioPlayer.play();
                                          await _audioPlayer.stop();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page2/saimg.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    if (_selectedContainers.contains(15))
                                      if (_startIndex == 15)
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            'assets/arrow_left.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                        )
                                      else if (_endIndex == 15)
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            'assets/arrow_right.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                        )
                                  ]))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AudioListHolder2 {
  static List<String> audioList = [];
  static int pageId = 2;
}
