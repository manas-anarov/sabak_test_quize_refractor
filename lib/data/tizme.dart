import 'package:sabak_test/models/suroo.dart';

//Munu ishtetebiz
class Tizme {
  int _index = 0;

  List<Suroo> suroolor = [
    Suroo(suroo: 'KG din borobur Tashkent', joop: false),
    Suroo(suroo: 'KG din borobur Bishkek', joop: true),
    Suroo(suroo: 'Batken shaary Djalal-Abad oblusuna karayt', joop: false),
  ];

  final Suroo _question = Suroo();

//  _question.joop;

  String textAlipKel() {
    return suroolor[_index].suroo;
  }

  bool jooptuAlipKel() {
    return suroolor[_index].joop;
  }

  bool jooptuAlipKel2(int san) {
    return suroolor[_index].joop;
  }

  // 3 -1 = 2
  bool isFinished() {
    if (_index >= suroolor.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _index = 0;
  }

  int surooNomeri() {
    return _index;
  }

  void nextQuestion() {
    if (_index < suroolor.length - 1) {
      _index++;
    }
  }

  bool akirinaJettik() {
    if (_index > suroolor.length - 1) {
      return true;
    }
  }

  Suroo akirkyElement() {
    return suroolor.last;
  }
}

final Tizme tizmeBrain = Tizme();
