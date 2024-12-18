<?xml version="1.0" encoding="UTF-8" ?>
<html xsl:version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<head>
		<title><xsl:value-of select="rss/channel/title"/> RSS</title>
		<link rel="stylesheet" href="/assets/feed.css"/>
		<script>//<![CDATA[
			document.addEventListener('DOMContentLoaded', function(){
				var dates=document.getElementsByClassName('post-date');
				var posts=document.getElementsByClassName('post-content');
				var i;
				var date, dateMonth;

				for(i=0; i<dates.length; i++)
				{
					date=new Date(Date.parse(dates[i].innerHTML));
					dateMonth=date.getMonth()+1;

					dates[i].innerHTML=date.getDate()+'.'+dateMonth+'.'+date.getFullYear();
				}

				for(i=0; i<posts.length; i++)
					posts[i].innerHTML=posts[i].innerHTML
					.	replace(/&amp;/g, '&')
					.	replace(/&lt;/g, '<')
					.	replace(/&gt;/g, '>');
			}, false);
		//]]></script>
	</head>
	<body>
		<h1 id="channel-title"><xsl:value-of select="rss/channel/title"/> RSS</h1>
		<hr/>
		<xsl:for-each select="rss/channel/item">
			<div class="post">
				<h3><a class="post-title">
					<xsl:attribute name="href">
						<xsl:value-of select="link"/>
					</xsl:attribute>
					<xsl:value-of select="title"/>
				</a></h3>
				<span class="post-date"><xsl:value-of select="pubDate"/></span>
				<br/><br/>
				<div class="post-content"><xsl:value-of select="description"/></div>
				<br/><br/><br/>
			</div>
		</xsl:for-each>
	</body>
</html>
