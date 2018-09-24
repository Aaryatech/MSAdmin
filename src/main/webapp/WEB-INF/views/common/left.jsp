
<aside id="left-panel" class="left-panel">
	<nav class="navbar navbar-expand-sm navbar-default">
		<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

		<div class="navbar-header">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#main-menu" aria-controls="main-menu"
				aria-expanded="false" aria-label="Toggle navigation">
				<i class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand" href="#"> <spring:message
					code="label.msWebPanel" />
			</a> <a class="navbar-brand hidden" href="./"> H</a>
		</div>

		<div id="main-menu" class="main-menu collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/home"> <i
						class="menu-icon fa fa-dashboard"></i> <spring:message
							code="label.dashboard" />
				</a></li>


				<!--                     <h3 class="menu-title">UI elements</h3>/.menu-title
 -->
				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="true"> <i class="menu-icon fa fa-table"></i> <spring:message
							code="label.masters" />
				</a>
					<ul class="sub-menu children dropdown-menu ">
						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showAddCat"><spring:message
									code="label.addNewCategory" /></a></li>

						<%-- <li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showAddItem"><spring:message
									code="label.addNewItem" /></a></li> --%>


						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showItemList"><spring:message
									code="label.itemList" /></a></li>

						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showAddItemHsn"><spring:message
									code="label.addHsnCode" /></a></li>



						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showAddUom"><spring:message
									code="label.addUom" /></a></li>
						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showAddMSUser"><spring:message
									code="label.addMsUser" /></a></li>


						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showAddHub"><spring:message
									code="label.addHub" /></a></li>


						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showAddRouteSupervisor"><spring:message
									code="label.addRouteSup" /></a></li>

						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showAddRoute"><spring:message
									code="label.addRoute" /></a></li>


						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showCreateItemConf"><spring:message
									code="label.addConf" /></a></li>

						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showConfList"><spring:message
									code="label.confList" /></a></li>
						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showAssignConf"><spring:message
									code="label.assignConf" /></a></li>


						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showAddDriver"><spring:message
									code="label.addDriver" /></a></li>
						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showAddVehicle"><spring:message
									code="label.addVehicle" /></a></li>
					</ul></li>



				<%-- <li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showStartDistri"><spring:message
									code="label.startDist" /></a></li> --%>







				<!--Route Allocation   -->




				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="true"> <i class="menu-icon fa fa-table"></i> <spring:message
							code="label.routeAllocation" />
				</a>
					<ul class="sub-menu children dropdown-menu ">

						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showAddRouteAllocation"><spring:message
									code="label.routeAllocation" /></a></li>

						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showAllocatedRoute"><spring:message
									code="label.alcrtlist" /></a></li>

					</ul></li>
				<!--  end Route Allocation -->





				<li class="menu-item-has-children dropdown"><a
					href="${pageContext.request.contextPath}/showAddNotif"> <i
						class="menu-icon fa fa-table"></i> <spring:message
							code="label.addNotif" />
				</a></li>

				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="true"> <i class="menu-icon fa fa-table"></i> <spring:message
							code="label.order" />
				</a>
					<ul class="sub-menu children dropdown-menu ">

						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showHubOrders"><spring:message
									code="label.orList" /></a></li>

						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showOrderHistory"><spring:message
									code="label.ordHistory" /></a></li>
					</ul></li>




				<!-- Production -->


				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="true"> <i class="menu-icon fa fa-table"></i> <spring:message
							code="label.prod" />
				</a>
					<ul class="sub-menu children dropdown-menu ">

						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showHubOrders"><spring:message
									code="label.startProd" /></a></li>

						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showOrderProd"><spring:message
									code="label.viewProd" /></a></li>
					</ul></li>

				<!--start dist  -->

				<%-- 		
							<li class="menu-item-has-children dropdown"><a href="${pageContext.request.contextPath}/showStartDistri"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="true"> <i class="menu-icon fa fa-table"></i> <spring:message
							code="label.startDist" /></a> --%>



				<li class="menu-item-has-children dropdown"><a
					href="${pageContext.request.contextPath}/showStartDistri"> <i
						class="menu-icon fa fa-table"></i> <spring:message
							code="label.startDist" />
				</a></li>

				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="true"> <i class="menu-icon fa fa-table"></i> <spring:message
							code="label.report" />
				</a>
					<ul class="sub-menu children dropdown-menu ">


						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showHubReport"><spring:message
									code="label.hubReport" /></a></li>

						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showItemwiseHubReport"><spring:message
									code="label.itemReport" /></a></li>


						<li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showCatwiseHubReport"><spring:message
									code="label.catReport" /></a></li>





					</ul></li>

			</ul>




			<!-- 	<h3 class="menu-title">Icons</h3>
				/.menu-title

				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>Icons
				</a>
					<ul class="sub-menu children dropdown-menu">
						<li><i class="menu-icon fa fa-fort-awesome"></i><a
							href="font-fontawesome.html">Font Awesome</a></li>
						<li><i class="menu-icon ti-themify-logo"></i><a
							href="font-themify.html">Themefy Icons</a></li>
					</ul></li>
				<li><a href="widgets.html"> <i class="menu-icon ti-email"></i>Widgets
				</a></li>
				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Charts
				</a>
					<ul class="sub-menu children dropdown-menu">
						<li><i class="menu-icon fa fa-line-chart"></i><a
							href="charts-chartjs.html">Chart JS</a></li>
						<li><i class="menu-icon fa fa-area-chart"></i><a
							href="charts-flot.html">Flot Chart</a></li>
						<li><i class="menu-icon fa fa-pie-chart"></i><a
							href="charts-peity.html">Peity Chart</a></li>
					</ul></li>

				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="menu-icon fa fa-area-chart"></i>Maps
				</a>
					<ul class="sub-menu children dropdown-menu">
						<li><i class="menu-icon fa fa-map-o"></i><a
							href="maps-gmap.html">Google Maps</a></li>
						<li><i class="menu-icon fa fa-street-view"></i><a
							href="maps-vector.html">Vector Maps</a></li>
					</ul></li>
				<h3 class="menu-title">Extras</h3>
				/.menu-title
				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>Pages
				</a>
					<ul class="sub-menu children dropdown-menu">
						<li><i class="menu-icon fa fa-sign-in"></i><a
							href="page-login.html">Login</a></li>
						<li><i class="menu-icon fa fa-sign-in"></i><a
							href="page-register.html">Register</a></li>
						<li><i class="menu-icon fa fa-paper-plane"></i><a
							href="pages-forget.html">Forgotten Password</a></li>
					</ul></li>
			</ul> -->
		</div>
		<!-- /.navbar-collapse -->
	</nav>
</aside>
<!-- /#left-panel -->

<!-- Left Panel -->

