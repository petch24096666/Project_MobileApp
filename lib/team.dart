import 'package:flutter/material.dart';

class TeamMember {
  final String name;
  final int age;
  final String position;
  final int shirtnum;
  final String Image;

  TeamMember(
      {required this.name,
      required this.age,
      required this.position,
      required this.shirtnum,
      required this.Image});
}

class TeamPage extends StatelessWidget {
  final List<TeamMember> teamMembers = [
    TeamMember(
        name: 'David De Gea',
        age: 32,
        position: 'Goalkeeper',
        shirtnum: 1,
        Image:
            'https://resources.premierleague.com/premierleague/photos/players/250x250/p51940.png'),
    TeamMember(
        name: 'LISANDRO Martinez',
        age: 25,
        position: 'Defender',
        shirtnum: 6,
        Image:
            'https://e0.365dm.com/22/07/1600x900/skysports-lisandro-martinez_5846996.jpg?20220727133633'),
    TeamMember(
        name: 'Raphael Varane',
        age: 30,
        position: 'Defender',
        shirtnum: 19,
        Image:
            'https://imageio.forbes.com/specials-images/imageserve/6446a7110955fca5b61742c8/0x0.jpg?format=jpg&width=1200'),
    TeamMember(
        name: 'Aaron Wan-bissaka',
        age: 25,
        position: 'Defender',
        shirtnum: 29,
        Image:
            'https://library.sportingnews.com/2021-10/aaron-wan-bissaka-manchester-united-2019-20_77jspfdvt4nv1ee48fuglm546.jpg'),
    TeamMember(
        name: 'Luke Shaw',
        age: 27,
        position: 'Defender',
        shirtnum: 23,
        Image:
            'https://i2-prod.manchestereveningnews.co.uk/incoming/article26708027.ece/ALTERNATES/s1200c/0_GettyImages-1480424822.jpg'),
    TeamMember(
        name: 'Casemiro',
        age: 27,
        position: 'Midfielder',
        shirtnum: 31,
        Image:
            'https://i.guim.co.uk/img/media/7947a424a20ad696d5567b6c8b6c0e3c73cd7c3f/0_247_5067_3040/master/5067.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=c945e829e5655b8084ad42ec6ab9c545'),
    TeamMember(
        name: 'Burno Fernandes',
        age: 28,
        position: 'Midfielder',
        shirtnum: 8,
        Image:
            'https://cdn.resfu.com/media/img_news/afp_en_8308d6ba1b3bb82afb07e3558b081e5c142f209e.jpg?size=1000x&lossy=1'),
    TeamMember(
        name: 'Chirstian Eriksen',
        age: 31,
        position: 'Midfielder',
        shirtnum: 14,
        Image:
            'https://static.independent.co.uk/2023/04/04/12/GettyImages-1460471629.jpg'),
    TeamMember(
        name: 'Antony',
        age: 23,
        position: 'Forward',
        shirtnum: 21,
        Image:
            'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/bltce11832f34bdf210/635edb357abc121050615584/GettyImages-1437111935.jpg?auto=webp&format=pjpg&width=3840&quality=60'),
    TeamMember(
        name: 'Jadon Sancho',
        age: 23,
        position: 'Forward',
        shirtnum: 25,
        Image:
            'https://resources.premierleague.com/premierleague/photos/players/250x250/p209243.png'),
    TeamMember(
        name: 'Marcus Rashford',
        age: 25,
        position: 'Forward',
        shirtnum: 10,
        Image:
            'https://a.espncdn.com/media/motion/2023/0226/ss_20230226_121618890_2202529743/ss_20230226_121618890_2202529743.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
        top: 0,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      ListView(
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 1,
            children: teamMembers.map((teamMember) {
              return AspectRatio(
                aspectRatio: 1,
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 255, 0, 0)
                            .withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.network(
                          teamMember.Image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        teamMember.name,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Age: ${teamMember.age}',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Position: ${teamMember.position}',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    ]));
  }
}
