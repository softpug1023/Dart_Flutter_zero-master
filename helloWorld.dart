import 'dart:async';

void main(List<String> args) {
  Stream numberStream = NumberGenerator().getStream.asBroadcastStream();

  StreamSubscription sub1 = numberStream.listen(
    (event) {
      print(event);
    },
    onDone: () => {},
    onError: (error) {},
    cancelOnError: true,
  );
}

class NumberGenerator {
  int _counter = 0;
  StreamController<int> _controller = StreamController<int>();

  Stream<int> get getStream => _controller.stream;

  NumberGenerator() {
    final timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _controller.sink.add(_counter);
      _counter++;
    });

    Future.delayed(Duration(seconds: 5), () => timer.cancel());
  }
}
