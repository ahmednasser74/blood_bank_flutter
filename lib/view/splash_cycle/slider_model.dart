class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Discover a Food Courner offering the best fast food near you");
  sliderModel.setTitle("Search......");
  sliderModel.setImageAssetPath("images/slide1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Our food plan is filled with delicious seasonal vegetables, whole grains, fast food , burgger , pizza etc.");
  sliderModel.setTitle("Order..... ");
  sliderModel.setImageAssetPath("images/slide2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Food delivery or pickup from local restaurants, Explore restaurants that deliver near you.");
  sliderModel.setTitle("Deliver........");
  sliderModel.setImageAssetPath("images/slide3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
