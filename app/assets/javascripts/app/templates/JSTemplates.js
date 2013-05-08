this["JST"] = this["JST"] || {};

this["JST"]["./app/assets/javascripts/app/templates/scientist-index.handlebars"] = function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<h1 class=\"grid__item one-whole\">Listing scientists</h1>";
  };

this["JST"]["./app/assets/javascripts/app/templates/scientist-profile.handlebars"] = function (Handlebars,depth0,helpers,partials,data) {
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
  buffer += "\n		<article id=\"scientist__summary\" class=\"profile__summary\">\n			<h3>Summary:</h3>\n			<p>\n				";
  stack2 = ((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.summary)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1);
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n			</p>\n		</article>\n		";
  return buffer;
  }

  buffer += "<div class=\"mainContent--site grid\">\n	<div class=\"profile__head\" style=\"\">\n		<article class=\"grid__item one-quarter portable-one-whole\">\n			<img src=\""
    + escapeExpression(((stack1 = ((stack1 = ((stack1 = depth0.picture),stack1 == null || stack1 === false ? stack1 : stack1.picture)),stack1 == null || stack1 === false ? stack1 : stack1.url)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\" class=\"profile__img\">\n\n			<div class=\"bb-inedit\">\n				<span class=\"bb-inedit__open\">\n					<a href=\"#\" class=\"button--red bb--edit\">\n						<i class=\"icon-picture\"></i> Change Picture\n					</a>\n				</span>\n				<span class=\"bb-inedit__field\">\n					<input type=\"file\" id=\"profile__img\" style=\"width:90px;\">\n					<a href=\"#\" class=\"bb--close button--blue\">\n						<i class=\"icon-save\"></i>\n					</a>\n				</span>\n			</div>\n\n		</article>\n\n		<section class=\"profile__name grid__item three-quarters lap-one-whole\">\n			<div class=\"bb-inedit\">\n				<span class=\"bb-inedit__open\">\n					<h1 style=\"display:inline-block\">\n						<span name=\"first_name\">";
  if (stack2 = helpers.first_name) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.first_name; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "</span>\n						<span name=\"last_name\">";
  if (stack2 = helpers.last_name) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.last_name; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "</span>\n					</h1>\n					<a href=\"#\" class=\"button--blue bb--edit\">\n						<i class=\"icon-edit icon-small\"></i>\n					</a>\n				</span>\n				<span class=\"bb-inedit__field\">\n					<input type=\"text\" id=\"profile_first_name\" name=\"first_name\" placeholder=\"First Name\" value=\"";
  if (stack2 = helpers.first_name) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.first_name; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "\">\n					<input type=\"text\" id=\"profile_last_name\" name=\"last_name\"  placeholder=\"Last Name\" value=\"";
  if (stack2 = helpers.last_name) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.last_name; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "\">\n					<a href=\"#\" class=\"bb--close button--blue\">\n						<i class=\"icon-save\"></i>\n					</a>\n				</span>\n			</div>\n\n			<h2>";
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
  buffer += "\n				</ul>\n			</article>\n		</section>\n	</div>\n	<section class=\"profile__contact grid__item one-third portable-one-whole\">\n\n		<article class=\"profile__address grid__item one-whole lap-one-half palm-one-whole\">\n			<h3>Location Information</h3>\n			"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.company)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "<br>\n			"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.address1)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "<br>\n			"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.address2)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "<br>\n			"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.city)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + ", "
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.state)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + " "
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.zip_code)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + " USA\n		</article>\n\n		<article class=\"profile__location grid__item one-whole lap-one-half palm-one-whole\">\n			<h3>Contact Information</h3>\n			Primary Number: "
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.phone1)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "<br>\n			"
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.phone2_type)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + ": "
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.phone2)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "<br>\n			E-Mail: "
    + escapeExpression(((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.email)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "<br>\n		</article>\n\n	</section>\n\n	<section class=\" profile__bio grid__item two-thirds lap-one-whole\">\n\n		<article class=\"profile__emphasis\">\n			<h3>Research Emphasis:</h3>\n			<p>\n				";
  stack2 = ((stack1 = ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.emphasis)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1);
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n			</p>\n		</article>\n\n		";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.profile),stack1 == null || stack1 === false ? stack1 : stack1.summary), {hash:{},inverse:self.noop,fn:self.program(5, program5, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n\n	</section>\n\n	"
    + "\n		"
    + "\n	"
    + "\n	"
    + "\n\n</div>";
  return buffer;
  };

this["JST"]["./app/assets/javascripts/app/templates/scientist_card.handlebars"] = function (Handlebars,depth0,helpers,partials,data) {
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