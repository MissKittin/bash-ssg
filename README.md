# Bash SSG
The modular static site generator written in bash (also works with dash).   
Reads files from the `database` directory and renders to the `generated` directory.

### How to use
1) run `./generate` - the `database` directory will be created by firstrun module
2) open `database` directory
3) create first page:
	* in `pages/sample-page/index.rc` is the page definition
	* in `pages/sample-page/entrypoint.rc` are names of the scripts that will be rendered
	* `pages/sample-page/square.css` is a sample file for testing the `pages__copy_file` function called from `index.rc`
	* `pages/home` is an example home page
4) create first post:
	* example post directory name is `public_0000001_sample-post`, where  
		`public` tells the `posts` module that the post is published  
		`0000001` is queue number  
		and `sample-post` is the link to the post (here: /post/sample-post)
	* in `posts/public_0000001_sample-post/content.rc` is the content of the post
	* in `posts/public_0000001_sample-post/meta.rc` are the post metadata
	* there are empty files in `posts/public_0000001_sample-post/tags` for `posts` and `posts-tags` modules, only file name is processed
5) create first post plugin:
	* everything is described in `posts-plugins/sample-plugin/plugin.rc`
	* plugins are displayed under each post
6) put static files in the `static` directory
7) edit files in the `templates` directory
8) edit the settings in `defaults.rc.d`

### Settings
The main `generate` script defines global variables for all modules - you can edit this, also you can change shebang in this file.  
Modules reads the default settings from `modules/*/defaults.rc.d` - do not edit these files. Just copy the chosen config file to the `database/defaults.rc.d` and edit - files from the `database` directory has higher priority than configs from `modules`.  
The main settings are defined in `database/defaults.rc.d/defaults.rc` - do not delete this file.  
You can create `bin` directory and put binaries or links in it (see main `generate` script).

### Basic modules
* `pages` - for generating static pages
* `templates`

### Additional modules
* `firstrun` - unpacks the default database
* `posts` - renders blog posts
* `posts-tags` - extension of the `posts` module which renders lists of all tags
* `static` - copies static files
* `sitemap` - generates sitemap.xml
* `minify` - css, js and html minifier
* `gzip` - compresses all generated css, js and html files

### Libraries
* `import-defaults` - imports all variables in `database/defaults.rc.d`
* `import-includes` - imports all functions from `modules/*/include.rc`

### How to create module
1) open `modules` directory
2) create a directory with the module name
3) create a `generate` or `include.rc` file
	* the `generate` file is executed by main `generate` script (must be executable)
	* `include.rc` is imported by `lib/import-includes` - put functions that will be used by other modules
	* put modules dependencies in `dependencies` file
	* put the names of the used utils (eg. sed or mkdir) in the `command-stack` - this file will be checked by the main `generate` script
4) you can create `defaults.rc.d/your-module-name.rc` with module configuration (this file will not be imported automatically)
