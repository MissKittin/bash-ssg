# Bash SSG
The modular static site generator written in bash (also works with dash and BusyBox ash).  
Reads files from the `database` directory and renders to the `generated` directory.

### Running on Windows
You need to find a BusyBox binary compiled for Windows.  
You can find it e.g. [here](https://frippery.org/busybox/index.html).  
Create a `bin` directory and put the `busybox.exe` in it.  
Follow the instructions below, and then instead of the last step, execute in the command line:
```
bin\busybox.exe sh generate
```
By the way, you can check the results of your work by issuing a command:
```
bin\busybox.exe httpd -f -vv -p 127.0.0.1:8080 -h generated
```

### How to use
1. rename the `database.example` directory to `database` and open it
2. create first page:
	* in `pages/sample-page/index.rc` is the page definition
	* in `pages/sample-page/entrypoint.rc` are names of the scripts that will be rendered
	* `pages/sample-page/assets/square.css` is a sample file for testing the `pages__copy_file` function called from `index.rc`
	* `pages/home` is an example home page
3. create first post:
	* example post directory name is `public_0000001_sample-post`, where  
		`public` tells the `posts` module that the post is published  
		`0000001` is queue number (you can change it to date e.g. `yyyymmddhhmmss`)  
		and `sample-post` is the link to the post (here: `/post/sample-post`)
	* in `posts/public_0000001_sample-post/content.rc` is the content of the post
	* in `posts/public_0000001_sample-post/meta.rc` are the post metadata
	* `posts/public_0000001_sample-post/assets/post-font.css` is a sample file for testing the `posts__copy_file` function called from `meta.rc`
	* there are empty files in `posts/public_0000001_sample-post/tags` for `posts`, `posts-arch` and `posts-tags` modules, only file name is processed
	* empty file `posts/public_0000001_sample-post/arch_2020-12-21` has date for `posts-arch` module in `arch_YYYY-MM-DD` format, only file name is processed
	* if you want to hide the post change the `public_` prefix to `hidden_` - the post will still be available but will not appear on the list of posts, archives and tags
	* and if you want to unpublish the post, change the `public_` prefix to anything you like, e.g. `draft_`
4. create first post plugin:
	* everything is described in `posts-plugins/sample-plugin/plugin.rc`
	* remove `posts-plugins/sample-plugin/plugin-disabled` to enable this plugin
	* plugins are displayed below each post on the specific post page
5. put static files in the `static` directory and replace `database/static/assets/favicon.ico`  
	**warning:** be careful with dotfiles - if you remove them from `database/static`, they may still remain in the `generated` directory  
	this is the intended action to be able to add VCS to this directory
6. edit files in the `templates` directory  
	you can also add custom templates to this directory (e.g. `database/templates/my-template`)
7. edit the settings in `defaults.rc.d`
8. if you want to run something before generating, enter the commands into the `database/generate-hooks/pre-generate.rc`  
	before exiting it looks for the `database/generate-hooks/post-generate.rc` file
9. run `./generate`  
	if you want to log the output, run `./generate > bash-ssg-generate.log 2>&1`

### Settings
The main `generate` script defines global variables for all modules - if you need, copy this block, paste to the `database/defaults.rc.d/defaults.rc` and edit. You can change shebang in this file.  
Modules reads the default settings from `modules/*/defaults.rc.d` - do not edit these files. Just copy the chosen config file to the `database/defaults.rc.d` and edit - files from the `database` directory has higher priority than configs from `modules`.  
The main settings are defined in `database/defaults.rc.d/defaults.rc` - do not delete this file.  
You can create `bin` directory and put binaries or links in it (see main `generate` script).

### Server-side rendering
You can combine static pages with a programming language that can be embedded in HTML (e.g. PHP).  
All you need to do is change the option in `database/defaults.rc.d/defaults.rc`:
```
defaults__default_file_extension='.php'
```
and insert the PHP code e.g:
```
defaults__url_prefix="<?php echo (empty(\$_SERVER['HTTPS']) ? 'http' : 'https').'://'.\$_SERVER['HTTP_HOST']; ?>"
```

### Basic modules
* `templates`
	* `template-default`
	* `template-default-nojs`

### Additional modules
* `pages` - for generating static pages
* `posts` - renders blog posts
* `posts-arch` - extension of the `posts` module which renders lists of posts for specific dates
* `posts-rss` - extension of the `posts` module which renders RSS feed
* `posts-tags` - extension of the `posts` module which renders lists of all tags
* `static` - copies static files
* `sitemap` - generates `sitemap.xml`
* `minify` - `css`, `js` and `html` minifier
* `gzip` - compresses all generated `css`, `js`, `html` and `xml` files

### Libraries
* `import-defaults.rc` - imports all variables from `database/defaults.rc.d`
* `import-includes.rc` - imports all functions from `modules/*/include.rc`

### How to create module
1. open `modules` directory or create one in the `database` directory
2. create a directory with the module name
3. create a `generate` or `include.rc` file
	* the `generate` file is executed by main `generate` script (must be executable)  
		**warning:** include library `import-includes.rc` before `import-defaults.rc`
	* `include.rc` is imported by `lib/import-includes.rc` - put functions that will be used by other modules  
		**warning:** never include `import-includes.rc` and `import-defaults.rc` in `include.rc`
	* put the names of the used utils (eg. sed or mkdir) in the `command-stack` - this file will be checked by the main `generate` script
4. you can create `defaults.rc.d/your-module-name.rc` with module configuration (this file will not be imported automatically)

### Performance
There isn't. Test it - maybe it will be fast enough for you.
