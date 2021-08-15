class RecentFile {
  final String icon, title, date, size;

  RecentFile({this.icon, this.title, this.date, this.size});
}

List demoRecentFiles = [
  RecentFile(
    icon: "assets/icons/media_file.svg",
    title: "Add Teachers",
    date: "23-05-2021",
    size: "249kb",
  ),
  RecentFile(
    icon: "assets/icons/media_file.svg",
    title: "Add Students",
    date: "23-05-2021",
    size: "299kb",
  ),

];
