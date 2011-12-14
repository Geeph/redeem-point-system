<#-- // Fields -->
<#foreach field in pojo.getAllPropertiesIterator()>
<#if pojo.getMetaAttribAsBool(field, "gen-property", true)>
    /**
<#if pojo.hasMetaAttribute(field, "field-description")>
     ${pojo.getFieldJavaDoc(field, 0)}
</#if>
<#foreach column in field.columnIterator><#if column.comment?exists && column.comment?trim?length!=0>     * ${column.comment}.
</#if>
</#foreach>
     */
    ${pojo.getFieldModifiers(field)} ${pojo.getJavaTypeName(field, jdk5)} ${field.name}<#if pojo.hasFieldInitializor(field, jdk5)> = ${pojo.getFieldInitialization(field, jdk5)}</#if>;
</#if>
</#foreach>
