import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Page14 extends StatefulWidget {
  bool isMultipleSelectionEnabled;
  final Function(bool) updateMultipleSelectionEnabled;
  Page14({
    Key? key,
    required this.isMultipleSelectionEnabled,
    required this.updateMultipleSelectionEnabled,
  }) : super(key: key);

  @override
  Page14State createState() => Page14State();
}

class Page14State extends State<Page14> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  List<String> _selectedAudioFiles = [];
  Set<int> _selectedContainers = {};
  List<String> audioFilePaths = [
    'assets/page14/00.mp3',
    'assets/page14/01.mp3',
    'assets/page14/02.mp3',
    'assets/page14/03.mp3',
    'assets/page14/04.mp3',
    'assets/page14/05.mp3',
    'assets/page14/06.mp3',
    'assets/page14/07.mp3',
    'assets/page14/08.mp3',
    'assets/page14/09.mp3',
    'assets/page14/10.mp3',
    'assets/page14/11.mp3',
    'assets/page14/12.mp3',
    'assets/page14/13.mp3',
    'assets/page14/14.mp3',
  ];
  int? _startIndex;
  int? _endIndex;

  void _toggleSelection(int index, String filePath) {
    if (_startIndex != null && _endIndex != null) {
      _selectedContainers.clear();
      _selectedAudioFiles.clear();
      _startIndex = null;
      _endIndex = null;
      AudioListHolder14.audioList.clear();
      widget.isMultipleSelectionEnabled = false;
      widget.updateMultipleSelectionEnabled(false);
    } else if (_startIndex == null) {
      _selectedContainers.clear();
      _selectedAudioFiles.clear();
      _selectedContainers.add(index);
      _startIndex = index;
    } else {
      _selectedContainers.clear();
      _selectedAudioFiles.clear();
      int start = _startIndex!;
      int end = index;
      for (int i = start; i <= end; i++) {
        _selectedContainers.add(i);
      }
      _endIndex = index;
      List<String> selectedAudioFiles = [];
      for (int i = start; i <= end; i++) {
        selectedAudioFiles.add(audioFilePaths[i]);
        print('_selectedAudioFiles: $selectedAudioFiles');
      }
      AudioListHolder14.audioList = selectedAudioFiles;
      widget.isMultipleSelectionEnabled = true;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadAudioFiles();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> loadAudioFiles() async {
    for (final filePath in audioFilePaths) {
      await _audioPlayer.setAsset(filePath);
    }
  }

  void clearSelection() {
    setState(() {
      _selectedContainers.clear();
      _selectedAudioFiles.clear();
      _startIndex = null;
      _endIndex = null;
      AudioListHolder14.audioList.clear();
      widget.isMultipleSelectionEnabled = false;
      widget.updateMultipleSelectionEnabled(false);
    });
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
                  children: [
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: Image.asset(
                          'assets/page14/p14img1.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
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
                                    left: BorderSide(width: 1),
                                    bottom: BorderSide(width: 1)),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              1, audioFilePaths[1]);
                                        }
                                      : () async {
                                          await _audioPlayer.stop();
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[1]);
                                          await _audioPlayer.play();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page14/p14img2.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
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
                                    right: BorderSide(width: 1),
                                    bottom: BorderSide(width: 1)),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              0, audioFilePaths[0]);
                                        }
                                      : () async {
                                          await _audioPlayer.stop();
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[0]);
                                          await _audioPlayer.play();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page14/p14img3.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
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
                                    left: BorderSide(width: 1),
                                    bottom: BorderSide(width: 1)),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              4, audioFilePaths[4]);
                                        }
                                      : () async {
                                          await _audioPlayer.stop();
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[4]);
                                          await _audioPlayer.play();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page14/p14img4.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
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
                                    right: BorderSide(width: 1),
                                    bottom: BorderSide(width: 1)),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              3, audioFilePaths[3]);
                                        }
                                      : () async {
                                          await _audioPlayer.stop();
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[3]);
                                          await _audioPlayer.play();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page14/p14img5.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
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
                                    right: BorderSide(width: 1),
                                    bottom: BorderSide(width: 1)),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              2, audioFilePaths[2]);
                                        }
                                      : () async {
                                          await _audioPlayer.stop();
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[2]);
                                          await _audioPlayer.play();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page14/p14img6.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
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
                                    left: BorderSide(width: 1)),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              7, audioFilePaths[7]);
                                        }
                                      : () async {
                                          await _audioPlayer.stop();
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[7]);
                                          await _audioPlayer.play();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page14/p14img7.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
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
                                  right: BorderSide(width: 1),
                                ),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              6, audioFilePaths[6]);
                                        }
                                      : () async {
                                          await _audioPlayer.stop();
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[6]);
                                          await _audioPlayer.play();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page14/p14img8.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
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
                                  right: BorderSide(width: 1),
                                ),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              5, audioFilePaths[5]);
                                        }
                                      : () async {
                                          await _audioPlayer.stop();
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[5]);
                                          await _audioPlayer.play();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page14/p14img9.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
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
                                    left: BorderSide(width: 1)),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              9, audioFilePaths[9]);
                                        }
                                      : () async {
                                          await _audioPlayer.stop();
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[9]);
                                          await _audioPlayer.play();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page14/p14img10.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
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
                                  right: BorderSide(width: 1),
                                  top: BorderSide(width: 1),
                                ),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              8, audioFilePaths[8]);
                                        }
                                      : () async {
                                          await _audioPlayer.stop();
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[8]);
                                          await _audioPlayer.play();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page14/p14img11.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
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
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration:
                                  BoxDecoration(border: Border.all(width: 1)),
                              child: InkWell(
                                onTap: () async {
                                  await _audioPlayer
                                      .setAsset('assets/alif.mp3');
                                  _audioPlayer.play();
                                },
                                child: Image.asset(
                                  'assets/page14/p14img12.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
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
                                    left: BorderSide(width: 1),
                                    bottom: BorderSide(width: 1)),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              11, audioFilePaths[11]);
                                        }
                                      : () async {
                                          await _audioPlayer.stop();
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[11]);
                                          await _audioPlayer.play();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page14/p14img13.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
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
                          flex: 2,
                          child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                    right: BorderSide(width: 1),
                                    bottom: BorderSide(width: 1)),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              10, audioFilePaths[10]);
                                        }
                                      : () async {
                                          await _audioPlayer.stop();
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[10]);
                                          await _audioPlayer.play();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page14/p14img14.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
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
                                    left: BorderSide(width: 1),
                                    bottom: BorderSide(width: 1)),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              14, audioFilePaths[14]);
                                        }
                                      : () async {
                                          await _audioPlayer.stop();
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[14]);
                                          await _audioPlayer.play();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page14/p14img15.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
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
                                    right: BorderSide(width: 1),
                                    bottom: BorderSide(width: 1)),
                              ),
                              child: InkWell(
                                  onTap: widget.isMultipleSelectionEnabled
                                      ? () {
                                          _toggleSelection(
                                              13, audioFilePaths[13]);
                                        }
                                      : () async {
                                          await _audioPlayer.stop();
                                          await _audioPlayer
                                              .setAsset(audioFilePaths[13]);
                                          await _audioPlayer.play();
                                        },
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/page14/p14img16.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
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
                                  right: BorderSide(width: 1),
                                  bottom: BorderSide(width: 1)),
                            ),
                            child: InkWell(
                              onTap: widget.isMultipleSelectionEnabled
                                  ? () {
                                      _toggleSelection(12, audioFilePaths[12]);
                                    }
                                  : () async {
                                      await _audioPlayer.stop();
                                      await _audioPlayer
                                          .setAsset(audioFilePaths[12]);
                                      await _audioPlayer.play();
                                    },
                              child: Stack(
                                children: [
                                  Image.asset(
                                    'assets/page14/p14img17.png',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.fill,
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
                                ],
                              ),
                            ),
                          ),
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

class AudioListHolder14 {
  static List<String> audioList = [];
  static int pageId = 14;
}
