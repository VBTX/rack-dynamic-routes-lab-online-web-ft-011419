class Application
  attr_accessor :item
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    @@items.each do |item|

    if req.path == "/items/#{item}"
      resp.write item.price
    else
      resp.write "Item not found"
      resp.status = 404
    end
  end
    resp.finish
  end
end
