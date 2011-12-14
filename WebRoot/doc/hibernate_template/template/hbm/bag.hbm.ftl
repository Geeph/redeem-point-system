<#assign value = property.value>
<#assign keyValue = value.getKey()>
<#assign elementValue = value.getElement()>
<#assign elementTag = c2h.getCollectionElementTag(property)>

	<bag name="${property.name}" table="${value.collectionTable.quotedName}" inverse="${value.inverse?string}"
	lazy="${c2h.getCollectionLazy(value)}"
	<#if property.cascade != "none">
        cascade="${property.cascade}"
	</#if>
	<#if c2h.hasFetchMode(property)> fetch="${c2h.getFetchMode(property)}"</#if>
	<#if elementValue.columnIterator?exists && elementValue.columnIterator.hasNext()> order-by="${elementValue.columnIterator.next().quotedName} asc"></#if>
	 <#assign metaattributable=property>
	 	<#include "meta.hbm.ftl">
 		<#include "key.hbm.ftl">
		<#include "${elementTag}-element.hbm.ftl">

     	</bag>