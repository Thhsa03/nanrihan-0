var map;
function init()
{
  var useragent = navigator.userAgent;
  var mapdiv = document.getElementById("map_canvas");

  if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1 ) {
    mapdiv.style.width = '100%';
    mapdiv.style.height = '100%';
  } else {
    mapdiv.style.width = '800px';
    mapdiv.style.height = '550px';
  }

  var latlng = new google.maps.LatLng(35.539001,134.228468);
  var opts = 
  {
    zoom: 13,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(mapdiv, opts);
}
// 位置の設定
function setPos()
{
    var newPos = new google.maps.LatLng(35.689614,139.691585);
    map.setCenter(newPos);
}
// 位置の移動
function movePos()
{
  map.panTo(new google.maps.LatLng(35.680865,139.767036));
}
// 中央位置の取得
function getCenterPosText()
{
    var latlng = map.getCenter();
    var lon_text =document.getElementById("lon_text");
    var lat_text =document.getElementById("lat_text");
    lon_text.value = latlng.lat();
    lat_text.value = latlng.lng();
}

function getBounds_RU_LD()
{
    var latlngBounds = map.getBounds();
    var swLatlng = latlngBounds.getSouthWest();
    var swlat = swLatlng.lat();
    var swlng = swLatlng.lng();

    var neLatlng = latlngBounds.getNorthEast();
    var nelat = neLatlng.lat();
    var nelng = neLatlng.lng();
}

function setMark()
{
    var m_latlng = new google.maps.LatLng(35.632605,139.88132);
    var marker = new google.maps.Marker({
    position: m_latlng,
    map: map
  });
    // マーカーのオプション設定
   // marker.setOptions(mopts2);
}