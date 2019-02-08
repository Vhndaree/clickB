<%--
  Created by IntelliJ IDEA.
  User: vhndaree
  Date: 2/8/19
  Time: 1:09 PM
--%>


<g:if test="${search.size()<1}">
    <li>The product you search is currently not available.</li>
</g:if>
<g:else>

    <g:each in="${search}" var="searchItem">
        <li>
            <g:link controller="product" action="productShow" id="${searchItem.id}">
                ${searchItem.productName}
            </g:link>
        </li>
    </g:each>
</g:else>