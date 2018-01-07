<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet	version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:x="http://www.w3schools.com"
				exclude-result-prefixes="x">

	<xsl:template match="/">               
		<table id="universities"> 
			<xsl:call-template name="header" />
			<tbody id="universities-body">
				<xsl:apply-templates select="//x:winehouses" />
			</tbody>
		</table>
	</xsl:template>


	<xsl:template name="header">
		<thead>
			<tr>                                                                                                                  
				<th style="width:50px">
					<a href="#" onclick="this.blur(); return sortTable('winehouses-body', 0, true);">Име</a>
				</th>                                                                                               
				<th style="width:50px">
					Уеб страница
				</th>                                                                                             
				<th style="width:50px">
					<a href="#" onclick="this.blur(); return sortTable('winehouses-body', 2, true);">Брой студенти</a>
				</th>                                                                                 
				<th style="width:20px">
					<a href="#" onclick="this.blur(); return sortTable('winehouses-body', 3, true);">Тип</a>
				</th>                                                                              
				<th style="width:110px">
					Описание
				</th>                                                                                                        
				<th style="width:100px">
					Факултети
				</th>                                                                                           
				<th style="width:30px">
					<a href="#" onclick="this.blur(); return sortTable('winehouses-body', 6, true);">Регион</a>
				</th>                                                                                                             
			</tr>  
		</thead>
	</xsl:template>

	<xsl:template match="x:faculties">
		<ul>
			<xsl:for-each select="x:faculty">
				<li>
					<xsl:value-of select="."/>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>

	<xsl:template match="x:winehouses">
		<xsl:for-each select="x:winehouse">
			<tr>
				<xsl:apply-templates select="." />
				<td>
					<xsl:call-template name="get_region">
						<xsl:with-param name="winehouse_id" select="@id" />
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="x:winehouse">
		<td>
			<xsl:value-of select="x:name" />
		</td>                                                                            
		<td>
			<xsl:value-of select="x:webpage" />
		</td>    
		<td>
			<xsl:value-of select="x:wines_count" />
		</td>    
		<td>
			<xsl:value-of select="@type" />
		</td>                                                         
		<td>
			<xsl:value-of select="x:description" />
		</td>                           
		<td>
			<xsl:apply-templates select="x:wines" />
		</td>
	</xsl:template>

	<xsl:template name="get_region">
		<xsl:param name="winehouse_id" />
		<xsl:param name="region_id" select="//x:winehouses_regions_pairs/x:winehouses_regions[@winehouse_id=$winehouse_id]/@region_id" />
		<xsl:value-of select="//x:regions/x:region[@id=$region_id]" />
	</xsl:template>

</xsl:stylesheet>
