<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="http://ditu.google.cn/maps?file=api&v=2" type="text/javascript">
</script>
<script type="text/javascript">
function initialize() {
var map = new GMap2(document.getElementById("map_canvas"));
map.setCenter(new GLatLng(39.9493, 116.3975), 13);
}
//创建maker
function createMarker() {
	var icon = new GIcon();


    icon.image = 
"http://labs.google.com/ridefinder/images/mm_20_red.png";
	var map = new GMap2(document.getElementById("map_canvas"));
	map.setCenter(new GLatLng(39.9493, 116.3975), 13);
			var bounds = map.getBounds();
　　　　var southWest = bounds.getSouthWest();
　　　　var northEast = bounds.getNorthEast();
　　　　var lngSpan = northEast.lng() - southWest.lng();
　　　　var latSpan = northEast.lat() - southWest.lat();
	var point = new GLatLng(southWest.lat() + latSpan * Math.random(),southWest.lng() + lngSpan * Math.random());
		

		var marker = new GMarker(point,icon);//实例化一个标点

		//给标点加click事件，当点击标点时弹出一个信息窗

		GEvent.addListener(marker, "click", function() {

			marker.openInfoWindowHtml("<b>hello</b>");

		});

		map.addOverlay(marker);//把标点添加到地图覆盖物

	}
	
	//描绘行车或者行走路线
	function find() {
		var start=new GLatLng(39.9493, 116.3975);
		var end=new GLatLng(42.9493, 122.3975)
map = new GMap2(document.getElementById("map_canvas"));
map.addControl(new GSmallZoomControl());
map.setCenter(new GLatLng(39.549809, 112.177082), 9);
directionsPanel = document.getElementById("route");
directions = new GDirections(map, directionsPanel);
directions.load("from: " + start + " to: " + end, {
travelMode : G_TRAVEL_MODE_DRIVING
});
}
</script>
</head>
<body   onunload="GUnload()">
<input type="button" value="addMarker" onclick="createMarker()"/>
<input type="button" value="findRoute" onclick="find()"/>
<div id="map_canvas" style="width:500px;height: 300px"></div>
<div id="route" style="width:500px;height: 300px"></div>
</body>
</html>
 
 
               
	            

