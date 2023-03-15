import 'package:aplikasi_sederhana1/components/login/login_model.dart';
import 'package:aplikasi_sederhana1/components/master/buttom_sheet.dart';
import 'package:aplikasi_sederhana1/utility/app_data.dart';
import 'package:aplikasi_sederhana1/utility/toast.dart';
import 'package:aplikasi_sederhana1/widget/text_label.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:location/location.dart' as loc;
import 'package:trust_location/trust_location.dart';

class LocationController extends GetxController {
  var informasiLogin = <LoginModel>[].obs;

  var latLangLokasi = "".obs;
  var alamatLokasi = "".obs;

  var statusFakeGps = false.obs;
  var prosesRefresh = false.obs;

  void startLoad() {
    checkRequestPermission();
    checkInformasiLogin();
    // showPemberitahuan();
  }

  void checkInformasiLogin() {
    List<LoginModel> tampungInformasi = AppData.informasiLogin ?? [];
    if (tampungInformasi.isNotEmpty) {
      informasiLogin.value = tampungInformasi;
      informasiLogin.refresh();
    }
  }

  void showPemberitahuan() {
    ButtonSheetController().showButtonSheet(
        "Perigatan",
        const TextLabel(text: "Anda tidak dapat menggunakan fake gps"),
        "nobutton",
        "",
        () {});
  }

  void checkRequestPermission() async {
    loc.Location location = loc.Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        ToastNotif.showToast("Anda tidak service location");
      }
    }

    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        ToastNotif.showToast("Anda tidak service location");
      }
    }
    checkFakeGps();
  }

  void checkFakeGps() async {
    prosesRefresh.value = true;
    prosesRefresh.refresh();
    bool isMockLocation = await TrustLocation.isMockLocation;

    if (!isMockLocation) {
      // The location data is not coming from a mock location provider
      loc.Location location = loc.Location();

      LocationData locationData = await location.getLocation();
      latLangLokasi.value =
          "${locationData.latitude}-${locationData.longitude}";
      latLangLokasi.refresh();

      // GET ADRESS

      List<Placemark> placemarks = await placemarkFromCoordinates(
          locationData.latitude!, locationData.longitude!);

      Placemark place = placemarks[0];

      String address =
          "${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea} ${place.postalCode}, ${place.country}";

      alamatLokasi.value = address;
      alamatLokasi.refresh();
      prosesRefresh.value = false;
      prosesRefresh.refresh();
    } else {
      ToastNotif.showToast("Maaf harap tidak memakai fake gps provider");
    }
  }
}
