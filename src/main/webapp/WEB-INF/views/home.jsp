<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Dairy Mahasangh Admin Panel</title>

<link rel="apple-touch-icon" href="apple-icon.png">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/favicon.ico">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/normalize.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/flag-icon.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/cs-skin-elastic.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/scss/style.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/menu.css">

<link
	href="${pageContext.request.contextPath}/resources/assets/css/lib/vector-map/jqvmap.min.css"
	rel="stylesheet">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>


<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<style type="text/css">

.MyClass{
width: 20px;
background-color: lime;
}


</style>
</head>

<body onload="setData()" >

	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/common/left.jsp"></jsp:include>
	<!-- Left Panel -->


	<!-- Header-->
	<jsp:include page="/WEB-INF/views/common/right.jsp"></jsp:include>
	<!-- Header-->
<c:url var="getCatOrdQty" value="/getCatOrdQty"></c:url>

<c:url var="getHubLatesOrdersForGraph" value="/getHubLatesOrdersForGraph"></c:url>

	<c:url var="getCatwiseTrend" value="/getCatwiseTrend"></c:url>


<div class="content mt-3">
		<div class="animated fadeIn">

			<div class="row">

				<div class="col-xs-12 col-sm-12">

					<div class="col-xs-12 col-sm-12">

						<div class="col-sm-6 col-lg-4" onclick="showTodaysOrder(${dashBoard.todaysOrdTotAndCount.orderCount})" style="cursor: pointer;">
							<div class="card text-white bg-flat-color-2">
								<div class="card-body pb-0" align="center">

									<h4 class="mb-0">
										<span class="count" style="font-size: 50px;">${dashBoard.todaysOrdTotAndCount.orderCount}</span>
									</h4>
									<p style="font-size: 18px; font-weight: bold; color: white;">
										<font color="white"><spring:message code="label.order" /></font>
									</p>

								</div>
							</div>
						</div>



						<div class="col-sm-6 col-lg-4" onclick="showTodaysOrder(${dashBoard.todaysOrdTotAndCount.orderTotal})" style="cursor: pointer;">
							<div class="card text-white bg-flat-color-2">
								<div class="card-body pb-0" align="center">
									<h4 class="mb-0">
										<span class="count" style="font-size: 50px;">${dashBoard.todaysOrdTotAndCount.orderTotal}</span>
									</h4>
									<p style="font-size: 18px; font-weight: bold; color: white;">
										<font color="white"><spring:message code="label.orderTotal" /><!-- Order Total --></font>
									</p>

								</div>
								
							</div>
						</div>
						


						<div class="col-sm-6 col-lg-4" onclick="showTodaysOrder(${dashBoard.todaysSpOrdTotAndCount.orderCount})" style="cursor: pointer;">
							<div class="card text-white bg-flat-color-2">
								<div class="card-body pb-0" align="center">

									<h4 class="mb-0">
										<span class="count" style="font-size: 50px;">${dashBoard.todaysSpOrdTotAndCount.orderCount}</span>
									</h4>
									<p style="font-size: 18px; font-weight: bold; color: white;">
										<font color="white"><spring:message code="label.spOrder" /><!-- Special Order --></font>
									</p>

								</div>
							</div>
						</div>

					</div>

					<div class="col-xs-12 col-sm-12">

						<div class="col-sm-6 col-lg-4" onclick="showNoOrderHub()" style="cursor: pointer;">
							<div class="card text-white bg-flat-color-3">
								<div class="card-body pb-0" align="center">

									<h4 class="mb-0">
										<span class="count" style="font-size: 50px;">${noOrderHubCount}</span>
									</h4>
									<p style="font-size: 18px; font-weight: bold; color: white;">
										<font color="white"><spring:message code="label.noOrder" /><!-- No Orders Hub --></font>
									</p>

								</div>
							</div>
						</div>



						<div class="col-sm-6 col-lg-4" onclick="showTodaysOrder(${dashBoard.todaysOrderPending.orderCount})" style="cursor: pointer;">
							<div class="card text-white bg-flat-color-3">
								<div class="card-body pb-0" align="center">

									<h4 class="mb-0">
										<span class="count" style="font-size: 50px;">${dashBoard.todaysOrderPending.orderCount}</span>
									</h4>
									<p style="font-size: 18px; font-weight: bold; color: white;">
										<font color="white"><spring:message code="label.orderFwdPend" /><!-- Order Forward Pending --></font>
									</p>

								</div>
							</div>
						</div>

							<div class="col-sm-6 col-lg-4" onclick="getHub()" style="cursor: pointer;">
							<div class="card text-white bg-flat-color-3">
								<div class="card-body pb-1" align="center">
									<input type="text" id="hub" name="hub"
										style="color: red; width: 100%;" value="0" onchange="getHub1()"
										title="Search by mob no or hub name"
										placeholder="<spring:message code="label.hubsName" />/ <spring:message code="label.contactNo" />">

									<h4 class="mb-0">
										<span style="font-size: 20px;"><spring:message code="label.findHub" /> &nbsp;<spring:message code="label.hubsName" />/ <spring:message code="label.contactNo" /><!-- Find Hub --></span>
									</h4>
									<p style="font-size: 18px; font-weight: bold; color: white;">
										<font color="white"></font>
									</p>

								</div>
							</div>
						</div>



					</div>


					<div class="col-xs-12 col-sm-12">
						<div class="card">
							<div class="card-header">
								<strong><!-- Hub And Order Total --><spring:message code="label.hubOrderTotal" /></strong>
							</div>
							<div class="card-body card-block">

								<div id="columnchart_material"></div>

							</div>
						</div>
					</div>


					<div class="col-xs-12 col-sm-12">
						<div class="card">
							<div class="card-header">
								<strong><!-- Category And Order Qty --><spring:message code="label.catAndQty" /></strong>
							</div>
							<div class="card-body card-block">

								<div id="columnchart_material2"></div>

							</div>
						</div>
					</div>



					<div class="col-xs-12 col-sm-12">
						<div class="card">
							<div class="card-header">
								<strong><!-- Categorywise Trend --><spring:message code="label.catTrend" /></strong>
							</div>
							<div class="card-body card-block">


								<div id="linechart_material"></div>

							</div>
						</div>
					</div>



				</div>
			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>


	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/chart-js/Chart.bundle.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/dashboard.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/widgets.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/vector-map/jquery.vmap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/vector-map/jquery.vmap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/vector-map/jquery.vmap.sampledata.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/vector-map/country/jquery.vmap.world.js"></script>
	
	<script>
		(function($) {
			"use strict";

			jQuery('#vmap').vectorMap({
				map : 'world_en',
				backgroundColor : null,
				color : '#ffffff',
				hoverOpacity : 0.7,
				selectedColor : '#1de9b6',
				enableZoom : true,
				showTooltip : true,
				values : sample_data,
				scaleColors : [ '#1de9b6', '#03a9f5' ],
				normalizeFunction : 'polynomial'
			});
		})(jQuery);
	</script>
	
