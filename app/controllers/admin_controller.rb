class AdminController < ApplicationController
  def score_props
    @props = Prop.needs_scoring
  end
end
