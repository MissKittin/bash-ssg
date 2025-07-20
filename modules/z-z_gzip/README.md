# Gzip module - Bash SSG
Module that compresses files in the `generated` directory.

### Functions
If you need to use functions from this module, they are defined in the `functions.rc`:
* `ssg_gzip 5 'true' '*.ext1 *.ext2 *.extn'`  
	Compress files with compression level `5`  
	with custom extensions (here: `.ext1`, `.ext2`, and `.extn`)  
	and remove the `.gz` extension (`'true'`)

### Settings
The settings are in the `defaults.rc.d/gzip.rc`:
* `gzip__compression`  
	An integer from `1` to `9`  
	If empty, the module is disabled
* `gzip__process_html`  
	Compress all `.html`, `.htm` and `.xhtml` files
* `gzip__process_css`  
	Compress all `.css` files
* `gzip__process_js`  
	Compress all `.js` files
* `gzip__process_xml`  
	Compress all `.xml` and `.xsl` files
* `gzip__process_files`  
	Process other extensions, e.g:  
	`gzip__process_files='*.ext1 *.ext2 *.extn'`
* `gzip__remove_gz_extension`  
	Do not add the `.gz` extension

### Default module
**This module cannot be set as home page!**
