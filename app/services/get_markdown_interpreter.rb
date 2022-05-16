class GetMarkdownInterpreter

  def call
    Redcarpet::Markdown.new(CustomRender, autolink: true, fenced_code_blocks: true, tables: true)
  end
  
end
