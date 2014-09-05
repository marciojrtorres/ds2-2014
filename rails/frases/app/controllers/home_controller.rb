
# rails generate controller home index
class HomeController < ApplicationController
  def index
  end

  def testando
    render text: "teste, 1,2,3, teste som"
  end

end
