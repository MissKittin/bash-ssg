# Templates module - Bash SSG
Provides centralized template management.  
The functions of this module are called in dependent modules or manually by the user.  
The contents of the template are printed to standard output,  
and all messages are printed to standard error.

### Functions
* `template__get_part template-name ...args`  
	Passes control to the main script from selected template (`template-name/template.rc`).  
	It also sets the `${template_location}` variable with the template location (`/path/to/database/templates/template-name` or `/path/to/modules/templates/template-name`).  
	First looks for a template in `database/templates`. If not found, looks in `modules/templates`.  
	**Hint:** to override template, copy template directory from `modules/templates` to the `database/templates` and edit.
* `templates__current_get_part ...args`  
	Shortcut to `template__get_part ${templates__template} ...args`.  
	For more info see `defaults.rc.d/a_templates.rc`.

### Settings
**Note:** module settings are prefixed with `templates__` and template settings are prefixed with `template__`

The settings for this module are in the `defaults.rc.d/a_templates.rc`:
* `templates__template`  
	Name of the selected template (directory name)
* `templates__dbdir`  
	Name of the module directory in the database  
	**Warning:** must be empty or terminated with a slash

Sample template settings are in the `defaults.rc.d/a_template.rc`:
* `template__generated_assets_directory`  
	Assets directory name in the `generated` directory  
	**Warning:** must be empty or terminated with a slash
* `template__html_lang`  
	Default `<html lang="${template__html_lang}">`  
	**Note:** you can change this value anywhere
* `template__html_title`  
	Default `<title>${template__html_title}</title>`  
	**Note:** you can change this value anywhere
* `template__site_title`  
	Stores the original page title

### API
Standard API is provided by template:
* `top`  
	Top of page (HTML headers and opening `<body>` tag) 
	`templates__current_get_part 'top' >> './output-file.html'`
* `resource res-name`  
	Templates for dependent modules  
	`templates__current_get_part 'resource' 'res-name' >> './output-file.html'`
* `bottom`  
	Bottom of the page (footer and closing tags)  
	`templates__current_get_part 'bottom' >> './output-file.html'`

### Default module
**This module cannot be set as home page!**
