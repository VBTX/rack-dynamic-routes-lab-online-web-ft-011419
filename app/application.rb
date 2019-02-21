class Application
  attr_accessor :item
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    @@items = []

    @@items.each do |item|

    if req.path.match(/items/item)
      resp.write item.price
    elsif !@@items.include?(item)
      resp.write "Item not found"
      resp.status = 400
    else
      resp.write "Route not found"
      resp.status = 404
    end
  end
    resp.finish
  end
end
