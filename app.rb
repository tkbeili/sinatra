class Cookie
  attr_accessor :sugar_amount
  attr_accessor :flour_amount

  def initialize(sugar_amount, flour_amount)
    @sugar_amount = sugar_amount
    @flour_amount = flour_amount
  end

  def eat
    puts "Yummy!"
  end
end


class Oreo < Cookie
  attr_accessor :filling_amount

  def eat
    puts "Dip in milk!"
    super
  end

end

oreo = Oreo.new(10, 5)
order.filling_amount = 5
order.eat


require 'sinatra'

get "/" do
  "Hello World"
end

get "/kelly/:id" do
  "Kelly #{params[:id]}"
end