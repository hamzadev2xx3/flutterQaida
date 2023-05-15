import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Page1 extends StatefulWidget {
  bool isMultipleSelectionEnabled;

  Page1({
    Key? key,
    required this.isMultipleSelectionEnabled,
  }) : super(key: key);

  @override
  Page1State createState() => Page1State();
}

class Page1State extends State<Page1> {
  AudioPlayer _audioPlayer = AudioPlayer();
  List<String> _selectedAudioFiles = [];
  Set<int> _selectedContainers = {};
  List<String> audioFilePaths = [
    'assets/page1/alif.mp3',
    'assets/page1/baa1.mp3',
    'assets/page1/taaah.mp3',
    'assets/page1/saa.mp3',
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
    'assets/page1/qaaf.mp3',
    'assets/page1/kaaf.mp3',
    'assets/page1/laam.mp3',
    'assets/page1/meem.mp3',
    'assets/page1/noon.mp3',
    'assets/page1/wahoo.mp3',
    'assets/page1/haah.mp3',
    'assets/page1/hamza.mp3',
    'assets/page1/yaa.mp3',
    'assets/page1/yaah.mp3',
  ];

  int? _startIndex;
  int? _endIndex;
  bool _isPlaying = false;

  void _toggleSelection(int index, String filePath) {
    if (_startIndex != null && _endIndex != null) {
      // Selection already made, clear selection on any tap
      _selectedContainers.clear();
      _selectedAudioFiles.clear();
      _startIndex = null;
      _endIndex = null;
      AudioListHolder1.audioList.clear();
      widget.isMultipleSelectionEnabled = false;
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
      AudioListHolder1.audioList = selectedAudioFiles;
      widget.isMultipleSelectionEnabled = true;
    }
    setState(() {});
  }

  void clearSelection() {
    setState(() {
      _selectedContainers.clear();
      _selectedAudioFiles.clear();
      _startIndex = null;
      _endIndex = null;
      AudioListHolder1.audioList.clear();
      widget.isMultipleSelectionEnabled = false;
    });
  }

