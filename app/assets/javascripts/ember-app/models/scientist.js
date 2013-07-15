var Scientist = DS.Model.extend({

	firstName:	DS.attr('string'),
	lastName:	DS.attr('string'),
	slug:		DS.attr('string'),
	visible:	DS.attr('boolean'),
	tester:     DS.attr('boolean'),
	createdAt:	DS.attr('date'),
	updatedAt:	DS.attr('date'),
	profile:	DS.belongsTo('Profile'),

	fullName: function() {
		return this.get('firstName') + ' ' + this.get('lastName');
	}.property('firstName', 'lastName')

});

module.exports = Scientist;

