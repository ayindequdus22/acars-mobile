class EngineerModel {
  
 final String text;
 final String image;
 final String prof;
  const EngineerModel({required this.text,required this.image,required this.prof});
 }
 List<EngineerModel> engineerModels =[
  const EngineerModel(text: "Toyota Melly ", image: "https://res.cloudinary.com/dxoemtk19/image/upload/v1715175713/image_22_ue469y.jpg", prof: "Rewire"),
  const EngineerModel( text: "Marc ZuckerBerg", image: "https://res.cloudinary.com/dxoemtk19/image/upload/v1715175724/image_23_fh37ar.jpg", prof: "Exhaust Mechanic" ),
  const EngineerModel(text: "Elon Musk", image: "https://res.cloudinary.com/dxoemtk19/image/upload/v1715175736/image_24_pjjhlw.jpg", prof: "Exhaust Mechanic"),
  const EngineerModel(text: "Elon ZuckerBerg", image: "https://res.cloudinary.com/dxoemtk19/image/upload/v1715175713/image_22_ue469y.jpg", prof: "Exhaust Mechanic")
 ];