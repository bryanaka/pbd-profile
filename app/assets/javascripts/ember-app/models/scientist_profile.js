var ScientistProfile = DS.Model.extend({

  prefix: DS.attr('string'),

  department: DS.attr('string'),

  department_url: DS.attr('string'),

  company: DS.attr('string'),

  address1: DS.attr('string'),

  address2: DS.attr('string'),

  city: DS.attr('string'),

  state: DS.attr('string'),

  zip_code: DS.attr('number'),

  phone1: DS.attr('string'),

  phone2: DS.attr('string'),

  email: DS.attr('string'),

  summary: DS.attr('string'),

  emphasis: DS.attr('string'),
  scientist: DS.belongsTo('Scientist')


});

module.exports = ScientistProfile;

