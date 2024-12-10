<?xml version="1.0" encoding="UTF-8" ?>
<html xsl:version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<head>
		<title><xsl:value-of select="rss/channel/title"/> RSS</title>
		<link rel="stylesheet" href="/assets/feed.css"/>
	</head>
	<body>
		<h1 id="channel-title"><xsl:value-of select="rss/channel/title"/> RSS</h1>
		<hr/>
		<xsl:for-each select="rss/channel/item">
			<h3><a class="post-title">
				<xsl:attribute name="href">
					<xsl:value-of select="link"/>
				</xsl:attribute>
				<xsl:value-of select="title"/>
			</a></h3>
			<span class="post-date"><xsl:value-of select="pubDate"/></span>
			<br/><br/>
			<xsl:value-of select="description"/>
			<br/><br/><br/>
		</xsl:for-each>
	</body>
</html>
