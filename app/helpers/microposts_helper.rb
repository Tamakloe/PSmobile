module MicropostsHelper

  def wrap(content)
    sanitize(raw(content.split.map{ |s| split_str(s) }.join(' ')))
  end

  private

	def split_str(str, len = 10)
	  fragment = /.{#{len}}/
	  str.split(/(\s+)/).map! { |word|
	    (/\s/ === word) ? word : word.gsub(fragment, '\0<wbr />')
	  }.join
	end

end
