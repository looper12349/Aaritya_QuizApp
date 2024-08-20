import 'package:flutter/material.dart';

class LeaderboardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs: Weekly and Monthly
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                backgroundColor: Colors.white, // White background for AppBar
                flexibleSpace: FlexibleSpaceBar(
                  title: innerBoxIsScrolled
                      ? Text(
                          "Leaderboard",
                          style: TextStyle(color: Colors.black),
                        )
                      : null,
                  background: _buildTopContent(),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(36.0), // Reduced the height
                  child: TabBar(
                    indicatorColor: Colors.orange, // Orange color for indicator
                    labelPadding: EdgeInsets.symmetric(
                        horizontal: 4.0), // Reduced padding
                    labelStyle: TextStyle(
                        fontSize: 11,
                        color: Colors.black), // Black text for tabs
                    unselectedLabelStyle: TextStyle(
                        fontSize: 11,
                        color: Colors.grey), // Grey text when unselected
                    tabs: [
                      Tab(text: "Weekly"),
                      Tab(text: "Monthly"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              _buildLeaderboardList(),
              _buildLeaderboardList(), // Can customize for "Monthly"
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '#3',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              'You are among the top 3% of players this week!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTopPlayer('Alice Johnson', '2,200 QP', Icons.star),
                _buildTopPlayer('Bob Smith', '3,500 QP', Icons.star,
                    isWinner: true),
                _buildTopPlayer('Charlie Brown', '1,800 QP', Icons.star),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRankedBadge('#2'),
                _buildRankedBadge('#1'),
                _buildRankedBadge('#3'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopPlayer(String name, String points, IconData icon,
      {bool isWinner = false}) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            radius: isWinner ? 40 : 30,
            backgroundColor: isWinner
                ? Colors.yellow
                : Colors.blue.shade200, // Light blue for other players
            child: Icon(icon, size: isWinner ? 40 : 30, color: Colors.black),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            points,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 14,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRankedBadge(String rank) {
    return Expanded(
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.orange.shade300, // Orange color for badge
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            rank,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderboardList() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildLeaderboardItem(1, 'Bob Smith', '3,500 points', Colors.yellow),
        _buildLeaderboardItem(2, 'Alice Johnson', '2,200 points', Colors.grey),
        _buildLeaderboardItem(
            3, 'Charlie Brown', '1,800 points', Colors.orange),
        _buildLeaderboardItem(4, 'David Clark', '1,500 points'),
        _buildLeaderboardItem(5, 'Eve Davis', '1,200 points'),
        _buildLeaderboardItem(6, 'Frank Edwards', '1,000 points'),
        // Add more leaderboard items as needed
      ],
    );
  }

  Widget _buildLeaderboardItem(int rank, String name, String points,
      [Color? badgeColor]) {
    return Card(
      color: Colors.white, // White background for leaderboard items
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blue.shade200, // Light blue color for avatar
          child: Text(
            rank.toString(),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          points,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.grey.shade700,
          ),
        ),
        trailing: badgeColor != null
            ? Icon(
                Icons.emoji_events,
                color: badgeColor,
              )
            : null,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LeaderboardTab(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.white, // White background
      textTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'Poppins',
            bodyColor: Colors.black,
            displayColor: Colors.black,
          ),
    ),
  ));
}
