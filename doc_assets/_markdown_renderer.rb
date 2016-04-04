class MarkdownRenderer < Redcarpet::Render::HTML
  def block_code(code, language)
    formatter = Rouge::Formatters::HTML.new(wrap: false)
    if language and language.include?('example')
      lexer = Rouge::Lexer.find('html')
      <<-EOS
          </div><!-- end of .pepagram-utility-layout -->
        </div><!-- end of .pepagram-content -->
        <div class="pepagram-example">
          <div class="pepagram-utility-layout">
            <div class="pepagram-example__preview">
              #{code}
            </div>
            <div class="pepagram-example__code">
              <pre>#{formatter.format(lexer.lex(code))}</pre>
            </div>
          </div>
        </div>
        <div class="pepagram-content">
          <div class="pepagram-utility-layout">
      EOS
    else
      lexer = Rouge::Lexer.find_fancy('guess', code)
      <<-EOS
          </div><!-- end of .pepagram-utility-layout -->
        </div><!-- end of .pepagram-content -->
        <div class="pepagram-example">
          <div class="pepagram-utility-layout">
            <div class="pepagram-example__code">
              <pre>#{formatter.format(lexer.lex(code))}</pre>
            </div>
          </div>
        </div>
        <div class="pepagram-content">
          <div class="pepagram-utility-layout">
      EOS
    end
  end

  def normal_text(text)
    text.gsub(/\[color:([\$0-9a-zA-Z-]*)\:(#([\da-fA-F]{6}|[\da-fA-F]{3}))\]/) do
      <<-EOS
        <div class="pepagram-colortip" style="background-color: #{$2};">
          <div class="pepagram-colortip__variable">
            #{$1}
          </div>
          <div class="pepagram-colortip__colorcode">
            #{$2}
          </div>
        </div>
      EOS
    end
  end
end
