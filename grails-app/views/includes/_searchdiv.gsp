<div style='float: left; width: 20%; min-height: 500px; background-color: #c0c0c0;'>

    <g:set var="theID" value="${999}"/>
    <g:set var="firstNumber" value="${5}"/>
    <g:set var="secondNumber" value="${7}"/>

    <g:remoteLink controller="employee" action="updateEmployee"
                  update="mainContent">updateEmployee</g:remoteLink><br/>

    <g:remoteLink controller="employee" action="renderString"
                  update="mainContent">Render String</g:remoteLink><br/>

    <g:remoteLink controller="employee" action="withIdParam" id="${theID}"
                  update="mainContent">With ID Parameter</g:remoteLink><br/>

    <g:remoteLink controller="employee" action="withCustomParam"
                  params="${[a:firstNumber,     b:secondNumber]}"
                  update="mainContent">With Custom Parameter</g:remoteLink><br/>


    <button onclick=
            "<g:remoteFunction controller="employee" action="renderString" update="mainContent"/>
            ">Remote Function</button>

    <g:submitToRemote url="[controller:'employee', action:'renderString']" update="mainContent" value="SubmitToRemote"/>

</div>
<div id="mainContent" style='float: right; width: 80%; min-height: 500px; background-color: #c0ffc0;'>
    <g:render template="empList"/>
</div>

<p>This is the main content</p>
</div>