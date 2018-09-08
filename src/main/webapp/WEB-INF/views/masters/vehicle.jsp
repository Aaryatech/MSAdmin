<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Vehicle</title>

<c:url var="getEditVehicle" value="/getEditVehicle" />

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/apple-icon.png">
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
	href="${pageContext.request.contextPath}/resources/assets/css/lib/chosen/chosen.min.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- css for date picker proper UI -->
	



</head>


<!-- Translate -->


<script type="text/javascript" src="http://www.google.com/jsapi"></script>

<script type="text/javascript">
	google.load("elements", "1", {
		packages : "transliteration"
	});
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script>
	function OnLoad() {
		var options = {
			sourceLanguage : google.elements.transliteration.LanguageCode.ENGLISH,
			destinationLanguage : [ google.elements.transliteration.LanguageCode.MARATHI ],
			shortcutKey : 'ctrl+g',
			transliterationEnabled : true
		};

		var control = new google.elements.transliteration.TransliterationControl(
				options);
		control.makeTransliteratable([ "catTxtMarathi" ]);
		var keyVal = 32; // Space key
		$("#catTxtEnglish")
				.on(
						'keydown',
						function(event) {
							if (event.keyCode === 32) {
								var engText = $("#catTxtEnglish").val() + " ";
								var engTextArray = engText.split(" ");
								$("#catTxtMarathi")
										.val(
												$("#catTxtMarathi").val()
														+ engTextArray[engTextArray.length - 2]);

								document.getElementById("catTxtMarathi").focus();
								$("#catTxtMarathi").trigger({
									type : 'keypress',
									keyCode : keyVal,
									which : keyVal,
									charCode : keyVal
								});
							}

							else if ((event.keyCode === 8 || event.keyCode === 46)) {
								$("#catTxtMarathi").val("");

								$("#catTxtEnglish").val("");
							}
						});

		$("#catTxtMarathi").bind("keyup", function(event) {
			setTimeout(function() {
				$("#catTxtEnglish").val($("#catTxtEnglish").val() + " ");
				document.getElementById("catTxtEnglish").focus()
			}, 0);
		});

		

	} //end onLoad function

	google.setOnLoadCallback(OnLoad);
</script>
<!-- Translate -->
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

