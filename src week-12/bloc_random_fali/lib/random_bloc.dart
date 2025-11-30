import 'dart:async';
import 'dart:math';

class RandomNumberBloc {
  final _generateRandomController = StreamController<void>();
  final _randomNumberController = StreamController<int>();
  Sink<void> get generatRandom => _generateRandomController.sink;
  Stream<int> get randomNumberStream => _randomNumberController.stream;

  RandomNumberBloc() {
    _generateRandomController.stream.listen((_){
      final random = Random().nextInt(10);
      _randomNumberController.sink.add(random);
    });
  }

  void dispose() {
    _generateRandomController.close();
    _randomNumberController.close();
  }
}
