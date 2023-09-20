class TimeFormmaters {
  String formatDurationToTime(double duration) {
    int minutes = duration ~/ 60;
    double seconds = duration % 60;
    if (seconds < 10) {
      if (minutes < 10) {
        return '0$minutes:0${seconds.toInt()}';
      } else {
        return '$minutes:${seconds.toInt()}';
      }
    } else {
      if (minutes < 10) {
        return '0$minutes:${seconds.toInt()}';
      } else {
        return '$minutes:${seconds.toInt()}';
      }
    }
  }
}
