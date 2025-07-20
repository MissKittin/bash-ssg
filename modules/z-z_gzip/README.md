# Gzip module - Bash SSG
Module that compresses files in the `generated` directory.

### Settings
The settings are in the `defaults.rc.d/gzip.rc`:
* `gzip__compression`  
	An integer from `1` to `9`  
	If empty, the module is disabled
* `gzip__process_html`  
	Compress all `.html` files
* `gzip__process_css`  
	Compress all `.css` files
* `gzip__process_js`  
	Compress all `.js` files
* `gzip__process_xml`  
	Compress all `.xml` files
* `gzip__remove_gz_extension`  
	Do not add the `.gz` extension

### Default module
**This module cannot be set as home page!**
