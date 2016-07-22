require "bluecloth"

module ApplicationHelper

  def markdown(str)
 	raw "<div class=\"markdown_content\">#{BlueCloth.new(str).to_html}</div>"
  end
end
