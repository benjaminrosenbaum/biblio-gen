<?xml version="1.0" ?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="html" />
<xsl:template match="/">
	  <HTML><HEAD><TITLE>Benjamin Rosenbaum - Bibliography</TITLE> 
	  <META http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/> 
	  <META content="Benjamin Rosenbaum" name="Author"/> 
	  <style> 
	    ul 
	    {
	       font-size: smaller;
	       padding-top: 0px; 
	       margin-top: 0px;
	    }
	    
	    ul.padded
	    {
	    	padding-top: 0px;
	    }
	    
	    ul.fixedsize 
	    {
	      font-size:normal;
		  margin-top: 0px;
	      padding-top: 0px;
		  
	    }
	    
	    ul.fixedsize li
	    {
	      font-size: 9pt;
	    }
	    
		ul.fixedsize li.padded
		{
		  padding-top: 8px;
		}
		
	    table
	    {
	      cell-spacing: 0px;
	      cell-padding: 0px;
	      border: 0px;     
	    }																																												
	    
	    .left-img img
	    {
	      height: 368px;
	      width: 248px;
	    }
	    
	    td.content
	    {
	      vertical-align: top;
	      text-align: left;
	    }
	    
	    h3
	    {
	      font-family: "Copperplate Gothic Bold";
	      font-weight: bold;
	    }
	    
	    .pubsGroup
	    {
	    	padding-top: 8px;
	    	padding-bottom: 12px;
	    }
	    
	    .pubsGroup h4
	    {
	      text-decoration: underline;
	      font-family: "Copperplate Gothic Light";
	      font-weight: bold;
	      font-style: italic;
	    }
	    
	    .pubsGroup p
	    {
	    	text-indent: -3em; 
	    	margin-left: 3em;  
	    }
	    
	    .translationLanguage
	    {
	      font-weight: bold;
	    }
	    
	  </style> 
	 
	</HEAD> 
	<BODY>
	<CENTER> 
	<TABLE> 
	  <TBODY> 
	  <tr> 
	    <td class="left-img"><IMG src="biblio.gif" class="biblio" /></td> 
	    <td class="content">
	       <h3>Publications</h3>
	       <xsl:call-template name="workCategory">
	       		<xsl:with-param name="title">Books</xsl:with-param>
	       		<xsl:with-param name="type">book</xsl:with-param>
	       </xsl:call-template>
	       <xsl:call-template name="workCategory">
	       		<xsl:with-param name="title">Short Stories</xsl:with-param>
	       		<xsl:with-param name="type">story</xsl:with-param>
	       </xsl:call-template>		       
	       <xsl:call-template name="workCategory">
	       		<xsl:with-param name="title">Poems</xsl:with-param>
	       		<xsl:with-param name="type">poem</xsl:with-param>
	       </xsl:call-template>		       
	       <xsl:call-template name="workCategory">
	       		<xsl:with-param name="title">Nonfiction</xsl:with-param>
	       		<xsl:with-param name="type">article</xsl:with-param>
	       </xsl:call-template>	 	       
	       <xsl:call-template name="workCategory">
	       		<xsl:with-param name="title">As Editor</xsl:with-param>
	       		<xsl:with-param name="type">asEditor</xsl:with-param>
	       </xsl:call-template>	  
	       
	       <h3><a name="translations">In Translation&amp;nbsp;</a></h3>  
	       <ul class="fixedsize">    	       
	       <xsl:for-each select="//translation/language[not(../language = ../preceding::language)]" >
			 <xsl:sort select="." />
	         <xsl:variable name="lang"><xsl:value-of select="." /></xsl:variable>
	         <li class="padded">
	           <span class="translationLanguage">
			    <a> 
					<xsl:attribute name="name" >
						<xsl:value-of select="$lang" />
					</xsl:attribute>
					<xsl:value-of select="$lang" />:
				</a>
	           </span>
	           <ul>
	             <xsl:apply-templates select="//translation[language = $lang]" />
	           </ul>	
	         </li>         
	       </xsl:for-each >
	       </ul>
		   
		   <h3><a name="translations">Interviews and Profiles&amp;nbsp;</a></h3>  
	       <ul class="fixedsize">    	       
				<xsl:apply-templates select="//interview" />
	       </ul>
		   
		   <h3><a name="reviews">Reviews&amp;nbsp;</a></h3>  
	       	<ul class="fixedsize">    	       
	       <xsl:for-each select="//review/venue/name[not(../name = ../preceding::name)]" >
			 <xsl:sort select="." />
	         <xsl:variable name="where"><xsl:value-of select="." /></xsl:variable>
	         <li class="padded">
	           <span class="translationLanguage">
	             At <xsl:value-of select="$where" />:
	           </span>
	           <ul>
	             <xsl:apply-templates select="//review[venue/name = $where]" />
	           </ul>	
	         </li>         
	       </xsl:for-each >
	       </ul>	   
		   
	     </td>
	   </tr>
	  </TBODY>
	  </TABLE>
	</CENTER> 
	<DIV align="right">
	  <a href="http://www.benjaminrosenbaum.com/"> 
	    <IMG height="22" src="br.gif" width="29"/>
	  </a> 
	</DIV> 
	 
	 
	<!-- Google Analytics --> 
	<script type="text/javascript"> 
	var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
	document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	</script> 
	<script type="text/javascript"> 
	var pageTracker = _gat._getTracker("UA-523337-1");
	pageTracker._initData();
	pageTracker._trackPageview();
	</script> 
	 
	</BODY></HTML>  
	  
