part of 'bulkcube_cubit.dart';

abstract class BulkcubeState extends Equatable {
  const BulkcubeState();

  @override
  List<Object> get props => [];
}

class BulkcubeInitial extends BulkcubeState {}

class BulkcubeLoading extends BulkcubeState {}

class BulkcubeLoaded extends BulkcubeState {
  final List<BulkBlock> bulkBlockList;

  const BulkcubeLoaded(this.bulkBlockList);

  // Prevents two equal states from overriding each other
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is BulkcubeLoaded && o.bulkBlockList == bulkBlockList;
  }

  @override
  int get hashCode => bulkBlockList.hashCode;
}

class BulkcubeError extends BulkcubeState {
  final String message;

  const BulkcubeError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is BulkcubeError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
