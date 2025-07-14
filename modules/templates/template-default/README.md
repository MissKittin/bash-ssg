# Default template for Bash SSG
All files in `js` and `css` directory will be merged to `assets/template-default.js` and `assets/template-default.css` files.  
If you want include other files, use `static` module.

* `css` - styles
* `js` - scripts
* `parts` - HTMLs: top and bottom part
* `resources` - middle parts for modules
* `template.rc` - script that setups template in `generated` directory, condenses scripts and styles and prints template parts and resources

### Resources
This template supports the following modules:
* posts  
	**hint:** you can overwrite the post div HTML code by creating an `template-post-box.rc` file in the post directory (see `resources/posts-content.rc`) but be careful with this because you may break it  
	**hint:** you can overwrite the plugin divs HTML code by creating an `template-plugin-box.rc` file in the post directory (see `resources/posts-content.rc`) but be careful with this because you may break it
* posts-arch
* posts-tags

### Patching template
Create `database/templates/template-default.patches`, place new files in this directory (keep template's directory tree) and edit.
