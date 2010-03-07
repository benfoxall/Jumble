document.observe('dom:loaded',function(){
	
	
	//make flashes able to be removed
	$$('.flash').each(function(flash){
		close = new Element('span',{'class':'close'}).update('&times;');
		close.observe('click',function(e){
			Event.element(e).up('.flash').fade({duration:.3});
		});
		flash.insert({bottom:close})
	})	
	
	


	if($('user_bar')){
		new Ajax.Updater('user_bar','/userbar',{onComplete:function(){
			$('user_bar').hide().appear({duration:0.3});
			if($('login_link')){
				var tog = function(from,to){
					if(from.visible()){from.blindUp({duration:0.3});}
					if(!to.visible()){to.blindDown({duration:0.3});}
				}

				$('login_link').observe('click',function(){
					tog($('signup'),$('login'))
					$('login_link').morph({color:'#08f'},{duration:0.3});
					$('signup_link').morph({color:'#444'},{duration:0.3});
				})
				$('signup_link').observe('click',function(){
					tog($('login'),$('signup'))
					$('signup_link').morph({color:'#08f'},{duration:0.3});
					$('login_link').morph({color:'#444'},{duration:0.3});
				})
				$('signup').hide();
				$('login').hide();
			}
		}})
	}
})
