# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def render_version
    "v1.0"
  end
  
  def render_user_image(user)
    unless user == nil
      if user.image.blank?
        image_tag "/images/users/nobody.jpg", :id => "user_photo"
      else
        image_tag "/images/users/#{user.image}", :id => "user_photo"
      end
    end
  end
  
  def render_formatting_help
    
      content_tag :div, 
      "<b>Formatação de texto</b>
    		<hr/>
    		Comentários usam código simples e fáceis de escrever para formatar seu texto. <br/>
    		Adicione os códigos em seu texto e o resultado aparecerá após você salvar. <br/>
    		Seguem alguns exemplos: <br/>
    		*negrito* → <b>negrito</b> <br/>
    		_itálico_ → <i>itálico</i> <br/><br/>
		
    		Consulte o <a href='/formatting_guide.html' target='_blank'>guia de formatação</a> para saber como criar listas, cabeçalhos e mais.
  		", :id => "tip"
  	
	end
	
	def hash_colors(list)
	 colors = [['3366FF','66CCFF'],
	                ['660033','FF9999'],
	                ['FF0033','FF9999'],
	                ['996600','999900'],
	                ['666600','66CC00'],
	                ['000000','EFEFEF'],
	                ['000066','0099CC'],
	                ['9900CC','9999FF'],
	                ['FF00CC','FFCCFF'],
	                ['FF6600','FFFF99'],
	                ['CCCCCC','FFFFFF'],
	                ['663333','999966']]
	  
	  hash_colors = {}
	  list.each_with_index do |value,key| 
	    hash_colors[name] = colors[key]
	  end
	  
	end
  
end
