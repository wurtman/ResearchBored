class GetEditable

  def call(shortname)
    markdown = GetMarkdownInterpreter.new.call
    markdown.render(Editable
                      .find_by(shortname: shortname)
                      .kontent
                      .gsub("\\k","\n")
                    )
  end
  
end
