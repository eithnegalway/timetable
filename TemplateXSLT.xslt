<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  
  <xsl:param name="theday" select="'xxxthedayphxxx'"/> 
 <!--<xsl:variable name="theday" select="'saturday'"/>-->
  <!--<xsl:variable name="theday" select="'sunday'"/>-->

  <xsl:variable name="fridaycolor" select="'#bbe188'"/>
  <xsl:variable name="saturdaycolor" select="'#EBD9D9'"/>
  <xsl:variable name="sundaycolor" select="'#98CEA5'"/>
  
  <xsl:variable name="fridayearly" select="'#bbe188'"/>
  <xsl:variable name="saturdayearly" select="'#d7dfef'"/>
  <xsl:variable name="sundayearly" select="'#e7d9eb'"/>
 
  <xsl:variable name="fridaylate" select="'#bbe188'"/>
  <xsl:variable name="saturdaylate" select="'#a5bef1'"/>
  <xsl:variable name="sundaylate" select="'#dcabea'"/>

  xxxPH_LIST_OF_STAGESxxx

  <xsl:variable name="quarter_0" select="'0'"/>
  <xsl:variable name="quarter_1" select="'1'"/>
  <xsl:variable name="quarter_2" select="'2'"/>
  <xsl:variable name="quarter_3" select="'3'"/>
  
  <xsl:variable name="quarter_0_t" select="':00'"/>
  <xsl:variable name="quarter_1_t" select="':15'"/>
  <xsl:variable name="quarter_2_t" select="':30'"/>
  <xsl:variable name="quarter_3_t" select="':45'"/>

  <xsl:template match="/">
		<html>
			<body>
				<xsl:call-template name="HTMLStyle"/>
				<table>
					<tbody>


            
            <!--<xsl:call-template name="hourloop">
              <xsl:with-param name="i">10</xsl:with-param>
              <xsl:with-param name="count">26</xsl:with-param>
            </xsl:call-template>-->

            <!--<xsl:value-of select="$electric"/>-->
            <xsl:call-template name="do_header">
              <xsl:with-param name="thisday" select="$theday"></xsl:with-param>
            </xsl:call-template>
            
            <xsl:call-template name="recursive-template-hour">
              <xsl:with-param name="var_start">14</xsl:with-param>
              <xsl:with-param name="var_end">26</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="do_header">
              <xsl:with-param name="thisday" select="$theday"></xsl:with-param>
            </xsl:call-template>


          </tbody>
				</table>
			</body>
		</html>
	</xsl:template>

  <xsl:template name="recursive-template-hour">
    <xsl:param name="thisday" select="$theday"/>
    <xsl:param name="thisstage" select="main"/>
    <xsl:param name="var_start" select="5"/>
    <xsl:param name="var_end" select="5"/>
    <xsl:choose>
      <xsl:when test="$var_end > $var_start">
        <!--<tr>
          <td colspan="12" align="left">
            <h1>
              <xsl:value-of select="$var"/>
            </h1>
          </td>
        </tr>-->

        <xsl:variable name="altcolor">
          <xsl:choose>
            <xsl:when test="$thisday='saturday' and 18 > $var_start">
              <xsl:value-of select="$saturdayearly"/>
            </xsl:when>
            <xsl:when test="$thisday='saturday'">
              <xsl:value-of select="$saturdaylate"/>
            </xsl:when>
            <xsl:when test="$thisday='friday' and 18 > $var_start">
              <xsl:value-of select="$fridayearly"/>
            </xsl:when>
            <xsl:when test="$thisday='friday'">
              <xsl:value-of select="$fridaylate"/>
            </xsl:when>
            <xsl:when test="$thisday='sunday' and 18 > $var_start">
              <xsl:value-of select="$sundayearly"/>
            </xsl:when>
            <xsl:when test="$thisday='sunday'">
              <xsl:value-of select="$sundaylate"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$sundaycolor"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <tr bgcolor="{$altcolor}">
          <td>
            <h1>
              <xsl:value-of select="$var_start"/>
            </h1>
          </td>

          <xsl:call-template name="do_a_line">
            <xsl:with-param name="thisday" select="$thisday"></xsl:with-param>
            <xsl:with-param name="thishour" select="$var_start"></xsl:with-param>
            <xsl:with-param name="thisquarter" select="$quarter_0"></xsl:with-param>
          </xsl:call-template>
          <td>
            <h1>
            <xsl:value-of select="$var_start"/>
            </h1>
          
          </td>
        </tr>

          <tr>
            <td bgcolor="EEF7F0">
              <xsl:value-of select="$var_start"/><xsl:value-of select="$quarter_1_t"/>
            </td>
            <xsl:call-template name="do_a_line">
            <xsl:with-param name="thisday" select="$thisday"></xsl:with-param>
            <xsl:with-param name="thishour" select="$var_start"></xsl:with-param>
            <xsl:with-param name="thisquarter" select="$quarter_1"></xsl:with-param>
          </xsl:call-template>
            <td bgcolor="EEF7F0">
              <xsl:value-of select="$var_start"/><xsl:value-of select="$quarter_1_t"/>
            </td>
          </tr>

            <tr  bgcolor="{$altcolor}">
              <td bgcolor="EEF7F0">
                <xsl:value-of select="$var_start"/><xsl:value-of select="$quarter_2_t"/>
              </td>
              <xsl:call-template name="do_a_line">
            <xsl:with-param name="thisday" select="$thisday"></xsl:with-param>
            <xsl:with-param name="thishour" select="$var_start"></xsl:with-param>
            <xsl:with-param name="thisquarter" select="$quarter_2"></xsl:with-param>
          </xsl:call-template>
              <td bgcolor="EEF7F0">
                <xsl:value-of select="$var_start"/>:<xsl:value-of select="$quarter_2_t"/>
              </td>
            </tr>

              <tr>

                <td bgcolor="EEF7F0">
                  <xsl:value-of select="$var_start"/>:<xsl:value-of select="$quarter_3_t"/>
                </td>
                <xsl:call-template name="do_a_line">
            <xsl:with-param name="thisday" select="$thisday"></xsl:with-param>
            <xsl:with-param name="thishour" select="$var_start"></xsl:with-param>
            <xsl:with-param name="thisquarter" select="$quarter_3"></xsl:with-param>
          </xsl:call-template>
                <td bgcolor="EEF7F0">
                  <xsl:value-of select="$var_start"/>:<xsl:value-of select="$quarter_3_t"/>
                </td>
              </tr>

        <xsl:call-template name="recursive-template-hour">
          <xsl:with-param name="var_start" select="$var_start+1"/>
          <xsl:with-param name="var_end" select="$var_end"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="do_header">
    <xsl:param name="thisday"></xsl:param>

    <tr>
      <td>
        <h2>
          <xsl:value-of select="translate(substring($thisday,1,3),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
        </h2>
      </td>
      xxxPH_STAGE_HEADINGSxxx
      <td></td>
    </tr>
  </xsl:template>
  
  <xsl:template name="do_a_line">
    <xsl:param name="thisday"></xsl:param>
    <xsl:param name="thishour"></xsl:param>
    <xsl:param name="thisquarter"></xsl:param>
    <xsl:param name="shaded"></xsl:param>

    <p style="page-break-after:always;"></p>

	xxxstrStageSlotsXSLTxxx
  </xsl:template>

  <xsl:template name="do_a_slot">
    <xsl:param name="thisday"></xsl:param>
    <xsl:param name="thisstage"></xsl:param>
    <xsl:param name="thishour"></xsl:param>
    <xsl:param name="thisquarter"></xsl:param>
    <!--<xsl:value-of select="$thisday"/>
    <xsl:value-of select="$thishour"/>
    <xsl:value-of select="$thisquarter"/>
    <xsl:value-of select="$thisstage"/>-->
    <td>
    <xsl:for-each select="data-set/record[(day=$thisday and hour=$thishour and quarter=$thisquarter and stage=$thisstage)]">
          <!--<h1><xsl:value-of select="band"/></h1>-->
      <b><xsl:value-of select="translate(band,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
      
        <xsl:value-of select="adjustment"></xsl:value-of>
      </b>
      
      
    </xsl:for-each>
    </td>
  </xsl:template>


  
  <xsl:template name="recursive-template_quarter">
    <xsl:param name="var_start" select="0"/>
    <xsl:param name="var_end" select="4"/>
    <xsl:choose>
      <xsl:when test="$var_end > $var_start">
        <xsl:for-each select="data-set/record[(hour=$var_start)]">
          <xsl:sort select="day"/>
          <xsl:sort select="hour"/>
          <xsl:sort select="quarter"/>
          <xsl:sort select="adjustment"/>
          <xsl:sort select="stage"/>
          <tr>
            <td>
              <xsl:value-of select="hour"/>
              <xsl:value-of select="quarter"/>
            </td>
            <xsl:for-each select="stage">
              <!--<xsl:value-of select="."/>-->
              <!--<xsl:value-of select="$main"/>-->
              <!--<xsl:if test=". = $main">
                <xsl:value-of select="."/>
                <xsl:value-of select="hour"/>
                <xsl:value-of select="stage"/>
                <xsl:call-template name="DoIndents">
                  <xsl:with-param name="indent" select="$main_i"/>
                </xsl:call-template>
                <td colspan="12" align="left">
                  <h1>
                    <xsl:value-of select="hour"/>
                    <xsl:value-of select="band"/>
                  </h1>
                </td>
              </xsl:if>-->
            </xsl:for-each>
          </tr>
        </xsl:for-each>
        <xsl:call-template name="recursive-template-hour">
          <xsl:with-param name="var_start" select="$var_start+1"/>
          <xsl:with-param name="var_end" select="$var_end"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>

  <!--<xsl:template name="hourloop">
    <xsl:for-each select="data-set/record">
      <xsl:sort select="day"/>
      <xsl:sort select="stage"/>
      <xsl:sort select="hour"/>
      <xsl:sort select="adjustment"/>
      <tr>
        <td colspan="12" align="left">
          <h1>
            <xsl:value-of select="band"/>
          </h1>
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>-->

  <xsl:template name="spitstage">
    <xsl:param name="day"/>
    <xsl:param name="indent"/>
		<xsl:for-each select="./folder">
			<tr>
				 <xsl:call-template name="DoIndents">
					<xsl:with-param name="indent" select="$indent"/>
				 </xsl:call-template>
				<td colspan="10" align="left"><h1>
					<xsl:value-of select="@label"/></h1>
				</td>
			</tr>
			<xsl:call-template name="outputfile">
				<xsl:with-param name="indent" select="$indent+1"/>
			</xsl:call-template>
		</xsl:for-each>
  </xsl:template>
  
	<xsl:template name="outputfile">
		<xsl:param name="indent"/>
		<xsl:for-each select="./file[contains(@label,'.mp3')]">
      <tr>
				 <xsl:call-template name="DoIndents">
					  <xsl:with-param name="indent" select="$indent"/>
				 </xsl:call-template>
				<td  colspan="10" align="left">
          <a>
	          <xsl:attribute name="href"><xsl:value-of select="concat(@filePath,'\',@label)"/></xsl:attribute>
	          <xsl:value-of select="@label" />
          </a>
				</td>
			</tr>
    </xsl:for-each>
  </xsl:template>
 	<xsl:template name="DoIndents">
		<xsl:param name="indent">0</xsl:param>
		<xsl:if test="number($indent) >= 0">
			<td></td>
			<xsl:call-template name="DoIndents">
				 <xsl:with-param name="indent" select="$indent - 1"/>
			 </xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="HTMLStyle">
			<head>
				<style type="text/css">
                        body
						{
						}

						h1
						{
							font-size: 12px;
							color: #880000;
							padding:0;
							margin:0;
							font-family:Arial;
						}

						TABLE
						{
							border-right: 0px;
							border-top: 0px;
							border-left: 0px;
							border-bottom: 0px;
							background-color: White;
							font-family:Arial;
							font-size:10px;
						}

						p, font
						{
							font-family:Arial;
							font-size:10px;
						}

						TABLE TD
						{
							padding-right: 3px;
							padding-left: 3px;
							padding-bottom: 3px;
              font-size:12px;
						}

						TABLE TBODY
						{
							background-color: white;
							border-width: 1px;
						}

						TABLE THEAD TD
						{
							border-top-width: 1px;
							border-left-width: 1px;
							border-bottom-width: 1px;
							margin: 0px;
							color: white;
							background-color: #003399;
							border-right-width: 1px;
						}

						TABLE TFOOT
						{
							border-width: 0px;
							background-color: White;
						}

						A
						{
							font-size:10px;
						}
						
						TABLE TFOOT TD
						{
							padding-top: 12px;
							text-align: center;
						}
                </style>
			</head>
	</xsl:template>
 </xsl:stylesheet>
