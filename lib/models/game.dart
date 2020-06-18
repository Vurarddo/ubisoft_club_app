import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Game extends Equatable {
  final int id;
  final String title;
  final String image;
  final String platform;

  Game({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.platform,
  })  : assert(id != null),
        assert(title != null),
        assert(image != null),
        assert(platform != null);

  @override
  List<Object> get props => [
        id,
        title,
        image,
        platform,
      ];
}
