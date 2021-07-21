///
/// [SplashEvent] interface, an interface that each event dispatched to the [SplashBloc] must extends from it
///
abstract class SplashEvent {}

///
/// [ScreenAppeared] class, dispatched when the screen is appeared for the first time
///
class ScreenAppeared extends SplashEvent {}
