# Posts RSS module - Bash SSG
Module for generating an RSS feed of posts.

### How it works
Scans `meta.rc` files in the `database/posts` directory  
and generates an XML file with an RSS feed based on them.

### Post metadata
The module uses variables from the post `meta.rc` only those listed below:
* `posts_rss__post_title`  
	`posts__post_title` equivalent
* `posts_rss__post_description`  
	Content (teaser) of the post
* `posts_rss__post_pubdate`  
	It must be in the correct format, e.g:  
	`Mon, 21 Dec 2020 01:23:45 +0100`
* `posts_rss__post_xml`  
	Adds custom tags to `<item>`, e.g:  
	`<author>admin@bash.ssg</author>`

### Settings
The settings are in the `defaults.rc.d/posts-rss.rc`:
* `posts_rss__url`  
	Full website URL  
	**Warning:** must be empty or must not be terminated with a slash  
	Disabled if empty
* `posts_rss__force_enable`  
	Enable module regardless of whether `posts_rss__url` is empty
* `posts_rss__generated_directory`  
	Module directory name in the `generated` directory  
	**Warning:** must be empty or terminated with a slash
* `posts_rss__file`  
	Output file name
* `posts_rss__stylesheet_file`  
	Add link to XSL file
* `posts_rss__header_content`  
	String at the beginning of the XML file
* `posts_rss__footer_content`  
	String at the end of the XML file
* `posts_rss__title`  
	Channel title
* `posts_rss__link`  
	Link to the channel (`<link>`)
* `posts_rss__lang`  
	Channel language

### Default module
**This module cannot be set as home page!**
