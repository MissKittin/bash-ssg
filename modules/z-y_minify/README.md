# Minify module - Bash SSG
Module for minifying pages and assets.

### Functions
If you need to use functions from this module, they are defined in the `functions.rc`.  
As an argument you can specify the type of files you are looking for (e.g. `*.xml`):
* `minify_html [*.ext] [true]`  
	HTML/XML minifier  
	**Hint:** if the second argument is `true`, HTML comments will be removed
* `minify_css [*.ext]`  
	CSS minifier
* `minify_js [*.ext]`  
	JS minifier

### Settings
The settings are in the `defaults.rc.d/minify.rc`:
* `minify__process_all`  
	Overwrites variables `minify__process_html`, `minify__process_css`, and `minify__process_js`
* `minify__process_html`  
	Compress all `.html` files
* `minify__process_html_comments`  
	Additionally, remove comments from the HTML code
* `minify__process_css`  
	Compress all `.css` files
* `minify__process_js`  
	Compress all `.js` files
* `minify__parallel_rendering`  
	Speed up mummification

### Default module
**This module cannot be set as home page!**
