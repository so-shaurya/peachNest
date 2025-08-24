import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const peaceNest());
}

class peaceNest extends StatelessWidget {
  const peaceNest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightGreen[50],
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'PeaceNest',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: const homePage(),
      ),
    );
  }
}

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const anger()),
                  );
                },
                child: Card(
                  color: Colors.lightGreen[200],
                  child: Center(
                    child: Text(
                      'Are You Angry',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green[900],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const anxiety()),
                  );
                },
                child: Card(
                  color: Colors.lightGreen[200],
                  child: Center(
                    child: Text(
                      'Do You Have Anxiety',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green[900],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const aiBox()),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Card(
                  color: Colors.lightGreen[200],
                  child: Center(
                    child: Text(
                      'Not Sure What I Am Feeling',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green[900],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildBottomBar(BuildContext context, int selectedIndex) {
  return BottomNavigationBar(
    backgroundColor: Colors.white,
    currentIndex: selectedIndex,
    selectedItemColor: Colors.green[800],
    unselectedItemColor: Colors.grey,
    onTap: (index) {
      if (index == selectedIndex) return; // avoid reload same page
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const anger()),
        );
      } else if (index == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const anxiety()),
        );
      } else if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const aiBox()),
        );
      }
    },
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.whatshot), label: "Anger"),
      BottomNavigationBarItem(icon: Icon(Icons.spa), label: "Anxiety"),
      BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "AI Box"),
    ],
  );
}

class aiBox extends StatelessWidget {
  const aiBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'PeaceNest',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: const Center(),
        bottomNavigationBar: buildBottomBar(context, 2),
      ),
    );
  }
}

class anger extends StatelessWidget {
  const anger({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'PeaceNest',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                // first half of screen
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: Colors.lightBlue[200],
                        child: Center(child: FamilyPhotoCard()),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        color: Colors.lightBlue[200],
                        child: Center(child: CameraCardPage()),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(color: Colors.lightBlue[200], child: QuoteScreen()),
              ),
              Expanded(
                // second half of screen
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: Colors.lightBlue[200],
                        child: Center(child: ImageBoxScreen()),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        color: Colors.lightBlue[200],
                        child: Center(child: AudioCard()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: buildBottomBar(context, 0),
      ),
    );
  }
}

class anxiety extends StatelessWidget {
  const anxiety({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'PeaceNest',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                // first half of screen
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: Colors.lightBlue[200],
                        child: Center(child: FamilyPhotoCard()),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        color: Colors.lightBlue[200],
                        child: Center(child: QuoteScreen()),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.lightBlue[200],
                  child: Center(child: DrawingBoxScreen()),
                ),
              ),
              Expanded(
                // second half of screen
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: Colors.lightBlue[200],
                        child: Center(child: ImageBoxScreen()),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        color: Colors.lightBlue[200],
                        child: Center(child: AudioCard()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: buildBottomBar(context, 1),
      ),
    );
  }
}

class FamilyPhotoCard extends StatefulWidget {
  @override
  _FamilyPhotoCardState createState() => _FamilyPhotoCardState();
}

