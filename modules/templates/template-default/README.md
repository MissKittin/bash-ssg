# Default template for Bash SSG
If you want include other files, use `static` module.

* `css` - styles  
	all files from this directory will be merged to `assets/template-default.css` file
* `js` - scripts  
	all files from this directory will be merged to `assets/template-default.js` file
* `parts` - HTMLs: top and bottom part
* `resources` - middle parts for modules
* `template.rc` - script that setups template in `generated` directory, condenses scripts and styles and prints template parts and resources

### Installation
Place all files in the `database/templates/template-default` directory  
or in the `modules/templates/template-default` directory  
and edit the appropriate configuration file in `database/defaults.rc.d` to activate this template.

### Resources
This template supports the following modules:
* posts  
	**hint:** you can overwrite the post div HTML code by creating an `template-post-box.rc` file in the post directory (see `resources/posts-content.rc`) but be careful with this because you may break it  
	**hint:** you can overwrite the plugin divs HTML code by creating an `template-plugin-box.rc` file in the post directory (see `resources/posts-content.rc`) but be careful with this because you may break it
* posts-arch
* posts-tags

### Patching template
Create `database/templates/template-default.patches`,  
place new files in this directory (keep template's directory tree)  
and edit.