</xsl:template>

<xsl:template name="workCategory">
   <xsl:param name="title" />
   <xsl:param name="type" />
   <div class="pubsGroup">
	   <h4>&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;<xsl:value-of select="$title" /></h4>
		 <xsl:apply-templates select="//work[type=$type]" /> 
	 </div>
</xsl:template>   


<xsl:template match="work">
  <p>
    <xsl:apply-templates select="." mode="link" />
    <xsl:if test="description">, <xsl:value-of select="description" /></xsl:if>
    <xsl:if test="collaborators/venue">
    	with	
    	<xsl:for-each select="collaborators/venue">
    	  <xsl:if test="position() = last() and count(../venue) > 1 "> and </xsl:if>
    	  <xsl:apply-templates select="." />
    	  <xsl:if test="position() != last() ">, </xsl:if>
    	</xsl:for-each>    	
    </xsl:if>    
    <xsl:if test="publication[reprint='false']">,</xsl:if>
    <xsl:apply-templates select="publication[reprint='false']" mode="original" /> 
    <xsl:text>.</xsl:text>    
    <xsl:if test="seller or boolean(recognition) or boolean(adaptation) or boolean(publication[reprint='true']) or boolean(translation)">
		<ul class="padded"> 
			<xsl:if test="seller">    	
				<li>
					<xsl:if test="not(publication/date)">pre</xsl:if>order at:   	
					<xsl:apply-templates select="seller" />
				</li> 
			</xsl:if>
			<xsl:apply-templates select="recognition"  />
			<xsl:apply-templates select="adaptation"  />
			<xsl:apply-templates select="publication[reprint='true']"  />
			<xsl:if test="translation">    	
				<li>
					translated into
					<xsl:for-each select="translation">
						<a>
							<xsl:attribute name="href" >
								<xsl:text>#</xsl:text>						
								<xsl:value-of select="language" />
							</xsl:attribute>
							<xsl:value-of select="language" />
						</a>						
						<xsl:if test="position()!=last() and count(../translation) &gt; 2">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:if test="position()=last()-1">
							<xsl:text> and </xsl:text>
						</xsl:if>
					</xsl:for-each>					
				</li> 
			</xsl:if>
		</ul> 
    </xsl:if>
  </p> 
</xsl:template>


<xsl:template match="work" mode="link">
  <xsl:if test="type='story' or type='article' or type='poem'">"</xsl:if>
  <xsl:choose>
    <xsl:when test="url">
      <a><xsl:attribute name="href"><xsl:value-of select="url" /></xsl:attribute>
      <xsl:value-of select="title" /></a>
    </xsl:when>
    <xsl:otherwise>
    	<xsl:value-of select="title" />
    </xsl:otherwise>
  </xsl:choose>
  <xsl:if test="type='story' or type='article' or type='poem'">"</xsl:if>    
</xsl:template>

<xsl:template match="translation">
  <li>
    <xsl:variable name="title">
      <xsl:choose>
        <xsl:when test="translatedTitle"><xsl:apply-templates select="translatedTitle" /></xsl:when>
        <xsl:otherwise><xsl:value-of select="../title" /></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="url">
        <a>
        	<xsl:attribute name="href"><xsl:value-of select="url" /></xsl:attribute>
        	<xsl:value-of select="$title" />
        </a>
      </xsl:when>
      <xsl:otherwise>
      	<xsl:value-of select="$title" />
      </xsl:otherwise>    
    </xsl:choose>
    <xsl:if test="translatedTitle"> (translation of <xsl:apply-templates select=".." mode="link" />)</xsl:if>
    <xsl:if test="translator">
	    <xsl:text>, translated by </xsl:text>
	    <xsl:value-of select="translator" />
	  </xsl:if>
	  <xsl:if test="publication[reprint='false']">
	   in <xsl:apply-templates select="publication[reprint='false']" mode="original" /> 
	  </xsl:if>
	  <xsl:if test="boolean(recognition) or boolean(publication[reprint='true'])">
    	, also appeared in: <ul> 
      	<xsl:apply-templates select="recognition"  />
      	<xsl:apply-templates select="publication[reprint='true']"  />
      </ul> 
    </xsl:if>
  </li>
</xsl:template>

