<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Product</title>


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
		control.makeTransliteratable([ "itemMr" ]);
		var keyVal = 32; // Space key
		$("#itemEng")
				.on(
						'keydown',
						function(event) {
							if (event.keyCode === 32) {
								var engText = $("#itemEng").val() + " ";
								var engTextArray = engText.split(" ");
								$("#itemMr")
										.val(
												$("#itemMr").val()
														+ engTextArray[engTextArray.length - 2]);

								document.getElementById("itemMr").focus();
								$("#itemMr").trigger({
									type : 'keypress',
									keyCode : keyVal,
									which : keyVal,
									charCode : keyVal
								});
							}

							else if ((event.keyCode === 8 || event.keyCode === 46)) {
								$("#itemMr").val("");

								$("#itemEng").val("");
							}
						});

		$("#itemMr").bind("keyup", function(event) {
			setTimeout(function() {
				$("#itemEng").val($("#itemEng").val() + " ");
				document.getElementById("itemEng").focus()
			}, 0);
		});

		control.makeTransliteratable([ "itemDescMr" ]);
		var keyVal = 32; // Space key
		$("#itemDescEng")
				.on(
						'keydown',
						function(event) {
							if (event.keyCode === 32) {
								var engText = $("#itemDescEng").val() + " ";
								var engTextArray = engText.split(" ");
								$("#itemDescMr")
										.val(
												$("#itemDescMr").val()
														+ engTextArray[engTextArray.length - 2]);

								document.getElementById("itemDescMr").focus();
								$("#itemDescMr").trigger({
									type : 'keypress',
									keyCode : keyVal,
									which : keyVal,
									charCode : keyVal
								});
							}

							else if ((event.keyCode === 8 || event.keyCode === 46)) {
								$("#itemDescMr").val("");

								$("#itemDescEng").val("");
							}
						});

		$("#itemDescMr").bind("keyup", function(event) {
			setTimeout(function() {
				$("#itemDescEng").val($("#itemDescEng").val() + " ");
				document.getElementById("itemDescEng").focus()
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
							<strong> <spring:message code="label.addNewItem" /></strong>
							
								&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
														
						<a	href="${pageContext.request.contextPath}/showItemList"><strong><spring:message
									code="label.itemList" /></strong></a>
						</div>
						<div class="card-body card-block">
							<form action="${pageContext.request.contextPath}/insertItem"
								method="post" enctype="multipart/form-data">
								<input type="hidden" name="item_id" id="item_id" value="${editItem.itemId}">

								<div class="form-group"></div>
								<div class="row">
								<div class="col-md-2">
									<spring:message code="label.itemCategory" />
									</div>
									<div class="col-md-4">
									<spring:message code="label.itemCategory" var="selCat" />
									
										<select data-placeholder="${selCat}" class="standardSelect"
											tabindex="1" name="item_cat" id="item_cat"
											oninvalid="setCustomValidity('Please Select Category ')"
											onchange="try{setCustomValidity('')}catch(e){}">

											<c:forEach items="${catList}" var="cat">
												<c:choose>
													<c:when test="${langSelected == 0}">
														<c:choose>
															<c:when test="${editItem.catId==cat.catId}">
																<option value="${cat.catId}" selected>${cat.catEngName}</option>

															</c:when>
															<c:otherwise>
														<option value="${cat.catId}">${cat.catEngName}</option>

															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
													
													<c:choose>
															<c:when test="${editItem.catId==cat.catId}">
																<option value="${cat.catId}" selected>${cat.catMarName}</option>

															</c:when>
															<c:otherwise>
														<option value="${cat.catId}">${cat.catMarName}</option>

															</c:otherwise>
														</c:choose>
														
													</c:otherwise>
												</c:choose>
											</c:forEach>





										</select> <span class="error" aria-live="polite"></span>

									</div>
								<!-- </div>//prev end of row

								<div class="form-group"></div> -->
								<div class="col-md-2">
									<spring:message code="label.selectHsnCode" />
									</div>
									<spring:message code="label.selectHsnCode" var="selHsn" />
									<div class="col-md-4">
										<select data-placeholder="${selHsn}" name="item_hsn"
											id="item_hsn" class="standardSelect" tabindex="1"
											oninvalid="setCustomValidity('Please Select HSN Code ')"
											onchange="try{setCustomValidity('')}catch(e){}">
											<c:forEach items="${iHsnList}" var="hsn">

												<c:choose>
													<c:when test="${editItem.itemHsnId==hsn.itemHsnId}">

														<option selected value="${hsn.itemHsnId}">${hsn.itemHsnCode}</option>

													</c:when>
													<c:otherwise>
														<option value="${hsn.itemHsnId}">${hsn.itemHsnCode}</option>

													</c:otherwise>

												</c:choose>
											</c:forEach>


										</select> <span class="error" aria-live="polite"></span>

									</div>
								</div>

								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.catEngName" />
									<div class="input-group">
										<input class="form-control" name="itemEng" id="itemEng"
											type="text" required value="${editItem.itemEngName}"
											oninvalid="setCustomValidity('Please enter name ')"
											onchange="try{setCustomValidity('')}catch(e){}" autocomplete="off" /> <span
											class="error" aria-live="polite"></span>

									</div>
								</div>

								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.catMarName" />
									<div class="input-group">
										<input class="form-control" name="itemMr" id="itemMr"
											type="text" required value="${editItem.itemMarName}"
											oninvalid="setCustomValidity('Please enter name ')"
											onchange="try{setCustomValidity('')}catch(e){}" autocomplete="off" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>

								<div class="form-group">
									<spring:message code="label.itemDescEng" />
									<div class="input-group">
										<input class="form-control" name="itemDescEng"
											id="itemDescEng" type="text" required
											value="${editItem.itemEngDesc}"
											oninvalid="setCustomValidity('Please enter name ')"
											onchange="try{setCustomValidity('')}catch(e){}" autocomplete="off"/> <span
											class="error" aria-live="polite"></span>

									</div>
								</div>

								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.itemDescMr" />
									<div class="input-group">
										<input class="form-control" name="itemDescMr" id="itemDescMr"
											type="text" required value="${editItem.itemMarDesc}"
											oninvalid="setCustomValidity('Please enter name ')"
											onchange="try{setCustomValidity('')}catch(e){}" autocomplete="off" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>

								<div class="row">
								<div class="col-md-2">
									<spring:message code="label.itemRate" />
									</div>
									<div class="col-md-4">
										<input class="form-control" name="item_rate" id="item_rate"
											type="text" required value="${editItem.itemRate}"
											oninvalid="setCustomValidity('Please enter rate ')" onblur="checkMrp()"
											onchange="try{setCustomValidity('')}catch(e){}" pattern="[0-9]+(\.[0-9]{0,2})?%?"  /> <span
											class="error" aria-live="polite"></span>

									</div>

								<div class="col-md-2">
									<spring:message code="label.itemMrp" />
								</div>
									<div class="col-md-4">
										<input class="form-control" name="item_mrp" id="item_mrp"
											type="text" required value="${editItem.itemMrp}"
											oninvalid="setCustomValidity('Please enter Mrp ')" onblur="checkMrp()"
											onchange="try{setCustomValidity('')}catch(e){}"  pattern="[0-9]+(\.[0-9]{0,2})?%?" /> <span
											class="error" aria-live="polite"></span>

									</div>
								</div>

								<div class="form-group"></div>
								<div class="row">
								<div class="col-md-2">
									<spring:message code="label.UOM" />
									</div>
									<spring:message code="label.UOM" var="selUom" />
									<div class="col-md-4">
										<select data-placeholder="${selUom}" class="standardSelect"
											tabindex="1" name="item_uom" id="item_uom"
											oninvalid="setCustomValidity('Please Select UOM ')"
											onchange="try{setCustomValidity('')}catch(e){}">

											<c:forEach items="${uomList}" var="uom">
												<c:choose>

													<c:when test="${editItem.itemUomId==uom.uomId}">
														<option selected value="${uom.uomId}">${uom.uomName}</option>
													</c:when>

													<c:otherwise>
														<option value="${uom.uomId}">${uom.uomName}</option>
													</c:otherwise>

												</c:choose>


											</c:forEach>

										</select> <span class="error" aria-live="polite"></span>

									</div>
								
								<div class="col-md-2">
									<spring:message code="label.weight" />
									</div>
									<div class="col-md-4">
										<input class="form-control" value="${editItem.itemWt}"
											name="item_weight" id="item_weight" type="text" required
											oninvalid="setCustomValidity('Please enter Weight ')"
											onchange="try{setCustomValidity('')}catch(e){}" 
											/> <span
											class="error" aria-live="polite"></span>

									</div>
								</div>
								<input type="hidden" name="prevImage" id="prevImage" value="${editItem.itemPic}">

								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.catPhoto" />
									<div class="input-group">
										<input type='file' id="imgInp" name="imgInp" value="" /> <img
											id="item_image" name="item_image"
											src="${imgUrl}${editItem.itemPic}" alt=""
											style="width: 100px; height: 100px" align="top" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>

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
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#item_image').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#imgInp").change(function() {
			readURL(this);
		});
	</script>
	
	<script type="text/javascript">
	
	function checkMrp(){
		
		//alert("Hio ");
		
		var rate=document.getElementById("item_rate").value;
		
		var mrp=document.getElementById("item_mrp").value;
		
		if(rate>0){
		if(rate>mrp){
			
			alert("Distributor price  can not be greater than MRP");
			document.getElementById("item_mrp").value="0";
		}
		}
		//alert("Rate " +rate + "Mrp " +mrp);

	}
	
	</script>


</body>
</html>