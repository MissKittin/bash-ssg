# Posts module - Bash SSG
Module for generating blog posts.

### How it works
Posts are located in the `database/posts` directory.  
Each post has its own directory, for example, `public_0000001_sample-post`, where
* `public` means the post is published and visible in the post list  
	if you change it to `hidden`, the post will be published but will not be visible in the post list  
	if there is anything else, the post will not be published
* `0000001` is the number in the queue (the smaller the number, the older the post)  
	the number of leading zeros can be changed, but the string length must be the same for all posts
* `sample-post` is the post URL

Two files are required in the post directory: `meta.rc` and `content.rc`.  
Post metadata is defined in `meta.rc`:
* `posts__post_id` defines the `class="post-id-${posts__post_id}"` parameter of the `<div>` (optional)  
	E.g. `0000001` or `mypostid`  
	**Warning:** always add `unset 'posts__post_id'` at the beginning of this file
* `posts__post_title` displayed at the beginning of the post (can be empty)
* `posts__post_date` displayed at the beginning of the post (can be empty)
* you can also use the `posts__copy_file` function in it

The `content.rc` file contains the content of the post (`cat << EOF`).  
In your post directory, you can create a `tags` directory, and within it, empty files with tag names - only the name is processed.  
These will be displayed at the top of the post.  
**Warning:** tag names cannot contain spaces.  
Both the post date and its tags can be links - this is how you can integrate this module with others (see `posts__posts_arch_integration` and `posts__posts_tags_integration` in settings).

### Plugins
You can add a plugin (e.g. with comments) under each post.  
Plugins are defined in the `database/posts-plugins` directory.  
In the directory of each plugin, in the `plugin.rc` file (e.g. `database/posts-plugins/my-plugin/plugin.rc`), there is a script that generates the HTML code (`cat << EOF`).  
The variables available are:
* `post`  
	with the path to the post in the database
* `post_plugin`  
	with the path to the plugin in the database
If there is an empty `plugin-disabled` file in the plugin directory, the plugin is disabled.

### Functions
* `posts__copy_file path/to/input-file-or-dir path/to/output-file-or-dir`  
	Copies the `database/posts/POST-DIR/path/to/input-file-or-dir` file or directory  
	to the `generated/post/POST-URL/path/to/output-file-or-dir`
* `generate_post_box [no_title_link]` (for devs only)  
	Shared function located in `generate_post_box.rc`

### Settings
The settings are in the `defaults.rc.d/posts.rc`:
* `posts__generated_page_directory`  
	The name of the directory with lists of posts in the `generated` directory  
	**Warning:** must be empty or terminated with a slash
* `posts__generated_post_directory`  
	The name of the directory with generated posts in the `generated` directory  
	**Warning:** must be empty or terminated with a slash
* `posts__posts_arch_integration`  
	Post date as link  
	**Warning:** must be empty or terminated with a slash  
	Disabled if false
* `posts__posts_tags_integration`  
	Post tags as links  
	**Warning:** must be empty or terminated with a slash  
	Disabled if false
* `posts__enable_post_lists`  
	Generate lists of posts
* `posts__no_first_page_mode`  
	Use url `/post` instead of `/post/1`
* `posts__posts_per_page`  
	Number of posts per list page
* `posts__label_not_found`  
	"No posts" message generated on the first page of the list
* `posts__parallel_rendering`  
	Speed up post rendering
* `posts__list_header_content`  
	String at the beginning of each post list page
* `posts__list_footer_content`  
	String at the end of each post list page
* `posts__post_header_content`  
	String at the beginning of each post
* `posts__post_footer_content`  
	String at the end of each post
* `posts__not_found_header_content`  
	String at the top of the "No posts" page
* `posts__not_found_footer_content`  
	String at the end of the "No posts" page
* `posts__list_html_headers`  
	Add a string to the `<head>` section of each post list page
* `posts__post_html_title`  
	Set post page `<title>`
* `posts__list_html_title`  
	Set the `<title>` of the post list page

### API
The template must provide resources `posts-content.rc` and `posts-pages.rc`.  
The post `meta.rc` file provides variables:
* `posts__post_id` (can be empty)
* `posts__post_title` (can be empty)
* `posts__post_date` (can be empty)
* `posts__post_tags` (can be empty)

If this is a post page, the `template__no_title_link` variable is `true`.  
If this is a post list page, the `posts__counted_pages` and `current_page_number` variables are not empty and contains an integer (`posts-pages.rc`).  
The `posts-content.rc` file must implement the `posts__posts_arch_integration` and `posts__posts_tags_integration` settings.  
The `posts-content.rc` file must contain a `. "${post}/content.rc"` statement.  
The `posts-content.rc` file must implement `if "${posts__post_plugins}" && "${template__no_title_link}"; then for post_plugin in ${SSG__database}/${posts__plugins_dbdir}/*/plugin.rc; do`
The `posts-pages.rc` file must implement the `posts__no_first_page_mode` setting.  
The template must provide a way to override the default post box HTML via a `${post}/template-post-box.rc` file.  
The template must provide a way to override the default HTML of the post plugin box via a `${post}/template-plugin-box.rc` file.

### Default module
The module can be set as a home page.  
Set `defaults__home_module='posts'` in the `database/defaults.rc.d/defaults.rc` file.  
**Warning:** the `posts__enable_post_lists` option must be active.
