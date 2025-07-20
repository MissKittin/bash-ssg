# Posts tags module - Bash SSG
Module for generating a list of posts sorted by tags.

### How it works
Looks for `tags` directories in the `database/posts` directory.  
Based on this, it builds a list of tags and pages with posts grouped by them.

### Settings
The settings are in the `defaults.rc.d/posts-tags.rc`:
* `posts_tags__generated_directory`  
	Module directory name in the `generated` directory  
	**Warning:** must be empty or terminated with a slash
* `posts_tags__enable_tag_lists`  
	Generate list with tags
* `posts_tags__label_not_found`  
	"No posts" message generated on the page of the list
* `posts_tags__parallel_rendering`  
	Speed up tag lists rendering
* `posts_tags__list_header_content`  
	String at the beginning of the tags page
* `posts_tags__list_footer_content`  
	String at the end of the tags page
* `posts_tags__listing_header_content`  
	String at the beginning of each post list page
* `posts_tags__listing_footer_content`  
	String at the end of each post list page
* `posts_tags__list_html_headers`  
	Add a string to the `<head>` section of the tags list
* `posts_tags__listing_html_headers`  
	Add a string to the `<head>` section of each post list page
* `posts_tags__html_title`  
	Set the `<title>` of the tags list page
* `posts_tags__list_html_title`  
	Set the `<title>` of the post list page

### API
The template must provide resources `tags-list.rc` and `tags-pages.rc`.  
If this is a post list page, the `posts_tags__counted_pages` and `current_page_number` variables are not empty and contains an integer (`tags-pages.rc`).  
The `tags-list.rc` file gets a list of tags in the `posts__tag_list` variable.  
The `tags-list.rc` file must implement the `posts_tags__label_not_found` setting.

### Default module
The module can be set as a home page.  
Set `defaults__home_module='posts-tags'` in the `database/defaults.rc.d/defaults.rc` file.  
**Warning:** the `posts_tags__enable_tag_lists` option must be active.
