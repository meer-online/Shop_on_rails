class Order < ActiveRecord::Base
  attr_accessible :shipping_name, :shipping_address, :billing_name
  attr_writer :current_step

  belongs_to :user
  has_many :line_items

  validates_presence_of :shipping_name, :if => :shipping? 
  validates_presence_of :shipping_address, :if => :shipping? 
  validates_presence_of :billing_name, :if => :billing? 

  def current_step
  	@current_step || steps.first
  end

  def steps
  	%w[shipping billing confirmation]
  end

  def next_step 
  	self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
  	self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
  	current_step = steps.first
  end

  def last_step?
  	current_step = steps.last 	
  end

  def shipping?
  	current_step == "shipping"
  end

  def billing?
  	current_step == "billing"
  end

  def all_valid?
  	steps.all? do |step|
  		self.current_step = step
  		valid?
  	end
  end
end
