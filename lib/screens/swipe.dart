import 'package:flutter/material.dart';
import 'package:flutter_qaida/screens/qaidapage10.dart';
import 'package:flutter_qaida/screens/qaidapage11.dart';
import 'package:flutter_qaida/screens/qaidapage12.dart';
import 'package:flutter_qaida/screens/qaidapage13.dart';
import 'package:flutter_qaida/screens/qaidapage14.dart';
import 'package:flutter_qaida/screens/qaidapage15.dart';
import 'package:flutter_qaida/screens/qaidapage16.dart';
import 'package:flutter_qaida/screens/qaidapage17.dart';
import 'package:flutter_qaida/screens/qaidapage18.dart';
import 'package:flutter_qaida/screens/qaidapage19.dart';
import 'package:flutter_qaida/screens/qaidapage2.dart';
import 'package:flutter_qaida/screens/qaidapage3.dart';
import 'package:flutter_qaida/screens/qaidapage4.dart';
import 'package:flutter_qaida/screens/customPage.dart';
import 'package:flutter_qaida/screens/qaidapage5.dart';
import 'package:flutter_qaida/screens/qaidapage6.dart';
import 'package:flutter_qaida/screens/qaidapage7.dart';
import 'package:flutter_qaida/screens/qaidapage8.dart';
import 'package:flutter_qaida/screens/qaidapage9.dart';
import 'package:flutter_qaida/screens/page1.dart';
import 'package:just_audio/just_audio.dart';

class SwipePages extends StatefulWidget {
  const SwipePages({super.key});

  @override
  State<SwipePages> createState() => _SwipePagesState();
}

