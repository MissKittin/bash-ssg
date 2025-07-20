# Sitemap module - Bash SSG
Module for generating a sitemap.

### How it works
The module looks for files with the default extension (`${defaults__default_file_name}${defaults__default_file_extension}` e.g. `index.html`)  
and other files with the default extension (`${defaults__default_file_extension}` e.g. `.html`)  
in the `generated` directory and then adds a record to the `sitemap.xml` file.  
Each record consists of parameters `loc`, `lastmod`, `changefreq` and `priority`.  
The default value for `lastmod` is the current date, for `changefreq` the `${sitemap__param_changefreq}` variable, and for priority `0.5`.  
If the directory with `${file}` also contains files `sitemap-lastmod`, `sitemap-changefreq` and `sitemap-priority`, the values of individual parameters will be read from them. Once the record is added, they will be deleted.  
If sitemap generation is disabled, the module will only remove the above files from the `generated` directory.

### Warning
If options `sitemap__gzip_sitemap_xml` and `sitemap__remove_gz_extension` are active,  
it may conflict with the Gzip module (the `sitemap.xml` will be compressed twice).

### Settings
The settings are in the `defaults.rc.d/sitemap.rc`:
* `sitemap__enabled`  
	Main switch
* `sitemap__page_domain`  
	E.g. `http://localhost:8080`
* `sitemap__sitemap_file_name`  
	File name/path to file in `generated` directory
* `sitemap__stylesheet_file_name`  
	Path to `xsl` file  
	E.g. `"${sitemap__page_domain}/assets/sitemap.xsl"`  
	Disabled if `'false'`
* `sitemap__param_changefreq`  
	For all entries without individual settings
* `sitemap__save_info_to_robots_txt`  
	Add `Sitemap: $sitemap-url` to `generated/robots.txt` file
* `sitemap__gzip_sitemap_xml`  
	Compress the finished `sitemap.xml`  
	An integer from `1` to `9`  
	Disabled if empty
* `sitemap__remove_gz_extension`  
	Do not add the `.gz` extension
* `sitemap__header_content`  
	Add a string to the beginning of the `sitemap.xml`
* `sitemap__footer_content`  
	Add a string to the end of the `sitemap.xml`

### Default module
**This module cannot be set as home page!**