<body>


	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/common/left.jsp"></jsp:include>
	<!-- Left Panel -->


	<!-- Header-->
	<jsp:include page="/WEB-INF/views/common/right.jsp"></jsp:include>
	<!-- Header-->



	<div class="content mt-3">
		<div class="animated fadeIn">

			<div class="row">

				<div class="col-xs-12 col-sm-12">
					<div class="card">
						<div class="card-header">
							<strong> <spring:message code="label.addVehicle" /></strong>
						</div>
						<div class="card-body card-block">
							<form action="${pageContext.request.contextPath}/insertVehicle"
								method="post" enctype="multipart/form-data">
								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.vehNo" />
									<div class="input-group">
										<input class="form-control" name=veh_no
											id="veh_no" type="text" required
											oninvalid="setCustomValidity('Please enter Vehicle No ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>

									</div>
								</div>
								<input type="hidden" name="vehicle_id" id="vehicle_id" value="0">

			<%-- 					<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.vehOwner" />
									<div class="input-group">
										<select data-placeholder="" class="standardSelect"
											name="usr_role" id="usr_role"
											oninvalid="setCustomValidity('Please Select Vehicle Owner ')"
											onchange="try{setCustomValidity('')}catch(e){}">
													<option value="0"><spring:message code="label.self" /></option>
													<option value="1"><spring:message code="label.contractor" /></option>
										</select> <span class="error" aria-live="polite"></span>
									</div>
								</div>

								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.inServiceFrom" />

									<div class="input-group">
										<input type='date' id="veh_ser_from" name="veh_ser_from" value="0000" />  <span
											class="error" aria-live="polite"></span>
									</div>
								</div> --%>


 <div class="row">
                    <div class="col-lg-4">
                       
                            <div class="card-body text-secondary"><spring:message code="label.vehOwner" />&nbsp;&nbsp;	<select data-placeholder="" class="standardSelect"
											name="veh_owner" id="veh_owner"
											oninvalid="setCustomValidity('Please Select Vehicle Owner ')"
											onchange="try{setCustomValidity('')}catch(e){}">
													<option value="0"><spring:message code="label.self" /></option>
													<option value="1"><spring:message code="label.contractor" /></option>
										</select> <span class="error" aria-live="polite"></span></div>
                       
                    </div>
                    <div class="col-lg-4 ">
                       
                           <div class="card-body text-secondary"> <spring:message code="label.inServiceFrom" />&nbsp;&nbsp;<input type="text" id="veh_ser_from" name="veh_ser_from" value="0000" />  <span
											class="error" aria-live="polite"></span></div>
                        
                    </div>
                    
                     <div class="col-lg-4 ">
                       
                           <div class="card-body text-secondary"> 
									<button type="submit" class="btn btn-primary"
										style="align-content: center; width: 226px;">
										<spring:message code="label.submit" />
									</button>  <span
											class="error" aria-live="polite"></span></div>
                        
                    </div>
                </div>




								<%-- <div class="col-lg-12" align="center">

									<button type="submit" class="btn btn-primary"
										style="align-content: center; width: 226px; margin-left: 80px;">
										<spring:message code="label.submit" />
									</button>
								</div> --%>

							</form>

							<div class="content mt-3">
								<div class="animated fadeIn">
									<div class="row">

										<div class="col-md-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title"><spring:message
															code="label.vehList" /></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th><spring:message code="label.srNo" /></th>
																<th><spring:message code="label.vehNo" /></th>
																<th><spring:message code="label.vehOwner" /></th>
																<th><spring:message code="label.inServiceFrom" /></th>
																<th><spring:message code="label.action" /></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${vehicleList}" var="veh" varStatus="count">
																<tr>

																	<td>${count.index+1}</td>
																	<td>
																			<c:out value="${veh.vehicleNo}" />
																		</td>
																		<td>
																		<c:choose>
																		<c:when test="${veh.vehicleOwnedBy==0}">
																		<spring:message code="label.self" />
																		</c:when>
																		<c:otherwise>
																		<spring:message code="label.contractor" />
																		</c:otherwise>
																		
																		</c:choose></td>
																		
																	<td>${veh.vehicleInServiceFrom}</td>
																	<td><div class="fa-hover col-lg-3 col-md-6">
																			<a href="#" onclick="editVehicle(${veh.vehicleId})"><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																		</div>

																		<div class="fa-hover col-lg-3 col-md-6">
																			<a
																				href="${pageContext.request.contextPath}/deleteVehicle/${veh.vehicleId}"
																				onClick="return confirm('Are you sure want to delete this record');"><i
																				class="fa fa-trash-o"></i></a>
																		</div></td>

																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>





						</div>
					</div>
				</div>
			</div>


		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->

	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- Left Panel -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>


	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/datatables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/jszip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/pdfmake.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/vfs_fonts.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.html5.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.print.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.colVis.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/datatables-init.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/chosen/chosen.jquery.min.js"></script>

	<script>
        jQuery(document).ready(function() {
            jQuery(".standardSelect").chosen({
                disable_search_threshold: 10,
                no_results_text: "Oops, nothing found!",
                width: "100%"
            });
        });
    </script>

	<script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
        } );
    </script>


	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
  $( function() {
	  $('input[id$=veh_ser_from]').datepicker({
		    dateFormat: 'dd-mm-yy'
		});
  } );
  
  $( function() {
	  $('input[id$=to_date]').datepicker({
		    dateFormat: 'dd-mm-yy'
		});
  } );
  </script>
	<script type="text/javascript">
	
	function editVehicle(vehicleId){
		
		//alert(catId);
		
		$.getJSON('${getEditVehicle}',{
			
			vehicleId : vehicleId,
			
			ajax : 'true',

		},
		
		function(data){
			
			$("#veh_no").val(data.vehicleNo);
			document.getElementById("veh_owner").options.selectedIndex =data.vehicleOwnedBy;
			
			//$("#veh_owner").triger("chosen:updated");
			$("#veh_owner").trigger("chosen:updated");
			$("#veh_ser_from").val(data.vehicleInServiceFrom);
			
			
			//hidden field vehicleId
			$("#vehicle_id").val(data.vehicleId);


		});
		
	}
	
	</script>


</body>
</html>