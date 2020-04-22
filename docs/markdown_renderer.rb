class MarkdownRenderer < Redcarpet::Render::HTML
  def block_code(code, language)
    formatter = Rouge::Formatters::HTML.new(wrap: false)
    if language and language.include?('example')
      lexer = Rouge::Lexer.find('html')
      <<-EOS
            </div><!-- end of .ncgr-section__inner -->
          </div><!-- end of .ncgr-section -->
        </div><!-- end of .styleguide__content -->
        <div class="ncgr-section ncgr-section--background">
          <div class="ncgr-section__inner ncgr-section__inner--narrow ncgr-pad-r-16 ncgr-pad-l-16">
            <div class="styleguide__preview">
              #{code}
            </div>
            <div class="styleguide__code">
              <pre>#{formatter.format(lexer.lex(code))}</pre>
            </div>
          </div>
        </div>
        <div class="styleguide__content">
          <div class="ncgr-section ncgr-section--background">
            <div class="ncgr-section__inner ncgr-section__inner--narrow ncgr-pad-r-16 ncgr-pad-l-16">
      EOS
    else
      lexer = Rouge::Lexer.find_fancy('guess', code)
      <<-EOS
          </div><!-- end of .ncgr-section__inner -->
        </div><!-- end of .ncgr-section -->
        <div class="ncgr-section ncgr-section--background">
          <div class="ncgr-section__inner ncgr-section__inner--narrow ncgr-pad-r-16 ncgr-pad-l-16">
            <div class="styleguide__code">
              <pre>#{formatter.format(lexer.lex(code))}</pre>
            </div>
          </div>
        </div>
        <div class="styleguide__content">
          <div class="ncgr-section ncgr-section--background">
            <div class="ncgr-section__inner ncgr-section__inner--narrow ncgr-pad-r-16 ncgr-pad-l-16">
      EOS
    end
  end

  def normal_text(text)
    text.gsub(/\[color:([\$0-9a-zA-Z-]*)\:(#([\da-fA-F]{6}|[\da-fA-F]{3}))\]/) do
      <<-EOS
        <div class="styleguide__colortip" style="background-color: #{$2};">
          <div class="styleguide__color-variable">
            #{$1}
          </div>
          <div class="styleguide__color-code">
            #{$2}
          </div>
        </div>
      EOS
    end
  end
end
