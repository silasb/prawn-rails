class PrawnRails::PrawnRenderer
  def self.call(template)
    binding.pry
    #"PrawnRails::PrawnHandler.new(self).render(#{template.source.inspect}, local_assigns)"
    #require 'prawn-rails/prawn_rails_helper'
    #::Prawn::Document.extensions<<PrawnRailsHelper
    #self.new(self).render(template.source.inspect, local_assigns)
  end
=begin

  def initialize(view)
    @view = view
  end

  def render(template, local_assigns = {})
    binding.pry

    pdf = ::Prawn::Document.new(PrawnRails.config.marshal_dump)

    eval(template)

    pdf.render
  end
=end
end
