class EntertainmentList {
  final String title;
  final String subTitle;
  final String way;

  EntertainmentList(this.title, this.subTitle, this.way);
}

List<EntertainmentList> entertainmentsList = [
  EntertainmentList('Настрольные игры', 'Мафия, уно, домино, экивоки и другие',
      'assets/imageHobby/hobby1.png'),
  EntertainmentList(
      'Бассейн', 'Два бассейна с подогревом', 'assets/imageHobby/hobby2.png'),
  EntertainmentList('Настрольные игры', 'Мафия, уно, домино, экивоки и другие',
      'assets/imageHobby/hobby1.png'),
  EntertainmentList(
      'Бассейн', 'Два бассейна с подогревом', 'assets/imageHobby/hobby2.png')
];
