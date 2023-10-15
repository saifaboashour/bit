class UploadedImage{
  final String? imagePath;

  UploadedImage({
    this.imagePath,
  });

  factory UploadedImage.fromJson(Map<String, dynamic> json) {
    return UploadedImage(
      imagePath: json['image_path'],
    );
  }
}