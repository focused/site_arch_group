module ApplicationHelper
  def unwrap_tag(text, tag = p)
    text.sub(/\A[<]p[>]/, '').sub(/[<]p[>]\z/, '')
  end
end
