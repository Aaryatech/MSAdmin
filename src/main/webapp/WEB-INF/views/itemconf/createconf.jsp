<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Configuration</title>


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

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- DatePicker -->
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<script>
	$(function() {
		$("#datepicker-12").datepicker();
	});
</script>

<!-- DatePicker -->

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
		control.makeTransliteratable([ "confMr" ]);
		var keyVal = 32; // Space key
		$("#confEng")
				.on(
						'keydown',
						function(event) {
							if (event.keyCode === 32) {
								var engText = $("#confEng").val() + " ";
								var engTextArray = engText.split(" ");
								$("#confMr")
										.val(
												$("#confMr").val()
														+ engTextArray[engTextArray.length - 2]);

								document.getElementById("confMr").focus();
								$("#confMr").trigger({
									type : 'keypress',
									keyCode : keyVal,
									which : keyVal,
									charCode : keyVal
								});
							}

							else if ((event.keyCode === 8 || event.keyCode === 46)) {
								$("#confMr").val("");

								$("#confEng").val("");
							}
						});

		$("#confMr").bind("keyup", function(event) {
			setTimeout(function() {
				$("#confEng").val($("#confEng").val() + " ");
				document.getElementById("confEng").focus()
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
							<strong> <spring:message code="label.addConf" /></strong>
						</div>
						<div class="card-body card-block">
							<form action="${pageContext.request.contextPath}/insertItemConf"
								method="post" enctype="multipart/form-data">
								<input type="hidden" name="conf_id" id="conf_id" value="0">
								
								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.catEngName" />
									<div class="input-group">
										<input class="form-control" name="confEng" id="confEng"
											type="text" required 
											oninvalid="setCustomValidity('Please enter name ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>

									</div>
								</div>

								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.catMarName" />
									<div class="input-group">
										<input class="form-control" name="confMr" id="confMr"
											type="text" required value=""
											oninvalid="setCustomValidity('Please enter name ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>

								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.item" />
									<div class="input-group">
										<select data-placeholder="" class="standardSelect" multiple
											tabindex="1" name="items[]" id="items[]"
											oninvalid="setCustomValidity('Please Select Items')"
											onchange="try{setCustomValidity('')}catch(e){}">

											<c:forEach items="${itemList}" var="iList">
												<c:choose>
													<c:when test="${langSelected == 0}">
														<c:choose>
															<c:when test="${editItem.itemId==iList.itemId}">
																<option value="${iList.itemId}" selected>${iList.itemEngName}</option>

															</c:when>
															<c:otherwise>
														<option value="${iList.itemId}">${iList.itemEngName}</option>

															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
													
													<c:choose>
															<c:when test="${editItem.itemId==iList.itemId}">
																<option value="${iList.itemId}" selected>${iList.itemMarName}</option>

															</c:when>
															<c:otherwise>
														<option value="${iList.itemId}">${iList.itemMarName}</option>

															</c:otherwise>
														</c:choose>
														
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select> <span class="error" aria-live="polite"></span>

									</div>
								</div>
								
								
								
								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.confType" />
									<div class="input-group">
										<select  class="standardSelect"
											name="conf_type" id="conf_type" onchange="showDiv(this.value)">
											
											<option selected value="1"><spring:message code="label.dateBasis" /></option>
											<option value="2"><spring:message code="label.dayBasis" /></option>
											<option value="3"><spring:message code="label.dailyBasis" /></option>
										</select> <span class="error" aria-live="polite"></span>
									</div>
								</div>
								
								
								
								
								<div class="form-group"></div>
								<div class="form-group" id="dayDiv" style="display: none">
									<spring:message code="label.selDays" />
									<div class="input-group">
										<select  class="standardSelect" multiple
											name="days[]" id="days[]"
											oninvalid="setCustomValidity('Please Select Days')"
											onchange="try{setCustomValidity('')}catch(e){}">
											<option  value="1">Monday</option>
											<option value="2">Tuesday</option>
											<option value="3">Wednesday</option>
											<option value="4">Thursday</option>
											<option value="5">Friday</option>
											<option value="6">Saturday</option>
											<option value="7">Sunday</option>
										</select> <span class="error" aria-live="polite"></span>
									</div>
								</div>
								
								<div class="form-group"></div>
								<div class="form-group" id="dateDiv">
									<spring:message code="label.selDate"  />
									<div class="input-group">
										<input type="text" id="datepicker-12"  value="0" required oninvalid="setCustomValidity('Please Select Date ')"
											onchange="try{setCustomValidity('')}catch(e){}"   name="date" class="form-control"> <span class="error" aria-live="polite"></span>
									</div>
								</div>
								
								<%-- <div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.disFromTime" />
									<div class="input-group">
										<input class="form-control" name="disFTime" id="disFTime"
											type="time" required value=""
											oninvalid="setCustomValidity('Please enter time ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
								 --%>
								<div class="form-group"></div>
								<div class="form-group">
									
									<div class="col-md-2"><spring:message code="label.disFromTime" /></div>
									<div class="col-md-3">	<input class="form-control" name="disFTime" id="disFTime"
											type="time" required value=""
											oninvalid="setCustomValidity('Please enter time ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
									<div class="col-md-2"><spring:message code="label.disToTime" /></div>
								<div class="col-md-3">	<input class="form-control" name="disTTime" id="disTTime"
											type="time" required value=""
											oninvalid="setCustomValidity('Please enter time ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
											</div>
								</div>
									<br></br>
								
								<div class="form-group"></div>
								<div class="form-group">
									
									<div class="col-md-2"><spring:message code="label.hubFromTime" /></div>
									<div class="col-md-3">	<input class="form-control" name="hubFTime" id="hubFTime"
											type="time" required value=""
											oninvalid="setCustomValidity('Please enter time ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
									<div class="col-md-2"><spring:message code="label.hubToTime" /></div>
								<div class="col-md-3">	<input class="form-control" name="hubTTime" id="hubTTime"
											type="time" required value=""
											oninvalid="setCustomValidity('Please enter time ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
											</div>
								</div>
									<br></br>
								
								
								
								<div class="col-lg-12" align="center">

									<button type="submit" class="btn btn-primary"
										style="align-content: center; width: 226px; margin-left: 80px;">
										<spring:message code="label.submit" />
									</button>
								</div>

							</form>
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
		src="${pageContext.request.contextPath}/resources/assets/js/lib/chosen/chosen.jquery.min.js"></script>

	<script>
		jQuery(document).ready(function() {
			jQuery(".standardSelect").chosen({
				disable_search_threshold : 10,
				no_results_text : "Oops, nothing found!",
				width : "100%"
			});
		});
		
		
	</script>
	<script type="text/javascript">
	
	function showDiv(type){
		if(type==1){
			document.getElementById('dateDiv').style.display = "block";
			document.getElementById('dayDiv').style = "display:none";
		}
		else if(type==2){
			document.getElementById('dateDiv').style = "display:none";
			document.getElementById('dayDiv').style.display = "block";
		}else{
			document.getElementById('dayDiv').style = "display:none";
			document.getElementById('dateDiv').style = "display:none";
		}

	}
	
	</script>
	
	


</body>
</html>