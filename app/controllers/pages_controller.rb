class PagesController < ApplicationController
  def home
    @rates = Rate.all
  end
end
