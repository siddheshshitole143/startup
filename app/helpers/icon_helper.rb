# app/helpers/icon_helper.rb
module IconHelper
  ALLOWED_STYLES = %w[fas far fab].freeze
  NAME_RX = /\A[a-z0-9-]+\z/i

  def fa_icon(style: "fas", name:, extra: nil)
    style = ALLOWED_STYLES.include?(style) ? style : "fas"
    name  = NAME_RX.match?(name.to_s) ? name.to_s : "cog"
    classes = [style, "fa-#{name}", extra].compact.join(" ")
    content_tag(:i, "", class: classes, aria: { hidden: true })
  end
end
