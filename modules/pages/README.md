# Pages module - Bash SSG
Module for generating static pages.

### How it works
Renders `*.rc` files defined in `entrypoint.rc` to the `generated` directory.  
The `entrypoint.rc` file contains calls to the `pages__render_script` and `pages__copy_file` functions.  
Each `*.rc` file (except `entrypoint.rc`) consists of:
* template settings
* `templates__current_get_part 'top'`
* page content (`cat << EOF`)
* `templates__current_get_part 'bottom'`
* optionally you can use the `pages__copy_file` function here

### Functions
* `pages__render_script path/to/input-file.rc path/to/output-file.html`  
	Renders an `database/pages/PAGE-NAME/path/to/input-file.rc` file  
	to a `generated/path/to/output-file.html` file
* `pages__copy_file path/to/input-file-or-dir path/to/output-file-or-dir`  
	Copies the `database/pages/PAGE-NAME/path/to/input-file-or-dir` file or directory  
	to the `generated/path/to/output-file-or-dir`

### Settings
The settings are in the `defaults.rc.d/pages.rc`:
* `pages__generated_directory`  
	Module directory name in the `generated` directory  
	**Warning:** must be empty or terminated with a slash
* `pages__default_page`  
	Home page directory name (without path)
* `pages__default_page_mv_all_files`  
	Move all files from `generated/page/${pages__default_page}` to `generated`, not just `index.html`
* `pages__parallel_rendering`  
	Speed up pages rendering

### Default module
The module can be set as a home page.  
Set `defaults__home_module='pages'` in the `database/defaults.rc.d/defaults.rc` file.
