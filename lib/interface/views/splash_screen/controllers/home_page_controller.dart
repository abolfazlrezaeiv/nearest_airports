import 'package:flutter_latlong/flutter_latlong.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as googlemap;
import 'package:rezaei_flutter_test_task/data/repositories/airport_repo/airport_repository.dart';
import 'package:rezaei_flutter_test_task/domain/models/airport_model.dart';
import 'package:rezaei_flutter_test_task/domain/services/location_service_imp.dart';

class HomePageController extends GetxController {
  HomePageController(this.locationService, this.airportRepository);

  @override
  Future<void> onInit() async {
    await getCurrentLocation();
    super.onInit();
  }

  final AppLocationService locationService;
  final AirportRepository airportRepository;
  late Rx<googlemap.LatLng> currentLocaion = const googlemap.LatLng(0, 0).obs;
  final RxSet<googlemap.Marker> markers = <googlemap.Marker>{}.obs;
  RxList<Airport> nearestAirports = <Airport>[].obs;

  getCurrentLocation() async {
    var position = await locationService.getCurrentLocation();
    currentLocaion.value =
        googlemap.LatLng(position.latitude, position.longitude);
    update();
  }

  addMarkersToMap(List<Airport> twoAirports) {
    markers.add(googlemap.Marker(
      markerId: googlemap.MarkerId(
          googlemap.LatLng(twoAirports[0].lat!, twoAirports[0].lon!)
              .toString()),
      position: googlemap.LatLng(twoAirports[0].lat!, twoAirports[0].lon!),
      infoWindow: googlemap.InfoWindow(
        title: twoAirports[0].name,
        snippet: twoAirports[0].country,
      ),
      icon: googlemap.BitmapDescriptor.defaultMarker,
    ));

    markers.add(googlemap.Marker(
      markerId: googlemap.MarkerId(
          googlemap.LatLng(twoAirports[1].lat!, twoAirports[1].lon!)
              .toString()),
      position: googlemap.LatLng(twoAirports[1].lat!, twoAirports[1].lon!),
      infoWindow: googlemap.InfoWindow(
        title: twoAirports[1].name,
        snippet: twoAirports[1].country,
      ),
      icon: googlemap.BitmapDescriptor.defaultMarker,
    ));
    update();
  }

  findNearestTwoAirports() async {
    markers.clear();
    var allAirports = await airportRepository.readAirportsFromDB();
    Distance distance = const Distance();
    var distances = [];
    for (var index = 0; index < allAirports.length; index++) {
      var distanceInkm = distance.as(
          LengthUnit.Kilometer,
          LatLng(currentLocaion.value.latitude, currentLocaion.value.longitude),
          LatLng(allAirports[index].lat!, allAirports[index].lon!));
      distances.add(distanceInkm);
    }
    var nearest = distances[0];
    var indexOfFirst = 0;
    var indexOfSecond = 0;
    for (var index = 0; index < distances.length; index++) {
      if (distances[index] < nearest) {
        nearest = distances[index];
        indexOfFirst = index;
      }
    }
    nearestAirports.add(allAirports[indexOfFirst]);
    nearest = distances[0];
    for (var index = 0; index < distances.length; index++) {
      if (distances[index] < nearest) {
        if (index == indexOfFirst) continue;
        nearest = distances[index];
        indexOfSecond = index;
      }
    }
    nearestAirports.add(allAirports[indexOfSecond]);
    addMarkersToMap(nearestAirports);
    update();
  }
}
