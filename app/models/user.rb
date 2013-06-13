class User < ActiveRecord::Base
  rolify

  attr_accessible :name, :email, :eppn, :confirmed, :scientist_id

  validates_presence_of :eppn, :name, :email
	validates_uniqueness_of :eppn, :email, :name
  validates_uniqueness_of :scientist_id, :allow_nil => true, :allow_blank => true
  belongs_to :scientist

  after_create do |user|
    register_scientist!
  end

  def eppn=(eppn)
    write_attribute(:eppn, eppn.downcase)
  end

  def email=(email)
    write_attribute(:email, email.downcase)
  end

  def name=(name)
    write_attribute(:name, capitalize_all_names(name))
  end

  def is_scientist?
    !!self.scientist
  end

  def consume_shibboleth_data!(request=request)
    raise "You need to pass in the request object" if !request
    self.eppn  = request.env["HTTP_EPPN"]
    self.email = request.env["HTTP_MAIL"]
    self.name  = request.env["HTTP_CN"]  
  end

private
  
  def register_scientist!
    if !self.is_scientist?
      scientist = ScientistProfile.find_by_email(self.email)
      if scientist != nil
        self.add_role :scientist
        self.scientist_id = scientist.scientist_id
        self.confirmed = true
        self.save!
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def capitalize_all_names(name)
    parts = []
    name.sub(/\-/, "=\-").split(/\s|\-/).each do |part| 
      part.capitalize!
      parts.push(part) 
      parts
    end
    new_name = parts.join(" ").sub(/\=\s/, "-")
    new_name
  end

end
