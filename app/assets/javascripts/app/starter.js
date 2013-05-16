window.App = {};

//  Backbone.oldSync = Backbone.sync;

//  Backbone.sync = function(method, model, options) {
//    var syncReturnValue;
//  
//    model.oldToJSON = model.toJSON;
//    model.toJSON = function() {
//      var json;
//  
//      json = {};
//      json[model.name] = this.oldToJSON();
//      return json;
//    };
//    syncReturnValue = Backbone.oldSync(method, model, options);
//    model.toJSON = model.oldToJSON;
//    delete model.oldToJSON;
//    return syncReturnValue;
//  };
var orgSync = Backbone.sync;
Backbone.sync = function (method, model, options) {

  var orgToJSON = model.toJSON;
  if (_.contains(['create', 'update'], method)) {

    model.toJSON = function () {
      if (model.paramRoot) {
        var data = {};
        data[model.paramRoot] = _.clone(model.attributes);
        console.log('This is the data before sync');
        console.log(data);
        return data;
      } else {
        return _.clone(model.attributes);
      }
    };
  }

  orgSync(method, model, options);
  model.toJSON = orgToJSON;
};
//events
window.Eventer = {};

App.Router = Backbone.Router.extend({
	routes:{
		"":"index",
		":id/edit":"edit-scientist",
		"new":"edit-scientist",
		":id":"edit-scientist"
	}
});

var router = new App.Router();

_.extend(Eventer, Backbone.Events);

Eventer.on("start_ckeditor", function(selector) {
	CKEDITOR.disableAutoInline = true;
	CKEDITOR.inlineAll( $(selector) );
});
