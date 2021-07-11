class OnBoardingContent {
  String image;
  String description;

  OnBoardingContent({this.image, this.description});
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
      description:
          "Deploy the device in the field and \nstart the device for sensors to \nstart gathering the required data",
      image: 'assets/images/Illustration_1.png'),
  OnBoardingContent(
      description:
          "Recieve the data from the device \nsensors on your mobile device",
      image: 'assets/images/Illustration_2.png'),
  OnBoardingContent(
      description:
          "Easy to understand readings, \nprovided to you in a \nsimplified format",
      image: 'assets/images/Illustration_3.png')
];
