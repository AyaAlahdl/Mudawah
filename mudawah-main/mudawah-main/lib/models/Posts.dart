import 'package:equatable/equatable.dart';
import 'dart:convert';

List<BlogMod> articalModelFromJson(String str) =>
    List<BlogMod>.from(json.decode(str).map((x) => BlogMod.fromJson(x)));

class BlogMod extends Equatable {
  final String id;
  final String title;
  final String body;
  final String doctor;
  final String doctorimg;
  final String image;
  final int views;
  final DateTime createddate;

  const BlogMod(
      {required this.id,
      required this.title,
      required this.body,
      required this.doctor,
      required this.doctorimg,
      required this.image,
      required this.createddate,
      required this.views});
  factory BlogMod.fromJson(Map<String, dynamic> json) => BlogMod(
        id: json["id"],
        title: json["title"],
        body: json["content"],
        doctor: json["user_name"],
        doctorimg: 'assets/ArticleHome/pfp.png',
        image: 'assets/ArticleHome/covid.jpg',
        createddate: DateTime.now().subtract(const Duration(hours: 5)),
        views: json["seen"],
      );

  static List<BlogMod> blogs = [
    BlogMod(
      id: '1',
      title:
          'أحداث فائقة الانتشار والتجمعات الصغيرة: إرشادات السلامة الخاصة بفيروس COVID-19',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Fringilla ut morbi tincidunt augue interdum velit. Magna sit amet purus gravida quis blandit. Nam libero justo laoreet sit amet cursus sit amet dictum. Iaculis nunc sed augue lacus viverra. Integer eget aliquet nibh praesent tristique magna sit amet purus. Lobortis elementum nibh tellus molestie nunc non. Pretium quam vulputate dignissim suspendisse in est ante. Nunc congue nisi vitae suscipit tellus mauris a diam. Sodales neque sodales ut etiam sit amet nisl purus in. Fermentum dui faucibus in ornare quam viverra orci. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum. Donec adipiscing tristique risus nec feugiat. Neque laoreet suspendisse interdum consectetur libero id Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Fringilla ut morbi tincidunt augue interdum velit. Magna sit amet purus gravida quis blandit. Nam libero justo laoreet sit amet cursus sit amet dictum. Iaculis nunc sed augue lacus viverra. Integer eget aliquet nibh praesent tristique magna sit amet purus. Lobortis elementum nibh tellus molestie nunc non. Pretium quam vulputate dignissim suspendisse in est ante. Nunc congue nisi vitae suscipit tellus mauris a diam. Sodales neque sodales ut etiam sit amet nisl purus in. Fermentum dui faucibus in ornare quam viverra orci. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum. Donec adipiscing tristique risus nec feugiat. Neque laoreet suspendisse interdum consectetur libero id Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Fringilla ut morbi tincidunt augue interdum velit. Magna sit amet purus gravida quis blandit. Nam libero justo laoreet sit amet cursus sit amet dictum. Iaculis nunc sed augue lacus viverra. Integer eget aliquet nibh praesent tristique magna sit amet purus. Lobortis elementum nibh tellus molestie nunc non. Pretium quam vulputate dignissim suspendisse in est ante. Nunc congue nisi vitae suscipit tellus mauris a diam. Sodales neque sodales ut etiam sit amet nisl purus in. Fermentum dui faucibus in ornare quam viverra orci. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum. Donec adipiscing tristique risus nec feugiat. Neque laoreet suspendisse interdum consectetur libero id Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Fringilla ut morbi tincidunt augue interdum velit. Magna sit amet purus gravida quis blandit. Nam libero justo laoreet sit amet cursus sit amet dictum. Iaculis nunc sed augue lacus viverra. Integer eget aliquet nibh praesent tristique magna sit amet purus. Lobortis elementum nibh tellus molestie nunc non. Pretium quam vulputate dignissim suspendisse in est ante. Nunc congue nisi vitae suscipit tellus mauris a diam. Sodales neque sodales ut etiam sit amet nisl purus in. Fermentum dui faucibus in ornare quam viverra orci. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum. Donec adipiscing tristique risus nec feugiat. Neque laoreet suspendisse interdum consectetur libero id Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Fringilla ut morbi tincidunt augue interdum velit. Magna sit amet purus gravida quis blandit. Nam libero justo laoreet sit amet cursus sit amet dictum. Iaculis nunc sed augue lacus viverra. Integer eget aliquet nibh praesent tristique magna sit amet purus. Lobortis elementum nibh tellus molestie nunc non. Pretium quam vulputate dignissim suspendisse in est ante. Nunc congue nisi vitae suscipit tellus mauris a diam. Sodales neque sodales ut etiam sit amet nisl purus in. Fermentum dui faucibus in ornare quam viverra orci. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum. Donec adipiscing tristique risus nec feugiat. Neque laoreet suspendisse interdum consectetur libero id Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Fringilla ut morbi tincidunt augue interdum velit. Magna sit amet purus gravida quis blandit. Nam libero justo laoreet sit amet cursus sit amet dictum. Iaculis nunc sed augue lacus viverra. Integer eget aliquet nibh praesent tristique magna sit amet purus. Lobortis elementum nibh tellus molestie nunc non. Pretium quam vulputate dignissim suspendisse in est ante. Nunc congue nisi vitae suscipit tellus mauris a diam. Sodales neque sodales ut etiam sit amet nisl purus in. Fermentum dui faucibus in ornare quam viverra orci. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum. Donec adipiscing tristique risus nec feugiat. Neque laoreet suspendisse interdum consectetur libero id.',
      doctor: 'محمد صالح',
      doctorimg: 'assets/ArticleHome/pfp.png',
      image: 'assets/ArticleHome/covid.jpg',
      createddate: DateTime.now().subtract(const Duration(hours: 5)),
      views: 1204,
    ),
    BlogMod(
      id: '2',
      title: '“طعام خارق” تتميز اليمن بزراعته وخبيرة تغذية تكشف فوائده المذهلة',
      body:
          'من المعروف أن أرض اليمن خصبة لزراعة وإنتاج الكثير من الخضروات والفواكه، وتتميز عن غيرها من الدول في إنتاج معظمها في مواسم مختلفة ما يجعلها متوفرة على مدار العام. اليقطين واحدة من تلك الثمار التي تظل متوفرة في الأسواق وفي متناول الجميع بأسعار معقولة، غير أن الكثير من اليمنيين لا يدركون أهمية اليقطين وما يتمتع به من فوائد غذائية هائلة. قد يهمك..أمراض تصاب بها أثناء السباحة في السطور التالية نلخص لكم أهم فوائد اليقطين وفقاً لما نقل موقع ” health.clevelandclinic” عن خبيرة التغذية جوليا زومبانو: صحة العين والقلب اليقطين غني بفيتامين أ، وهو أمر رائع للرؤية وتقوية جهاز المناعة لديك”، وأضافت أن “تناول كمية صغيرة من اليقطين قادرة على تزويد الجسم بما يحتاجه يوميا من فيتامين ” أ “. كما يشير الموقع الألماني المتخصص في الأخبار الطبية “هايل براكسيس” إلى أن اليقطين يحتوي على اللوتين والزيارانثين وهما عنصران غذائيان يساعدان على حماية العين من الضمور البقعي في سن الشيخوخة. وفوائد اليقطين تشمل القلب أيضاً، حيث أفادت خبيرة التغذية الأميركية زومبانو أن اليقطين غني بالبوتاسيوم، الذي يعد عنصراً أساسياً لصحة القلب.',
      doctor: 'محمد صالح',
      doctorimg: 'assets/ArticleHome/pfp.png',
      image: 'assets/ArticleHome/pum.jpg',
      createddate: DateTime.now().subtract(const Duration(hours: 5)),
      views: 1204,
    ),
  ];

  @override
  List<Object?> get props =>
      [id, title, body, doctor, doctorimg, image, createddate, views];
}