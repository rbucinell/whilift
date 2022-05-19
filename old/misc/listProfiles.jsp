<%@ page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:directive.include file="/WEB-INF/sitemesh-decorators/include.jsp"/>
<html>
	<head>
		<title>List Lifter Profiles</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.marcopolo.min.js"></script>
	
		<script type="text/javascript">
		$(document).ready(function() {
			$('#lastNameSubstring').marcoPolo({
				  url: "${pageContext.request.contextPath}/profile/getMinimalProfileData",
				  param: 'lastNameSubstring',
				  minChars: 3,
				  formatItem: function (data, $item) {
				    return "<a href=${pageContext.request.contextPath}/profile/viewProfile?whyiliftId=" + data.ipowerliftId + " target='_blank'>"+ data.lastNameFirstName +'</a>';
				  },
				  onSelect: function (data, $item) {
				    //window.location = data.profile_url;
			  }
			});
		});
		</script>
	
	</head>
	<body>
		<div id="contentarea" >
			<div id="contentxxx">
				<br>
				<h1>Lifter Profiles</h1>
				<h4>Click on Images to view profile.</h4>
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=A&">A</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=B&">B</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=C&">C</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=D&">D</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=E&">E</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=F&">F</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=G&">G</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=H&">H</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=I&">I</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=J&">J</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=K&">K</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=L&">L</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=M&">M</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=N&">N</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=O&">O</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=P&">P</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=Q&">Q</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=R&">R</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=S&">S</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=T&">T</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=U&">U</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=V&">V</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=W&">W</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=X&">X</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=Y&">Y</a>&nbsp;
				<a href="${pageContext.request.contextPath}/profile/showProfiles?lastNameSubString=Z&">Z</a>&nbsp;
				<br>
				<br>
				<div>Lastname Search (3 characters minimum): <input type="text"  id="lastNameSubstring" name="lastNameSubstring" value=""></div>
				
				<div id="ajaxResp"></div>		
				
				<div id="tablewrapper">
					<table id="listTable" cellpadding="0" cellspacing="0" >
						<tbody>
							<c:if test="${empty profileRegs}">
								<tr>
									<td colspan="3" nowrap="nowrap" class="profileRecords">
										No Profiles found matching selection criteria.
									</td>
								</tr>
							</c:if>
							<c:forEach items="${profileRegs}" var="current" varStatus="i">
								<c:choose>
									<c:when test="${(i.count) % 2 == 0}">
					    				<c:set var="rowclass" value="roweven_summary"/>
									</c:when>
									<c:otherwise>
					    				<c:set var="rowclass" value="rowodd_summary"/>
									</c:otherwise>
								</c:choose>	
							<tr>
								<td nowrap="nowrap" class="profileBio">
									<a title="View" href="${pageContext.request.contextPath}/profile/viewProfile?whyiliftId=${current.ipowerliftId}&">
									   <img alt="Click to view profile" src="${current.profilePrimaryThumbnailURL}" height="100px" width="120px" />
									</a>	
								</td>
								<td nowrap="nowrap" class="profileBio">
									<table cellpadding="0" cellspacing="0">
										<tbody>
											<tr class="${rowclass}">
												<td style="font-weight:bold;" nowrap="nowrap" class="profileRecords" colspan="2">
													${current.person.lastName}, ${current.person.firstName}
												</td>
												<td nowrap="nowrap" class="profileRecords">
													<c:out value="${profileReg.getCodeDesc(current.person.gender,GenderList) }"/>
												</td>
											</tr>
											<tr class="${rowclass}">
												<td nowrap="nowrap" class="profileRecords">
													Height: <fmt:formatNumber type="number" maxFractionDigits="0" value="${current.person.height}"/>
													<c:out value="${profileReg.getCodeDesc(current.person.heightUnitsCode,HeightUnitsCodeList) }"/>&nbsp;&nbsp;
												</td>
												<td nowrap="nowrap" class="profileRecords">
													Weight:  <fmt:formatNumber type="number" maxFractionDigits="0" value="${current.person.weight}"/>
													<c:out value="${profileReg.getCodeDesc(current.person.weightUnitsCode,WeightUnitsCodeList) }"/>&nbsp;&nbsp;
												</td>
												<td nowrap="nowrap" class="profileRecords">
													Years Lifting Experience: <fmt:formatNumber value="${current.lifter.experienceLifting}"/>&nbsp;&nbsp;
												</td>
												
											</tr>
											<tr class="${rowclass}">
												<td nowrap="nowrap" class="profileRecords" colspan="2">
													Nationality  : 
													<c:out value="${profileReg.getCodeDesc(current.person.nationality,NationalityList) }"/>
												</td>
												<td nowrap="nowrap" class="profileRecords">
													Federation  : 
													<c:out value="${profileReg.getCodeDesc(current.lifter.federationCode,FederationsList) }"/>
												</td>
											</tr>
										</tbody>
									</table>	
								</td>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>