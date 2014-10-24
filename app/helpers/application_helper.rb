module ApplicationHelper
  def unwrap_tag(text, tag = p)
    text.sub(/\A[<]p[>]/, '').sub(/[<]p[>]\z/, '')
  end

  def lang_iso_fb(code = r18n.locale.code)
    {
      ru: "ru_RU",
      en: "en_US"
    }[code.to_sym]
  end
end
