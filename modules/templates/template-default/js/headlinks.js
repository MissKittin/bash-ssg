/* adjust page-content bar height */
window.addEventListener('DOMContentLoaded', function(){
	document.getElementById('footer').style.borderTop='1px solid #ff0000';
	if(document.getElementById('page-content').offsetHeight+document.getElementById('header').offsetHeight+2 < window.innerHeight)
	{
		if(window.innerWidth > 700)
		{
		
			var header=document.getElementById('header');
				var headerHeight=window.getComputedStyle(header).margin;
				headerHeight=parseFloat(headerHeight);
				headerHeight=header.offsetHeight+headerHeight;
			var pageContent=document.getElementById('page-content');
				var pageContentHeight=window.getComputedStyle(pageContent).paddingBottom;
				pageContentHeight=parseFloat(pageContentHeight)*2;
			var footer=document.getElementById('footer');
				var footerHeight=footer.offsetHeight+footer.style.marginBottom;
			document.getElementById('page-content').style.height=window.innerHeight - headerHeight - footerHeight - pageContentHeight - 5 + 'px';

			footer.style.position='absolute';
			footer.style.bottom='5px';
			footer.style.right='5px';
			footer.style.left='5px';
		}
		else
		{
			var footer=document.getElementById('footer');
			footer.style.position='absolute';
			footer.style.bottom='5px';
			footer.style.right='5px';
			footer.style.left='5px';
		}
	}
});