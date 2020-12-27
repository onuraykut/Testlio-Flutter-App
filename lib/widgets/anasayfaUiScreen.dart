
import 'package:eslesmeapp/pages/cozdugumTestler.dart';
import 'package:eslesmeapp/pages/kategoriler.dart';
import 'package:eslesmeapp/pages/sharedWithMe.dart';
import 'package:eslesmeapp/pages/sorusecme_hazirlama.dart';
import 'package:flutter/material.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "Testlerim",
      subtitle: "Hazır testleri kullanabilirsiniz",
       event: "",
      img: "assets/digericonlar/Quiz.png",
    onClick: (context) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => KategoriBolumu()));
    }
  );

  Items item2 = new Items(
    title: "Soru Hazırlama",
    subtitle: "Kendi sorularını hazırlayıp arkadaşlarına gönderebilirsin",
    event: "  ",
      onClick: (context) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SoruHazirlama()));
      },
      img: "assets/digericonlar/soruHazirlama.png"
  );
  Items item3 = new Items(
    title: "Benimle Paylaşılanlar",
    subtitle: "Arkadaşlarının sana gönderdiği testler",
    event: "",
    onClick: (context) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SharedWithMe()));
    },
    img: "assets/digericonlar/checkbox-icon.png",
  );
  Items item4 = new Items(
    title: "Paylaştıklarım",
    subtitle: "Paylaştıklarını buradan görebilirsin",
    event: "",
      onClick: (context) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CozdugumTestler()));
      },
      img: "assets/digericonlar/shared.png"
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return InkWell(
              onTap: () => data.onClick(context),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        data.subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.event,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          fontWeight: FontWeight.w600)
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Function onClick;
  Items({this.title, this.subtitle, this.event, this.img,this.onClick});
}
