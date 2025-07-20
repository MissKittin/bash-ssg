# Default template for Bash SSG - without JavaScript
**This is a `template-default` overlay and this template is required.**

* `css` - patched styles  
	all files from this directory will be merged to `assets/template-default-nojs.css` file
* `parts` - HTMLs: patched top part
* `template.rc` - script that setups template in `generated` directory, condenses styles and prints template parts and resources

### Installation
Place all files in the `database/templates/template-default-nojs` directory  
or in the `modules/templates/template-default-nojs` directory  
and edit the appropriate configuration file in `database/defaults.rc.d` to activate this template.  
**Warning:** the `template-default` must be installed in the same directory (`database/templates/template-default` or `modules/templates/template-default-nojs`).

### Patching template
Create `database/templates/template-default-nojs.patches`,  
place new files in this directory (keep template's directory tree)  
and edit.
