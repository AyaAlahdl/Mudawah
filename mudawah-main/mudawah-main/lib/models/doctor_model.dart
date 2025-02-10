import 'package:equatable/equatable.dart';

class Doctor extends Equatable {
  final String id;
  final String docname;
  final String docprofession;
  final String doclocation;
  final String doctorimg;
  final String docreviews;
  final String docfollowers;

  const Doctor({
    required this.id,
    required this.docname,
    required this.docprofession,
    required this.doclocation,
    required this.doctorimg,
    required this.docfollowers,
    required this.docreviews,
  });

  static List<Doctor> profile = [
    Doctor(
      id: '1',
      docname: 'د/ محمد صالح',
      docprofession: 'أخصائي قلب',
      doclocation: 'عدن / انماء',
      doctorimg: 'assets/ArticleHome/pfp.png',
      docfollowers: '234',
      docreviews: '234',
    ),
  ];

  @override
  List<Object?> get props => [
        id,
        docname,
        docprofession,
        doclocation,
        doctorimg,
        docreviews,
        docfollowers,
      ];
}
