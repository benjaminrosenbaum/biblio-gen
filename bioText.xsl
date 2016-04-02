<?xml version="1.0" ?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="text" />
<xsl:template match="/">	  
		<xsl:text>Benjamin Rosenbaum's stories have been translated into </xsl:text>
		<xsl:for-each select="//translation/language[not(../language = ../preceding::language)]">
		    <xsl:sort select="." />
			<xsl:value-of select="." />						
			<xsl:if test="position()!=last() and count(//translation) &gt; 2">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="position()=last()-1">
				<xsl:text>and </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>, and nominated for the </xsl:text> 
		<xsl:for-each select="//recognition[type='finalist' or type='shortlisted']/venue/name[not(../../venue/name = ../../preceding::venue/name)]">
		    <xsl:sort select="." />
			<xsl:value-of select="." />					
			<xsl:if test="position()!=last() and count(//recognition[type='finalist']) &gt; 2">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="position()=last()-1">
				<xsl:text>and </xsl:text>
			</xsl:if>
		</xsl:for-each>.	
       
</xsl:template>


</xsl:stylesheet>
