class DailyCalenderEvent {
  final int day;
  final int month;
  final String? nonWorkingDayReason;
  final String? punchIn;
  final String? punchOut;

  DailyCalenderEvent ({
    required this.day,
    required this.month,
    this.nonWorkingDayReason,
    this.punchIn,
    this.punchOut,
  });
}
