class ServiceModel {
  final String title;
  final String subtitle;
  final String imagePath;
  final String detailsImage; // Image for the second state/details panel

  ServiceModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.detailsImage,
  });
}

// Dummy data to populate the Service Grid
final List<ServiceModel> mockServices = [
  ServiceModel(
    title: 'Home Doctor',
    subtitle: 'Consultation',
    imagePath: 'assets/doctor.png', // Replace with actual asset paths
    detailsImage: 'assets/qurocare_van.png',
  ),
  ServiceModel(
    title: 'Home Nurse',
    subtitle: 'Service',
    imagePath: 'assets/nurse.png',
    detailsImage: 'assets/qurocare_van.png',
  ),
  ServiceModel(
    title: 'Home Sample',
    subtitle: 'Collection',
    imagePath: 'assets/sample.png',
    detailsImage: 'assets/qurocare_van.png',
  ),
  ServiceModel(
    title: 'Home Physiotherapy',
    subtitle: 'Collection',
    imagePath: 'assets/physiotherapy.png',
    detailsImage: 'assets/qurocare_van.png',
  ),
];