function getPercentageLat(read_exif)
{
	var lat = read_exif["GPSLatitude"];
	if (lat == null)
	{
		return;
	}
	var latP = lat[0] +lat[1] / 60.0 +lat[2]/3600.0;
	if(read_exif["GPSLatitudeRef"]=="S")
	{
		latP = -latP;
	}
	return latP
}
function getPercentageLng(read_exif)
{
	var lng = read_exif["GPSLongitude"];
	if(lng==null)
	{
		return;
	}
	var lngP = lng[0] + lng[1] / 60.0 + lng[2]/3600.0;
	if(read_exif["GPSLongitudeRef"]=="W")
	{
		lngP = -lngP;
	}
	return lngP
}
