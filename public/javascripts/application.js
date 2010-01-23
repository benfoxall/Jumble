document.observe('dom:loaded',function(){
	
	
	//make flashes able to be removed
	$$('.flash').each(function(flash){
		close = new Element('span',{'class':'close'}).update('&times;');
		close.observe('click',function(e){
			Event.element(e).up('.flash').fade({duration:.3});
		});
		flash.insert({bottom:close})
	})	
})