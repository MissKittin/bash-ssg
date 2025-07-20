# Posts archive module - Bash SSG
Module for generating a list of posts sorted by date.

### How it works
Looks for `arch_YYYY-MM-DD` (e.g. `arch_2020-12-21`) files in the `database/posts` directory.  
Based on this, it builds a list of dates and pages with posts grouped by them.  
**Note:** if a post doesn't have an `arch_YYYY-MM-DD` file, it won't be included.

### Settings
The settings are in the `defaults.rc.d/posts-arch.rc`:
* `posts_arch__generated_directory`  
	Module directory name in the `generated` directory  
	**Warning:** must be empty or terminated with a slash
* `posts_arch__enable_date_lists`  
	Generate list with archive
* `posts_arch__label_not_found`  
	"No posts" message generated on the page of the list
* `posts_arch__parallel_rendering`  
	Speed up archive lists rendering
* `posts_arch__format_date_label`  
	Date format conversion
* `posts_arch__list_header_content`  
	String at the beginning of the dates page
* `posts_arch__list_footer_content`  
	String at the end of the dates page
* `posts_arch__listing_header_content`  
	String at the beginning of each post list page
* `posts_arch__listing_footer_content`  
	String at the end of each post list page
* `posts_arch__list_html_headers`  
	Add a string to the `<head>` section of the date list
* `posts_arch__listing_html_headers`  
	Add a string to the `<head>` section of each post list page
* `posts_arch__html_title`  
	Set the `<title>` of the date list page
* `posts_arch__list_html_title`  
	Set the `<title>` of the post list page

### API
The template must provide resources `arch-list.rc` and `arch-pages.rc`.  
If this is a post list page, the `posts_arch__counted_pages` and `current_page_number` variables are not empty and contains an integer (`arch-pages.rc`).  
The `arch-list.rc` file gets a list of dates in the `post_arch__date_list` variable.  
The `arch-list.rc` file must implement the `posts_arch__label_not_found` setting.  
The `arch-list.rc` file must implement the `posts_arch__format_date_label` function.

### Default module
The module can be set as a home page.  
Set `defaults__home_module='posts-arch'` in the `database/defaults.rc.d/defaults.rc` file.  
**Warning:** the `posts_arch__enable_date_lists` option must be active.