class _FamilyPhotoCardState extends State<FamilyPhotoCard> {
  String? _photoPath; // only ONE photo
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadPhoto(); // load saved photo when app starts
  }

  Future<void> _loadPhoto() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _photoPath = prefs.getString('family_photo'); // single photo
    });
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName =
          "family_photo_${DateTime.now().millisecondsSinceEpoch}.jpg";
      final savedImage = await File(
        pickedFile.path,
      ).copy('${appDir.path}/$fileName');

      setState(() {
        _photoPath = savedImage.path; // replace old photo
      });

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('family_photo', _photoPath!); // save permanently
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.lightBlue[200],
        child: InkWell(
          onTap: _pickImage, // tap to pick/replace photo
          child: Center(
            child: _photoPath == null
                ? const Text("Tap to add Family Photo")
                : ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      File(_photoPath!),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class CameraCardPage extends StatefulWidget {
  const CameraCardPage({super.key});

  @override
  State<CameraCardPage> createState() => _CameraCardPageState();
}

class _CameraCardPageState extends State<CameraCardPage> {
  File? _capturedImage;

  Future<void> _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _capturedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Camera Card Example")),
      body: Center(
        child: Expanded(
          child: Card(
            color: Colors.lightBlue[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: _openCamera, // 📷 Open camera on tap
              child: Center(
                child: _capturedImage == null
                    ? const Text(
                        "Tap to open camera",
                        style: TextStyle(fontSize: 18),
                      )
                    : Image.file(_capturedImage!),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageBoxScreen extends StatefulWidget {
  const ImageBoxScreen({super.key});

  @override
  State<ImageBoxScreen> createState() => _ImageBoxScreenState();
}

class _ImageBoxScreenState extends State<ImageBoxScreen> {
  int _currentIndex = 0;

  // List of 10 images (can be asset or network)
  final List<String> _images = [
    "assets/count/num10.jpg",
    "assets/count/num9.jpg",
    "assets/count/num8.jpg",
    "assets/count/num7.jpg",
    "assets/count/num6.jpg",
    "assets/count/num5.jpg",
    "assets/count/num4.jpg",
    "assets/count/num3.jpg",
    "assets/count/num2.jpg",
    "assets/count/num1.jpg",
  ];

  void _changeImage() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1) % _images.length; // loop back after 10
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: _changeImage,
                child: Card(
                  color: Colors.lightBlue[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      _images[_currentIndex],
                      fit: BoxFit.cover, // makes image fill box
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
}

class AudioCard extends StatefulWidget {
  const AudioCard({super.key});

  @override
  State<AudioCard> createState() => _AudioCardState();
}

class _AudioCardState extends State<AudioCard> {
  late AudioPlayer _player;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.setAsset('assets/song/Verse 1.mp3'); // your song
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_isPlaying) {
      _player.pause();
    } else {
      _player.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.lightBlue[200],
        child: Center(
          child: IconButton(
            iconSize: 64,
            icon: Icon(
              _isPlaying ? Icons.pause_circle : Icons.play_circle,
              color: Colors.white,
            ),
            onPressed: _togglePlayPause,
          ),
        ),
      ),
    );
  }
}

class DrawingBoxScreen extends StatefulWidget {
  const DrawingBoxScreen({super.key});

  @override
  State<DrawingBoxScreen> createState() => _DrawingBoxScreenState();
}

class _DrawingBoxScreenState extends State<DrawingBoxScreen> {
  final DrawingController _controller = DrawingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: DrawingBoard(
            controller: _controller,
            background: Container(
              color: Colors.lightBlue[100],
              width: 400,
              height: 400,
            ),
            showDefaultActions: true,
            showDefaultTools: true,
            // You can customize the tools using defaultToolsBuilder,
            // or leave defaults if you're happy with them.
          ),
        ),
      ),
    );
  }
}

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  String quote = "Loading motivational quote...";
  String author = "";

  // ✅ Fallback quotes for anger/stress relief (offline use)
  final List<Map<String, String>> fallbackQuotes = [
    {"q": "Peace begins with a smile.", "a": "Mother Teresa"},
    {
      "q": "Do not let the behavior of others destroy your inner peace.",
      "a": "Dalai Lama",
    },
    {
      "q": "Calm mind brings inner strength and self-confidence.",
      "a": "Dalai Lama",
    },
    {"q": "Inhale calmness, exhale stress.", "a": "Unknown"},
    {
      "q":
          "You don’t have to control your thoughts. You just have to stop letting them control you.",
      "a": "Dan Millman",
    },
    {"q": "Anger is one letter short of danger.", "a": "Eleanor Roosevelt"},
  ];

  // ✅ Keywords for calming / motivational quotes
  final List<String> stressKeywords = [
    "peace",
    "calm",
    "mind",
    "strength",
    "patience",
    "happiness",
    "hope",
    "smile",
    "inner",
    "breathe",
    "focus",
  ];

  @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  Future<void> fetchQuote() async {
    final uri = Uri.parse("https://zenquotes.io/api/random");
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String fetchedQuote = data[0]['q'];
        String fetchedAuthor = data[0]['a'];

        if (isStressReliefQuote(fetchedQuote)) {
          setState(() {
            quote = fetchedQuote;
            author = fetchedAuthor;
          });
        } else {
          setFallbackQuote();
        }
      } else {
        setFallbackQuote();
      }
    } catch (e) {
      // On error → use offline fallback
      setFallbackQuote();
    }
  }

  bool isStressReliefQuote(String text) {
    return stressKeywords.any((word) => text.toLowerCase().contains(word));
  }

  void setFallbackQuote() {
    final random = Random();
    final fallback = fallbackQuotes[random.nextInt(fallbackQuotes.length)];
    setState(() {
      quote = fallback["q"]!;
      author = fallback["a"]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.lightBlue[200],
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 2),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  quote,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                if (author.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    "- $author",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchQuote,
        child: const Icon(Icons.refresh),
        backgroundColor: Colors.lightBlue[400],
      ),
    );
  }
}
