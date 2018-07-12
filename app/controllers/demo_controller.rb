class DemoController < ApplicationController
  def server
    features = [1, 2].map do |i|
      Feature.new(flag: i, entity: params[:id])
    end

    render locals: { features: features }
  end

  def client
  end
end
