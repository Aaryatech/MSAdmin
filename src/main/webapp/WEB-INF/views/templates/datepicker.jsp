<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



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


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/gtranslatepopupblock.css">
	

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
<script type="text/javascript" src="http://www.google.com/jsapi"></script>

<script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
</script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script>
function OnLoad() {                
    var options = {
        sourceLanguage:
        google.elements.transliteration.LanguageCode.ENGLISH,
        destinationLanguage:
        [google.elements.transliteration.LanguageCode.MARATHI],
        shortcutKey: 'ctrl+g',
        transliterationEnabled: true
    };

    var control = new google.elements.transliteration.TransliterationControl(options);
    control.makeTransliteratable(["txtMarathi"]);
    var keyVal = 32; // Space key
    $("#txtEnglish").on('keydown', function(event) {
        if(event.keyCode === 32) {
            var engText = $("#txtEnglish").val() + " ";
            var engTextArray = engText.split(" ");
            $("#txtMarathi").val($("#txtMarathi").val() + engTextArray[engTextArray.length-2]);

            document.getElementById("txtMarathi").focus();
            $("#txtMarathi").trigger ( {
                type: 'keypress', keyCode: keyVal, which: keyVal, charCode: keyVal
            } );
        }
    });

    $("#txtMarathi").bind ("keyup",  function (event) {
        setTimeout(function(){ $("#txtEnglish").val($("#txtEnglish").val() + " "); document.getElementById("txtEnglish").focus()},0);
    });
} //end onLoad function

google.setOnLoadCallback(OnLoad);
</script> 


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/gtranslatepopupblock.css">
	

</head>
	<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>


    <body>
       
       
	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/common/left.jsp"></jsp:include>
	<!-- Left Panel -->


	<!-- Header-->
	<jsp:include page="/WEB-INF/views/common/right.jsp"></jsp:include>
	<!-- Header-->
       
       <div>
       <form method="get" action="translate">
	
 English Text: <input size="40" type="text" id="txtEnglish"/> <br/>
       Marathi Text : <input size="40" type="text" id="txtMarathi" name ="txtMarathi"/> 
       
      <input type="submit" value="submit" />
		
	</form>
	</div>
	
	
	
	
	
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
</body>
</html>