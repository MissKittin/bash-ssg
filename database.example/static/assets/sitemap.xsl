<?xml version="1.0" encoding="UTF-8" ?>
<html xsl:version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:s="http://www.sitemaps.org/schemas/sitemap/0.9">
	<head>
		<title>Sitemap</title>
		<link rel="stylesheet" href="/assets/sitemap.css"/>
	</head>
	<body>
		<table>
			<tr><th>URL</th><th>Last modified</th><th>Change frequency</th></tr>
			<xsl:for-each select="s:urlset/s:url">
				<tr>
					<td><a>
						<xsl:attribute name="href">
							<xsl:value-of select="s:loc"/>
						</xsl:attribute>
						<xsl:value-of select="s:loc"/>
					</a></td>
					<td><xsl:value-of select="s:lastmod"/></td>
					<td><xsl:value-of select="s:changefreq"/></td>
				</tr>
			</xsl:for-each>
		</table>
	</body>
</html>
