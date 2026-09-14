import 'package:flutter/material.dart';

void main() {
  runApp(SphereApp());
}

// ==========================================
// ১. মূল অ্যাপ স্ট্রাকচার (MAIN ENGINE)
// ==========================================
class SphereApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SPHERE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(primary: Colors.blueAccent),
      ),
      home: SplashScreen(),
    );
  }
}

// ==========================================
// २. स्प्ल्यास स्क्रीन (SPLASH SCREEN)
// ==========================================
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ३ सेकंड पर लॉगइन स्क्रीन पर जाएंगे
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'S',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'SPHERE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// ३. लॉगइन स्क्रीन (LOGIN SCREEN)
// ==========================================
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'SPHERE',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
            ),
            SizedBox(height: 40),
            // गूगल साइन-इन बटन
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainLayout()),
                );
              },
              icon: Icon(Icons.g_mobiledata, size: 30, color: Colors.black),
              label: Text('Continue with Google', style: TextStyle(color: Colors.black, fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            SizedBox(height: 16),
            // मोबाइल साइन-इन बटन
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainLayout()),
                );
              },
              icon: Icon(Icons.phone, color: Colors.white),
              label: Text('Continue with Phone', style: TextStyle(color: Colors.white, fontSize: 16)),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                side: BorderSide(color: Colors.grey[700]!),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// ४. मुख्य नेविगेशन लेआउट (MAIN LAYOUT)
// ==========================================
class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ChatsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum_outlined),
            activeIcon: Icon(Icons.forum),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// ५. होम फीड स्क्रीन (HOME FEED SCREEN)
// ==========================================
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'SPHERE',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.search, color: Colors.white, size: 28), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications_none_outlined, color: Colors.white, size: 28), onPressed: () {}),
          IconButton(icon: Icon(Icons.forum_outlined, color: Colors.white, size: 26), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Clips और Moments बार
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              color: Colors.grey[950],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.movie_creation_outlined, color: Colors.redAccent, size: 22),
                      SizedBox(width: 6),
                      Text('Clips', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(height: 20, width: 1, color: Colors.grey[800]),
                  Row(
                    children: [
                      Icon(Icons.auto_awesome, color: Colors.purpleAccent, size: 20),
                      SizedBox(width: 6),
                      Text('Moments', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey[900], height: 1),

            // इनपुट बॉक्स
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.grey[900],
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'SPHERE Feed में शेयर करें...',
                      style: TextStyle(color: Colors.grey[400], fontSize: 15),
                    ),
                  ),
                  Icon(Icons.image_outlined, color: Colors.greenAccent),
                  SizedBox(width: 12),
                  Icon(Icons.videocam_outlined, color: Colors.redAccent),
                ],
              ),
            ),
            Divider(color: Colors.grey[800], height: 1),

            // फीड पोस्ट
            PostCard(
              userName: 'तान्वीर अहमद',
              timeAgo: '2 घंटे पहले',
              postText: 'SPHERE ऐप में सभी को स्वागत है! यहाँ अद्वितीय सुविधाओं में सब कुछ जुड़ा होगा।',
            ),
          ],
        ),
      ),
    );
  }
}

// पोस्ट कार्ड घटक
class PostCard extends StatelessWidget {
  final String userName;
  final String timeAgo;
  final String postText;

  PostCard({required this.userName, required this.timeAgo, required this.postText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      color: Colors.grey[900],
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.person, color: Colors.white),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(timeAgo, style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              Spacer(),
              Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
          SizedBox(height: 12),
          Text(postText, style: TextStyle(color: Colors.white, fontSize: 15)),
          SizedBox(height: 12),
          Divider(color: Colors.grey[800]),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_border, color: Colors.grey[400], size: 20),
                  SizedBox(width: 6),
                  Text('Like', style: TextStyle(color: Colors.grey[400])),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.chat_bubble_outline, color: Colors.grey[400], size: 20),
                  SizedBox(width: 6),
                  Text('Comment', style: TextStyle(color: Colors.grey[400])),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.send_outlined, color: Colors.grey[400], size: 20),
                  SizedBox(width: 6),
                  Text('Share', style: TextStyle(color: Colors.grey[400])),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ==========================================
// ६. चैट्स इनबॉक्स स्क्रीन (CHATS SCREEN)
// ==========================================
class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('चैट्स', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: Icon(Icons.camera_alt, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.edit, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'चैट्स खोजें...',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          Container(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.blueAccent,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          Positioned(
                            bottom: 2,
                            right: 2,
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(radius: 5, backgroundColor: Colors.green),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 4),
                      Text('User $index', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(color: Colors.grey[900]),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.grey[800],
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text('User ${index + 1}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  subtitle: Text('SPHERE ऐप में चैट्स परीक्षण चल रहा है...', style: TextStyle(color: Colors.grey), maxLines: 1),
                  trailing: Text('10:45 AM', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// ७. प्रोफाइल स्क्रीन (PROFILE SCREEN)
// ==========================================
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('प्रोफाइल', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: Icon(Icons.settings_outlined, color: Colors.white), onPressed: () {}),
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  color: Colors.grey[850],
                  child: Center(child: Icon(Icons.add_a_photo_outlined, color: Colors.grey[500], size: 30)),
                ),
                Positioned(
                  bottom: -45,
                  child: CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 44,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person, size: 55, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 55),
            Center(
              child: Column(
                children: [
                  Text('तान्वीर अहमद', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 6),
                  Text('SPHERE की दुनिया में स्वागत है! 🌐', style: TextStyle(color: Colors.grey[400], fontSize: 14)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.person_add, color: Colors.white, size: 18),
                      label: Text('मित्र जोड़ें', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, padding: EdgeInsets.symmetric(vertical: 10)),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.forum_outlined, color: Colors.white, size: 18),
                      label: Text('चैट्स', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[850], padding: EdgeInsets.symmetric(vertical: 10)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Divider(color: Colors.grey[900]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('विवरण', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  DetailRow(icon: Icons.work_outline, text: 'SPHERE Inc. में काम करता है'),
                  DetailRow(icon: Icons.home_outlined, text: 'ढाका, बांग्लादेश में रहता है'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String text;

  DetailRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[400], size: 20),
          SizedBox(width: 12),
          Text(text, style: TextStyle(color: Colors.grey[300], fontSize: 14)),
        ],
      ),
    );
  }
}