<xsl:template match="adaptation">
  <li>		  
	<xsl:variable name="title">
      <xsl:text>"</xsl:text>
	  <xsl:choose>
        <xsl:when test="adaptationTitle"><xsl:value-of select="adaptationTitle" /></xsl:when>
        <xsl:otherwise><xsl:value-of select="../title" /></xsl:otherwise>
      </xsl:choose>
	  <xsl:text>"</xsl:text>	  
    </xsl:variable>

    <xsl:choose>
		    <xsl:when test="type='film'">filmed as </xsl:when>
		    <xsl:when test="type='radioPlay'">adapted as radio play </xsl:when>
		    <xsl:when test="type='stageProduction'">adapted for the stage as </xsl:when>
		    <xsl:otherwise>adapted as </xsl:otherwise>		    
	</xsl:choose>
	
    <xsl:choose>
      <xsl:when test="url">
        <a>
        	<xsl:attribute name="href"><xsl:value-of select="url" /></xsl:attribute>
        	<xsl:value-of select="$title" />
        </a>
      </xsl:when>
      <xsl:otherwise>
      	<xsl:value-of select="$title" />
      </xsl:otherwise>    
    </xsl:choose>
	
    <xsl:if test="adaptor">
	    <xsl:text> by </xsl:text>
	    <xsl:value-of select="adaptor" />
	  </xsl:if>
	  <xsl:if test="recognition">
		<ul>
			<xsl:apply-templates select="recognition"  />
		</ul>	    
    </xsl:if>
  </li>
</xsl:template>


<xsl:template match="seller">
		&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;<xsl:apply-templates select="venue" />
</xsl:template>

<xsl:template match="publication" mode="original">
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="venue" />
		<xsl:choose> 
		  <xsl:when test="date">, <xsl:value-of select="date" /></xsl:when>
		  <xsl:otherwise>
		    <xsl:if test="reprint='false'">, <i>forthcoming</i></xsl:if>
		  </xsl:otherwise>		  
		</xsl:choose>
		<xsl:value-of select="otherPubInfo" disable-output-escaping="yes" />
</xsl:template>

<xsl:template match="publication" >
		<li>
		  <xsl:choose>
		    <xsl:when test="type='webExhibit'">exhibited at</xsl:when>
		    <xsl:when test="type='podcast'">podcast at</xsl:when>
		    <xsl:when test="type='paidDownload'">available at</xsl:when>
		    <xsl:when test="type='website'">reprinted at</xsl:when>
		    <xsl:otherwise>reprinted in</xsl:otherwise>		    
		  </xsl:choose>		  
		  <xsl:apply-templates select="." mode="original" />
		</li>
</xsl:template>

<xsl:template match="recognition" >
		<li>
		  <xsl:choose>
		    <xsl:when test="type='listed'">made the</xsl:when>
		    <xsl:when test="type='shortlisted'">shortlisted for the</xsl:when>
		    <xsl:when test="type='finalist'">finalist for the</xsl:when>
		    <xsl:when test="type='honorableMention'">honorably mentioned in</xsl:when>
		    <xsl:when test="type='won'">won</xsl:when>
		  </xsl:choose>	
		  <xsl:text> </xsl:text>	  
		  <xsl:apply-templates select="venue" />
		</li>
</xsl:template>

<xsl:template match="review" >
		<li> 
		  <xsl:text>For </xsl:text>	  
		  <xsl:choose>
			<xsl:when test="url">
			  <a><xsl:attribute name="href"><xsl:value-of select="url" /></xsl:attribute>
			  <xsl:value-of select="../title" /></a>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="../title" />
			</xsl:otherwise>
		  </xsl:choose>
		</li>
</xsl:template>

<xsl:template match="interview" >
		<li> 
		  <xsl:text>At </xsl:text>	  
		  <xsl:apply-templates select="venue" />
		</li>
</xsl:template>


<xsl:template match="venue">
  <xsl:choose>
    <xsl:when test="url">
      <a><xsl:attribute name="href"><xsl:value-of select="url" /></xsl:attribute>
      <xsl:value-of select="name" /></a>
    </xsl:when>
    <xsl:otherwise>
    	<xsl:value-of select="name" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="translatedTitle">
	<xsl:call-template name="replace">
  	<xsl:with-param name="txt"><xsl:value-of select="." disable-output-escaping="yes" /></xsl:with-param>
  	<xsl:with-param name="target">&amp;amp;</xsl:with-param>
  	<xsl:with-param name="replWith" >&amp;</xsl:with-param> 
  </xsl:call-template>
 
</xsl:template>

<xsl:template name="replace">
  <xsl:param name="txt" />
  <xsl:param name="target" />
  <xsl:param name="replWith" />
  <xsl:choose>
    <xsl:when test="contains($txt,$target)">      
      <xsl:value-of select="substring-before($txt, $target)" disable-output-escaping="yes" />
      <xsl:value-of select="$replWith" disable-output-escaping="yes" />
      <xsl:call-template name="replace">
		    <xsl:with-param name="txt"><xsl:value-of select="substring-after($txt, $target)" disable-output-escaping="yes"/></xsl:with-param>
		    <xsl:with-param name="target"><xsl:value-of select="$target" disable-output-escaping="yes" /></xsl:with-param>
		    <xsl:with-param name="replWith"><xsl:value-of select="$replWith"  disable-output-escaping="yes" /></xsl:with-param>      
		  </xsl:call-template>  		       
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$txt" disable-output-escaping="yes" />      
    </xsl:otherwise>
  </xsl:choose>        
</xsl:template>   



</xsl:stylesheet>