<script>
    function googleTranslateElementInit() {
        new google.translate.TranslateElement({
            pageLanguage: 'en,mr', 
            includedLanguages: 'mr,en', 
            layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
            autoDisplay: false
        }, 'google_translate_element');
        var a = document.querySelector("#google_translate_element");
        a.selectedIndex=1;
        a.dispatchEvent(new Event('change'));
        
        $('.google_translate_element').each(function(){
            id=$(this).data('label-for');
            $('#'+id).val( $(this).text() );
         });
        
        
    }
</script>


<script>
		function setData(){ 
			 getChart1(); 
			 getChart2(); 
			 getChart3();

		
		}
	</script>


	<script>
		function getChart1() {
alert("c1");
			google.charts.load('current', {
				'packages' : [ 'bar' ]
			});
			google.charts.setOnLoadCallback(drawChart1);

			function drawChart1() {
				$.getJSON('${getHubLatesOrdersForGraph}', {

					ajax : 'true'

				},
						function(jsonData) {
							var data = new google.visualization.DataTable();

							data.addColumn('string', 'Hub');
							data.addColumn('number', 'Order1');
							data.addColumn('number', 'Order2');
							data.addColumn('number', 'Order3');

							var lan = ${langSelected};
							//alert(lan);
							if (lan == 0) {
								$.each(jsonData, function(i, obj) {

									data.addRow([ obj.hubEngName, obj.order1,
											obj.order2, obj.order3 ]);
								});
							} else {

								$.each(jsonData, function(i, obj) {

									data.addRow([ obj.hubMarName, obj.order1,
											obj.order2, obj.order3 ]);
								});

							}

							var options = {
								title : '',
								is3D : true
							};
							var chart = new google.charts.Bar(document
									.getElementById('columnchart_material'));

							chart.draw(data, google.charts.Bar
									.convertOptions(options));

						});
			}

		}
	</script>



	<script>
		function getChart2() {
			alert("Hi");

			google.charts.load('current', {
				'packages' : [ 'bar' ]
			});
			google.charts.setOnLoadCallback(drawChart2);

			function drawChart1() {
				$.getJSON('${getCatOrdQty}', {

					ajax : 'true'

				},
						function(jsonData) {
							var data = new google.visualization.DataTable();

							data.addColumn('string', 'Category');
							data.addColumn('number', 'Order Qty');
							var lan = ${langSelected};
							//alert(lan);
							if (lan == 0) {
								$.each(jsonData, function(i, obj) {

									data
											.addRow([ obj.catEngName,
													obj.orderQty ]);
								});
							} else {

								$.each(jsonData, function(i, obj) {

									data
											.addRow([ obj.catMarName,
													obj.orderQty ]);
								});

							}


							var options = {
								title : '',
								is3D : true
							};
							var chart = new google.charts.Bar(document
									.getElementById('columnchart_material2'));

							chart.draw(data, google.charts.Bar
									.convertOptions(options));

						});
			}

		}
	</script>
	
	<script>
		function getChart3() {

			google.charts.load('current', {
				'packages' : [ 'line' ]
			});
			google.charts.setOnLoadCallback(drawChart3);

			function drawChart3() {
				$.getJSON('${getCatwiseTrend}', {

					ajax : 'true'

				}, function(jsonData) {

					var data = new google.visualization.DataTable();
					data.addColumn('string', 'Day');
					//data.addColumn('number', 'Cat 1');
    					

					$.each(jsonData.catList, function(k, obj) {
						catName=obj.catEngName;
						//alert(i);
						data.addColumn('number', obj.catEngName);
				});
	                data.addRows(jsonData.orderList.length);
	                 
					$.each(jsonData.orderList, function(i, o) {
						data.setCell(i,0,o.date);
					//alert("i "+i);
						$.each(o.orderQty, function(j, q) {
							//alert("j "+j);
							data.setCell(i,j+1,q.toString());
					
						});
						
						});
					
					//alert(JSON.stringify(data));
					var options = {
							chart : {
								title : '',
								subtitle : '',
						
								chartArea:{left:0,top:0,width:"100%",height:"100%"}
							 
								
							}
				
						};

						var chart = new google.charts.Line(document
								.getElementById('linechart_material'));

						chart.draw(data, google.charts.Line.convertOptions(options));
					

				});
			}

		}
	</script>


	<script type="text/javascript">
		function getHub() {

			var hub = document.getElementById("hub").value;
			
			if(hub==0){
				
			}
			else
			if(hub==null || hub==""){
				alert("Please enter mobile no or hub name");
				document.getElementById("hub").focus();
				
				$('#hub').addClass('MyClass');
			}
			else if(hub!=0){
				$("#hub").val("0");
			window.open('${pageContext.request.contextPath}/searchHub/'+hub);
			}

		}
		function showTodaysOrder(count){
			
			if(count>0){
			
			window.open('${pageContext.request.contextPath}/showHubOrders',"_self");
			}
		}
		function showNoOrderHub(){
			
			window.open('${pageContext.request.contextPath}/showTodaysNoOrderHub',"_self");
		}
		
	</script>

</body>
</html>
