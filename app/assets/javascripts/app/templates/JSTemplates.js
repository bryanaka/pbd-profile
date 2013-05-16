this["JST"] = this["JST"] || {};

this["JST"]["scientists/scientist-index"] = function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n	<article class=\"scientistUnit grid__item\" id=\"scientist--"
    + escapeExpression(((stack1 = depth0.slug),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\">\n		<div class=\"scientistCard\">\n			<a href=\"/scientists/"
    + escapeExpression(((stack1 = depth0.id),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\" class=\"navigate-profile\" >\n				<span class=\"scientistCard__name\">"
    + escapeExpression(((stack1 = depth0.first_name),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + " "
    + escapeExpression(((stack1 = depth0.last_name),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span><br>\n				<img src=\""
    + escapeExpression(((stack1 = ((stack1 = ((stack1 = depth0.picture),stack1 == null || stack1 === false ? stack1 : stack1.picture)),stack1 == null || stack1 === false ? stack1 : stack1.url)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\" class=\"scientistCard__thumb\">\n			</a>\n			<section class=\"scientistCard__buttonGroup\">\n				"
    + "\n				<a href=\"/scientists/"
    + escapeExpression(((stack1 = depth0.id),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\" class=\"button--blue navigate-profile\">\n					Edit\n				</a>\n				"
    + "\n				"
    + "\n			</section>\n		</div>\n	</article>\n";
  return buffer;
  }

  buffer += "<h1 class=\"grid__item one-whole\">Edit Scientists</h1>\n\n";
  stack1 = helpers.each.call(depth0, depth0.scientists, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  return buffer;
  };

this["JST"]["scientists/scientist-profile"] = function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n							<li>";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.title; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</li>\n						";
  return buffer;
  }

function program3(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n						<li><a href=\"";
  if (stack1 = helpers.url) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.url; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">";
  if (stack1 = helpers.name) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.name; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</a></li>\n					";
  return buffer;
  }

function program5(depth0,data) {
  
  var buffer = "", stack1, stack2;
  buffer += "\n		<article id=\"scientist__summary\" class=\"profile__summary\">\n			<h3>Summary:</h3>\n			<div contenteditable=\"true\" id=\"profile_summary\" class=\"inline-editable\">\n				";
  stack2 = ((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.summary)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1);
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n			</div>\n		</article>\n		";
  return buffer;
  }

  buffer += "<div class=\"mainContent--site grid\">\n	<div class=\"profile__head\" style=\"\">\n		<article class=\"grid__item one-quarter portable-one-whole\">\n			<img src=\""
    + escapeExpression(((stack1 = ((stack1 = ((stack1 = depth0.picture),stack1 == null || stack1 === false ? stack1 : stack1.picture)),stack1 == null || stack1 === false ? stack1 : stack1.url)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\" class=\"profile__img\">\n				<input type=\"file\" id=\"profile__img\" style=\"width:90px;\" value=\"Upload new Picture\">\n			</div>\n\n		</article>\n\n		<section class=\"profile__name grid__item three-quarters lap-one-whole\">\n			<h1 style=\"display:inline-block\">\n				<span contenteditable=\"true\" class=\"inline-editable\" name=\"scientist_first_name\">\n					";
  if (stack2 = helpers.first_name) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.first_name; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "\n				</span>\n				<span contenteditable=\"true\" class=\"inline-editable\" name=\"scientist_last_name\">\n					";
  if (stack2 = helpers.last_name) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.last_name; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "\n				</span>\n			</h1>\n\n			<h2>";
  if (stack2 = helpers.title) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.title; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "</h2>\n			"
    + "\n			<article class=\"profile__titles grid__item one-half hidden-palm\">\n					<ul>\n						";
  stack2 = helpers.each.call(depth0, depth0.titles, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n					</ul>\n			</article>\n			<article class=\"profile__websites grid__item one-half hidden-palm\">\n				<h4>Websites:</h4>\n				<ul>\n					";
  stack2 = helpers.each.call(depth0, depth0.websites, {hash:{},inverse:self.noop,fn:self.program(3, program3, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n				</ul>\n			</article>\n		</section>\n	</div>\n	<section class=\"profile__contact grid__item one-third portable-one-whole\">\n\n		<article class=\"profile__address grid__item one-whole lap-one-half palm-one-whole\">\n			<h3>Location Information</h3><br>\n			<span contenteditable=\"true\" class=\"inline-editable\" id=\"profile_company\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.company)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span>\n			<br>\n			<span contenteditable=\"true\" class=\"inline-editable\" id=\"profile_address1\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.address1)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span>\n			<span contenteditable=\"true\" class=\"inline-editable\" id=\"profile_address2\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.address2)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span>\n			<br>\n			<span contenteditable=\"true\" class=\"inline-editable\" id=\"profile_city\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.city)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span><!-- dirty hack to display correctly\n			--><span style=\"display:inline;\">,</span>\n			<span contenteditable=\"true\" class=\"inline-editable\" id=\"profile_state\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.state)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span>\n			<span contenteditable=\"true\" class=\"inline-editable\" id=\"profile_zip_code\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.zip_code)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span>\n			<div>\n				USA\n			</div>\n		</article>\n\n		<article class=\"profile__location grid__item one-whole lap-one-half palm-one-whole\">\n			<h3>Contact Information</h3>\n			Primary Number: \n			<span contenteditable=\"true\" class=\"inline-editable\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.phone1)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span><br>\n			<span contenteditable=\"true\" class=\"inline-editable\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.phone2_type)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span>: \n			<span contenteditable=\"true\" class=\"inline-editable\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.phone2)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span><br>\n			E-Mail: \n			<span contenteditable=\"true\" class=\"inline-editable\" id=\"profile_email\">\n				<a href=\""
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.email)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.email)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a>\n			</span><br>\n		</article>\n\n	</section>\n\n	<section class=\" profile__bio grid__item two-thirds lap-one-whole\">\n\n		<article class=\"profile__emphasis\">\n			<h3>Research Emphasis:</h3>\n			<div contenteditable=\"true\" class=\"inline-editable\" name=\"scientist_profile_emphasis\">\n				";
  stack2 = ((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.emphasis)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1);
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n			</div>\n		</article>\n\n		";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.summary), {hash:{},inverse:self.noop,fn:self.program(5, program5, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n\n	</section>\n\n	"
    + "\n		"
    + "\n	"
    + "\n	"
    + "\n\n</div>";
  return buffer;
  };

this["JST"]["scientists/scientist_card"] = function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article class=\"scientistUnit grid__item\" id=\"scientist--";
  if (stack1 = helpers.slug) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.slug; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">\n	<div class=\"scientistCard\">\n		<a href=\"/scientist/<";
  if (stack1 = helpers.id) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.id; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">\n			<span class=\"scientistCard__name\">";
  if (stack1 = helpers.first_name) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.first_name; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + " ";
  if (stack1 = helpers.last_name) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.last_name; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</span><br>\n			<img src=\"";
  if (stack1 = helpers.picture_url) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.picture_url; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\" class=\"scientistCard__thumb\">\n		</a>\n		<section class=\"scientistCard__buttonGroup\">\n			"
    + "\n				"
    + "\n			<a href=\"#\" class=\"button--blue\">Edit</a>\n			"
    + "\n			"
    + "\n			<a href=\"#\" class=\"button\">Show</a>\n		</section>\n	</div>\n</article>";
  return buffer;
  };

this["JST"]["scientist-profile"] = function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n							<li>";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.title; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</li>\n						";
  return buffer;
  }

function program3(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n						<li><a href=\"";
  if (stack1 = helpers.url) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.url; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">";
  if (stack1 = helpers.name) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.name; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</a></li>\n					";
  return buffer;
  }

function program5(depth0,data) {
  
  var buffer = "", stack1, stack2;
  buffer += "\n		<article id=\"scientist__summary\" class=\"profile__summary\">\n			<h3>Summary:</h3>\n			<div contenteditable=\"true\" id=\"profile_summary\" class=\"inline-editable\">\n				";
  stack2 = ((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.summary)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1);
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n			</div>\n		</article>\n		";
  return buffer;
  }

  buffer += "<div class=\"mainContent--site grid\">\n	<div class=\"profile__head\" style=\"\">\n		<article class=\"grid__item one-quarter portable-one-whole\">\n			<img src=\""
    + escapeExpression(((stack1 = ((stack1 = ((stack1 = depth0.picture),stack1 == null || stack1 === false ? stack1 : stack1.picture)),stack1 == null || stack1 === false ? stack1 : stack1.url)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\" class=\"profile__img\">\n				<input type=\"file\" id=\"profile__img\" style=\"width:90px;\" value=\"Upload new Picture\">\n			</div>\n\n		</article>\n\n		<section class=\"profile__name grid__item three-quarters lap-one-whole\">\n			<h1 style=\"display:inline-block\">\n				<span contenteditable=\"true\" class=\"inline-editable\" name=\"scientist_first_name\">\n					";
  if (stack2 = helpers.first_name) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.first_name; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "\n				</span>\n				<span contenteditable=\"true\" class=\"inline-editable\" name=\"scientist_last_name\">\n					";
  if (stack2 = helpers.last_name) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.last_name; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "\n				</span>\n			</h1>\n\n			<h2>";
  if (stack2 = helpers.title) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.title; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "</h2>\n			"
    + "\n			<article class=\"profile__titles grid__item one-half hidden-palm\">\n					<ul>\n						";
  stack2 = helpers.each.call(depth0, depth0.titles, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n					</ul>\n			</article>\n			<article class=\"profile__websites grid__item one-half hidden-palm\">\n				<h4>Websites:</h4>\n				<ul>\n					";
  stack2 = helpers.each.call(depth0, depth0.websites, {hash:{},inverse:self.noop,fn:self.program(3, program3, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n				</ul>\n			</article>\n		</section>\n	</div>\n	<section class=\"profile__contact grid__item one-third portable-one-whole\">\n\n		<article class=\"profile__address grid__item one-whole lap-one-half palm-one-whole\">\n			<h3>Location Information</h3><br>\n			<span contenteditable=\"true\" class=\"inline-editable\" id=\"profile_company\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.company)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span>\n			<br>\n			<span contenteditable=\"true\" class=\"inline-editable\" id=\"profile_address1\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.address1)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span>\n			<span contenteditable=\"true\" class=\"inline-editable\" id=\"profile_address2\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.address2)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span>\n			<br>\n			<span contenteditable=\"true\" class=\"inline-editable\" id=\"profile_city\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.city)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span><!-- dirty hack to display correctly\n			--><span style=\"display:inline;\">,</span>\n			<span contenteditable=\"true\" class=\"inline-editable\" id=\"profile_state\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.state)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span>\n			<span contenteditable=\"true\" class=\"inline-editable\" id=\"profile_zip_code\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.zip_code)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span>\n			<div>\n				USA\n			</div>\n		</article>\n\n		<article class=\"profile__location grid__item one-whole lap-one-half palm-one-whole\">\n			<h3>Contact Information</h3>\n			Primary Number: \n			<span contenteditable=\"true\" class=\"inline-editable\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.phone1)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span><br>\n			<span contenteditable=\"true\" class=\"inline-editable\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.phone2_type)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span>: \n			<span contenteditable=\"true\" class=\"inline-editable\">\n				"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.phone2)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</span><br>\n			E-Mail: \n			<span contenteditable=\"true\" class=\"inline-editable\" id=\"profile_email\">\n				<a href=\""
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.email)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.email)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a>\n			</span><br>\n		</article>\n\n	</section>\n\n	<section class=\" profile__bio grid__item two-thirds lap-one-whole\">\n\n		<article class=\"profile__emphasis\">\n			<h3>Research Emphasis:</h3>\n			<div contenteditable=\"true\" class=\"inline-editable\" name=\"scientist_profile_emphasis\">\n				";
  stack2 = ((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.emphasis)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1);
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n			</div>\n		</article>\n\n		";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.summary), {hash:{},inverse:self.noop,fn:self.program(5, program5, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n\n	</section>\n\n	"
    + "\n		"
    + "\n	"
    + "\n	"
    + "\n\n</div>";
  return buffer;
  };