  @override
  void initState() {
    super.initState();
    preloadAudioFiles();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> preloadAudioFiles() async {
    for (final filePath in audioFilePaths) {
      await _audioPlayer.setAsset(filePath);
    }
  }

  //@override
  //bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    // super.build(context); // remember to call super.build(context)

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
                        child: Image.asset(
                          'assets/page1/bis.png',
                          fit: BoxFit.fill,
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
                            color: Color.fromARGB(255, 28, 98, 155),
                            border: Border(
                              right: BorderSide(width: 1),
                              left: BorderSide(width: 1),
                              top: BorderSide(width: 1),
                              bottom: BorderSide(width: 1),
                            )),
                        child: const Text(
                          ' حروف الهجاء المفردة',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              letterSpacing: 1.5),
                          textAlign: TextAlign.center,
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        //right: BorderSide(width: .5),
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    4, audioFilePaths[4]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[4]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/jeemp1.png',
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
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    9, audioFilePaths[9]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[9]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/raap1.png',
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
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    14, audioFilePaths[14]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[14]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/zoadp1.png',
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
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    19, audioFilePaths[19]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[19]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/faap1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
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
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    24, audioFilePaths[24]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[24]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/noonp1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                          if (_selectedContainers.contains(24))
                                            if (_startIndex == 24)
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
                                            else if (_endIndex == 24)
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
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    29, audioFilePaths[29]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[29]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/yap1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                          if (_selectedContainers.contains(29))
                                            if (_startIndex == 29)
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
                                            else if (_endIndex == 29)
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
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: .5),
                                        top: BorderSide(width: 0.5),
                                        right: BorderSide(width: .5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
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
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            'assets/page1/saap1.png',
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
                                        ],
                                      ),
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 0.5),
                                        right: BorderSide(width: .5),
                                        bottom: BorderSide(width: 0.5),
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
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[8]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/zaalp1.png',
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
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 0.5),
                                        right: BorderSide(width: .5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    13, audioFilePaths[13]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[13]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/saadp1.png',
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
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 0.5),
                                        right: BorderSide(width: .5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    18, audioFilePaths[18]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[18]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/gaeenp1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
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
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 0.5),
                                        right: BorderSide(width: .5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    23, audioFilePaths[23]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[23]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/meemp1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                          if (_selectedContainers.contains(23))
                                            if (_startIndex == 23)
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
                                            else if (_endIndex == 23)
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
                                        top: BorderSide(width: 0.5),
                                        right: BorderSide(width: .5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    28, audioFilePaths[28]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[28]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/yaap1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                          if (_selectedContainers.contains(28))
                                            if (_startIndex == 28)
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
                                            else if (_endIndex == 28)
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
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: .5),
                                        top: BorderSide(width: 0.5),
                                        right: BorderSide(width: .5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
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
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            'assets/page1/taap1.png',
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
                                        ],
                                      ),
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    7, audioFilePaths[7]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[7]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/daalp1.png',
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
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    12, audioFilePaths[12]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[12]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/sheenp1.png',
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
                                        ]))),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    17, audioFilePaths[17]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[17]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/aeenp1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
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
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    22, audioFilePaths[22]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[22]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/laamp1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                          if (_selectedContainers.contains(22))
                                            if (_startIndex == 22)
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
                                            else if (_endIndex == 22)
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
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    27, audioFilePaths[27]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[27]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/hamzap1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                          if (_selectedContainers.contains(27))
                                            if (_startIndex == 27)
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
                                            else if (_endIndex == 27)
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
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: .5),
                                        top: BorderSide(width: 0.5),
                                        right: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
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
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            'assets/page1/bap1.png',
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
                                        ],
                                      ),
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: .5),
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
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
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[6]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/khap1.png',
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
                                        left: BorderSide(width: .5),
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    11, audioFilePaths[11]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[11]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/seenp1.png',
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
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: .5),
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    16, audioFilePaths[16]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[16]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/zoap1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
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
                                        left: BorderSide(width: .5),
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    21, audioFilePaths[21]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[21]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/qaafp1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                          if (_selectedContainers.contains(21))
                                            if (_startIndex == 21)
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
                                            else if (_endIndex == 21)
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
                                        left: BorderSide(width: .5),
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    26, audioFilePaths[26]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[26]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/haap1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                          if (_selectedContainers.contains(26))
                                            if (_startIndex == 26)
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
                                            else if (_endIndex == 26)
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
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        right: BorderSide(width: 1),
                                        top: BorderSide(width: 0.5),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkResponse(
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
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            'assets/page1/alifp1.png',
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
                                        ],
                                      ),
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 0.5),
                                        right: BorderSide(width: 1),
                                        bottom: BorderSide(width: 0.5),
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
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[5]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/hap1.png',
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
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 0.5),
                                        right: BorderSide(width: 1),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    10, audioFilePaths[10]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[10]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/zap1.png',
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
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 0.5),
                                        right: BorderSide(width: 1),
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
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[15]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/tap1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
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
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 1),
                                        top: BorderSide(width: 0.5),
                                        right: BorderSide(width: 1),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    20, audioFilePaths[20]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[20]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/qafp1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                          if (_selectedContainers.contains(20))
                                            if (_startIndex == 20)
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
                                            else if (_endIndex == 20)
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
                                        top: BorderSide(width: 0.5),
                                        right: BorderSide(width: 1),
                                        bottom: BorderSide(width: 0.5),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: widget.isMultipleSelectionEnabled
                                            ? () {
                                                _toggleSelection(
                                                    25, audioFilePaths[25]);
                                              }
                                            : () async {
                                                await _audioPlayer.stop();
                                                await _audioPlayer.setAsset(
                                                    audioFilePaths[25]);
                                                await _audioPlayer.play();
                                              },
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/page1/wowp1.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                          if (_selectedContainers.contains(25))
                                            if (_startIndex == 25)
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
                                            else if (_endIndex == 25)
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
          ],
        ),
      ),
    );
  }
}

class AudioListHolder1 {
  static List<String> audioList = [];
  static int pageId = 1;
}

//-> TESTS CLEARED
//-> ~ Single AudioPlay working
//-> ~ Multiple Select working tested Scenarios:
//-> ~ When the single letter is selected and I press on play button
//->     It wont play untill the range is selected.
//-> ~ Audio is cleared when the range is cleared.
//-> ~ when range is cleared _isMultipleSelectionEnabled is set to false.
//-> ~ AudioPlay is much faster now!!!


//->  TODO TESTS
//->  ~When I SWIPE TO NEXT PAGE THE RANGE SHOULD BE CLEARED AND THE
//->  VALUE OF isMultipleSelectionEnabled should be set to false and
//->  should be updated back in SwipePages.