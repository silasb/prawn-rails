require "prawn-rails/prawn_renderer"

module PrawnRails
  class Engine < Rails::Engine
    ActionController::Renderers.add :pdf do |pdf, options|
      filename = options.delete :filename
      template = options.delete :template

      filename = filename || template
      template = File.open(File.join(Rails.root, 'app', 'views', filename)).read

      page_layout = options.delete :page_layout

      pdf = ::Prawn::Document.new({ page_layout: page_layout })
      eval(template)

      default_options = {
        type: Mime::PDF,
        disposition: :inline,
      }

      default_options.merge!(options)

      send_data pdf.render, default_options
    end

    Mime::Type.register_alias("application/pdf", :pdf) unless Mime::Type.lookup_by_extension(:pdf)
  end
end
