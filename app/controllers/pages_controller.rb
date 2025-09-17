class PagesController < ApplicationController

  def home
    @about_us = About.first
    @services = Service.all
  end

  def about
  end

  def services
  end

  def team
  end

  def price
  end

  def contact
  end

  def blog
  end

  def detail
  end

  def feature
  end

  def quote
  end

  def service
  end

   def testimonials; end


end