class _SwipePagesState extends State<SwipePages>
    with SingleTickerProviderStateMixin {
  final GlobalKey<Page1State> _page1Key = GlobalKey<Page1State>();
  int _curr = 0;
  bool _toggleValue = false;
  bool _isExpanded = false;
  bool _clearSelection = false;
  List<Widget> _list = <Widget>[];
  late Animation<double> _animation;
  late AnimationController _controller;
  bool _isMultipleSelectionEnabled = false;
  AudioPlayer _audioPlayer = AudioPlayer();
  List<AudioPlayer> _audioPlayers1 = [];
  PageController controller = PageController();
  final TextStyle _buttonTextStyle = const TextStyle(color: Colors.black);

  void _initList() {
    setState(() {
      _list = [
        Center(
            child: Page1(key: _page1Key, isMultipleSelectionEnabled: false)), //
        Center(child: Page2(isMultipleSelectionEnabled: false)),
        Center(child: Page3(isMultipleSelectionEnabled: false)),
        Center(child: Page4(isMultipleSelectionEnabled: false)),
        Center(child: Page5(isMultipleSelectionEnabled: false)),
        Center(child: Page6(isMultipleSelectionEnabled: false)),
        Center(child: Page7(isMultipleSelectionEnabled: false)),
        Center(child: Page8(isMultipleSelectionEnabled: false)),
        Center(child: Page9(isMultipleSelectionEnabled: false)),
        Center(child: Page10(isMultipleSelectionEnabled: false)),
        Center(child: Page11(isMultipleSelectionEnabled: false)),
        Center(child: Page12(isMultipleSelectionEnabled: false)),
        Center(child: Page13(isMultipleSelectionEnabled: false)),
        Center(child: Page14(isMultipleSelectionEnabled: false)),
        Center(child: Page15(isMultipleSelectionEnabled: false)),
        Center(child: Page16(isMultipleSelectionEnabled: false)),
        Center(child: Page17(isMultipleSelectionEnabled: false)),
        Center(child: Page18(isMultipleSelectionEnabled: false)),
        Center(child: Page19(isMultipleSelectionEnabled: false)),
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    controller = PageController(initialPage: _curr);
    _initList();
  }

  void _updateList() {
    setState(() {
      _list = List.generate(19, (index) {
        if (index == controller.page?.round()) {
          // If the index matches the current page index, pass the _isMultipleSelectionEnabled value
          return Center(
            child: _getPage(index, _isMultipleSelectionEnabled),
          );
        } else {
          // Otherwise, pass false as the value
          return Center(
            child: _getPage(index, false),
          );
        }
      });
    });
  }

  Widget _getPage(int index, bool isMultipleSelectionEnabled) {
    switch (index) {
      case 0:
        return Page1(
            key: _page1Key,
            isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 1:
        return Page2(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 2:
        return Page3(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 3:
        return Page4(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 4:
        return Page5(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 5:
        return Page6(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 6:
        return Page7(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 7:
        return Page8(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 8:
        return Page9(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 9:
        return Page10(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 10:
        return Page11(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 11:
        return Page12(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 12:
        return Page13(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 13:
        return Page14(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 14:
        return Page15(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 15:
        return Page16(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 16:
        return Page17(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 17:
        return Page18(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      case 18:
        return Page19(isMultipleSelectionEnabled: isMultipleSelectionEnabled);
      default:
        throw Exception("Invalid page index: $index");
    }
  }

  @override
  void dispose() {
    controller.dispose();
    _audioPlayer.dispose();
    for (int i = 0; i < _audioPlayers1.length; i++) {
      _audioPlayers1[i].dispose();
    }
    super.dispose();
  }

  void _showMenu() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.3,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Non-stop reading',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 16),
                    Switch(
                      value: _toggleValue,
                      onChanged: (value) {
                        setState(() {
                          _toggleValue = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isMultipleSelectionEnabled =
                            !_isMultipleSelectionEnabled;
                      });
                      _updateList();
                      Navigator.pop(context);
                    },
                    style: _isMultipleSelectionEnabled
                        ? ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            textStyle: const TextStyle(color: Colors.white),
                          )
                        : ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            textStyle: _buttonTextStyle,
                          ),
                    child: const Text('Select the words'),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  Future<void> _playPageAudios(int pageId, List<String> audioFiles) async {
    try {
      _audioPlayers1.clear();
      List<AudioPlayer> audioPlayer = [];
      switch (pageId) {
        case 1:
          for (int i = 0; i < audioFiles.length; i++) {
            AudioPlayer player = AudioPlayer();
            await player.setAsset(audioFiles[i]);
            _audioPlayers1.add(player);
          }
          break;
        case 2:
          for (int i = 0; i < audioFiles.length; i++) {
            AudioPlayer player = AudioPlayer();
            await player.setAsset(audioFiles[i]);
            _audioPlayers1.add(player);
          }
          break;
      }
      int finishedCount = 0;
      for (int i = 0; i < _audioPlayers1.length; i++) {
        await _audioPlayers1[i].play();
        await _audioPlayers1[i].playerStateStream.firstWhere(
            (state) => state.processingState == ProcessingState.completed);
        finishedCount++;
        // Call clearSelection() when all audio files have finished playing
        if (finishedCount == _audioPlayers1.length) {
          _page1Key.currentState?.clearSelection();
          print('finished looping!');
        }
      }
    } catch (e) {
      print('Error playing audios: $e');
    }
  }

  Future<void> _stopPageAudios() async {
    for (int i = 0; i < _audioPlayers1.length; i++) {
      await _audioPlayers1[i].stop();
    }
    _page1Key.currentState
        ?.clearSelection(); // currently will stop page 1 audio
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Qaida'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Stack(
        children: [
          PageView(
            allowImplicitScrolling: true,
            scrollDirection: Axis.horizontal,
            controller: controller,
            reverse: true,
            // ignore: avoid_types_as_parameter_names
            onPageChanged: (int num) {
              setState(() {
                _curr = num;
                _isMultipleSelectionEnabled = false;
                _page1Key.currentState
                    ?.clearSelection(); // On Page Change If Selection is made it will clear all the selection!
                // _isMultipleSelectionEnabled =
                //     _list[num].isMultipleSelectionEnabled;
                _stopPageAudios();
              });
            },
            children: _list,
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.settings),
              iconSize: 30,
              onPressed: () {
                _showMenu();
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .75,
            right: _isExpanded ? 0 : MediaQuery.of(context).size.width,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: MediaQuery.of(context).size.width,
              height: _isExpanded ? 65 : 0,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 100),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: IconButton(
                      onPressed: () async {
                        List<String> audioFiles = [];
                        int pageId = -1;
                        // StatefulWidget pageWidget;

                        if (_curr == 0) {
                          audioFiles = AudioListHolder1.audioList;
                          pageId = AudioListHolder1.pageId;
                        } else if (_curr == 1) {
                          audioFiles = AudioListHolder2.audioList;
                          pageId = AudioListHolder2.pageId;
                        }
                        if (audioFiles.isNotEmpty) {
                          print("List of audio files: $audioFiles");
                          await _playPageAudios(pageId, audioFiles);
                        }
                        print('Curr = $_curr');
                      },
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 18,
                      ),
                      color: Colors.white,
                      iconSize: 0.0,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  const SizedBox(width: 50),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: IconButton(
                      onPressed: () async {
                        await _stopPageAudios();
                      },
                      icon: const Icon(
                        Icons.stop,
                        size: 18,
                      ),
                      color: Colors.white,
                      iconSize: 0.0,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .78,
            right: MediaQuery.of(context).size.width * .06,
            child: SizedBox(
              height: 20,
              width: 20,
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Icon(
                  _isExpanded ? Icons.close : Icons.menu,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomPageIndicator(
        total: _list.length,
        controller: controller,
      ),
    );
  }
}


//-> Implemented Correctly!!!
//-> On Page Change The Select words button is setting to FALSE :)
//-> _isMultipleSelectionEnabled getting updated back in SwipePage
//->    when the selection is cleared.
//-> _isMultipleSelectionEnabled value is Passed to only current Page!
