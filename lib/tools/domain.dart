
class Domain {

/*String domainApi="http://books.loseyourip.com:8082";
  String domain="http://books.loseyourip.com";*/

/*String domainApi="http://148.251.168.11:8085";
String domain="http://148.251.168.11";*/
String profile="/testapp/profile/";
String thumb="thumb/";
String domainApi="http://192.168.1.106:8085";
String domain="http://192.168.1.106";

  String getDomain() {
    return domain;
  }
  String getDomainApi() {
    return domainApi;
  }
  String getProfile() {
    return domain+profile;
  }
  String getThumb() {
    return domain+profile+thumb;
  }
}
