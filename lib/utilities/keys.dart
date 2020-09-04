

import 'dart:io';

const String API_KEY = 'AIzaSyA0Du5PmFa3LOkGkTKyDSCbMMVFdKx2u90';
const String CHANNEL_ID = 'UCO1N0B1O_VltrSz94skOReQ';
const String ICT_WORLD_AND_BANGLADESH_2020 = 'PLB5Ny8gCF9CM3X98YQuKZqHvlPA2WO2Wl';
const String DATA_COMMUNICATIONCR_2020 = 'PLB5Ny8gCF9CPxPhB5E2C8pxUVTQJo1uKk';
const String NETWORKING_2020 = 'PLB5Ny8gCF9COOwYQFK4zeqJPklVRUz_D4';
const String LOGIC_GATE_2020 = 'PLB5Ny8gCF9COOx8vFfhvyYkHStsIYn1tN';
const String NUMBER_SYSTEM_2020 = 'PLB5Ny8gCF9CNlE2RbQb5pwPn3Shb4jeo0';
const String HTML_2019 = 'PLB5Ny8gCF9CNOAS-LRVX2N3nOGKr8wtD2';
const String HTML_2020 = 'PLB5Ny8gCF9COF4tmR5wrqXKyRZSwRKorD';
const String FC_ALG_2020 = 'PLB5Ny8gCF9CNhKlQhtSffgPFCcGIb5vfp';
const String C_PROGRAM_2020 = 'PLB5Ny8gCF9CMZr66kDkY61N5buj0vgCym';
const String C_PROGRAM_2019 = 'PLB5Ny8gCF9CPVClZxdvFDkW9c7dfTian3';
const String DATABASE_MANAGEMENT_2020 = 'PLB5Ny8gCF9CMScKKRqjFMsIFbVRnP78PI';

const String DATABASE_MANAGEMENT_BQ = 'PLB5Ny8gCF9CO-AkH3BdJGI2yrVPoD9c1v';
const String PROGRAMMING_BQ = 'PLB5Ny8gCF9COB_Zns_9qTfoTzbo1qg0g7';
const String WEB_DESIGN_BQ = 'PLB5Ny8gCF9CNhR5MPpfbnmR8ylv5ODN4e';
const String NUMBER_AND_LOGIC_GATE_BQ = 'PLB5Ny8gCF9CNzoy69gEtiqdG2fjoyuJZM';
const String COMMUNICATION_NETWORKING_BQ = 'PLB5Ny8gCF9CMZyB7PKSQ_Nnah8bc9NFZP';


//Admob Keys
String getAppId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544~1458002511';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544~3347511713';
  }
  return null;
}
String getBannerAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/2934735716';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-1859295077363295/7455207908';
  }
  return null;
}

String getInterstitialAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/4411468910';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-1859295077363295/6333697928';
  }
  return null;
}