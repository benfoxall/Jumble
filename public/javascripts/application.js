Effect.DefaultOptions.duration = 0.3;


Pie = Class.create({
	initialize:function(canvas,data){
		this.canvas = $(canvas);
		this.dims   = this.canvas.getDimensions();
		this.radius = Math.min(this.dims.width,this.dims.height)/2;
		this.update(data)
	},
	translate:function(){
		// This will do the initial translation,  and save it
		// (when I get my hands on the canvas documentation)
	},
	update:function(data){
		c = this.canvas.getContext('2d');
		
		c.fillStyle = '#fff'
		c.fillRect(0,0,this.dims.width,this.dims.height);
		
		// move to the centre,  and round a bit so that the first slice is at the bottom
		c.translate(this.dims.width/2,this.dims.height/2);
		tr = (Math.PI/2)-(Math.PI*data[0]);
		c.rotate(tr);
		
		
		
		current = 0;
		for (var i=0; i < data.length; i++) {
			// tr += current;
			c.beginPath();c.moveTo(0,0);
			c.arc(0,0,this.radius,current,current+=(data[i]*Math.PI*2),false);
			c.fillStyle = this.sliceColour(i/data.length);c.fill();
		};
		
		//move back (instead of pop for now)
		c.rotate(-tr);
		c.translate(-this.dims.width/2,-this.dims.height/2);
	},
	sliceColour:function(p){
		return 'rgb('+parseInt(p*255)+','+parseInt(136+(p*119))+',255)'
	}
});

document.observe('dom:loaded',function(){
	
	
	//make flashes able to be removed
	$$('.flash').each(function(flash){
		close = new Element('span',{'class':'close'}).update('&times;');
		close.observe('click',function(e){
			Event.element(e).up('.flash').fade();
		});
		flash.insert({bottom:close})
	})	
	
	
	if($('user_bar')){
		new Ajax.Updater('user_bar','/userbar',{onComplete:function(){
			$('user_bar').hide().appear();
			if($('login_link')){
				$('signup').hide();
				$('login').hide();
			}
		}})
	}
	
	
	// If we support canvas
	if(!!document.createElement('canvas').getContext){
		//draw charts with canvas instead
		$$('img.chart').each(function(element){
			src = element.readAttribute('src').parseQuery();
			chd = src['amp;chd'] || src['chd']
		
			series = []
			chd.gsub(/[\.\d]+/,function(point){
				series.push(point[0])
			})	
		
			if(series.length > 0){
				canvas = new Element('canvas',{width:element.getWidth(),height:element.getHeight()});
				element.replace(canvas)
				// element.insert({after:canvas})
				new Pie(canvas,series)
			}
		});
	}
});


var tog = function(from,to){
	if(from.visible()){from.blindUp();}
	if(!to.visible()){to.blindDown();}
}
document.observe('click',function(e){	
	if(e.element().identify() == 'login_link'){
		e.stop();
		tog($('signup'),$('login'))
		$('signup_link').morph({color:'#08f'});
		$('login_link').morph({color:'#444'});
	}
	if(e.element().identify() == 'signup_link'){
		e.stop();
		tog($('login'),$('signup'))
		$('login_link').morph({color:'#08f'});
		$('signup_link').morph({color:'#444'});
	}
	// return false;
});


Pie = Class.create({
	initialize:function(canvas,data){
		this.canvas = $(canvas);
		this.dims   = this.canvas.getDimensions();
		this.radius = Math.min(this.dims.width,this.dims.height)/2;
		this.update(data)
	},
	translate:function(){
		// This will do the initial translation,  and save it
		// (when I get my hands on the canvas documentation)
	},
	update:function(data){
		c = this.canvas.getContext('2d');
		
		c.fillStyle = '#fff'
		c.fillRect(0,0,this.dims.width,this.dims.height);
		
		// move to the centre,  and round a bit so that the first slice is at the bottom
		c.translate(this.dims.width/2,this.dims.height/2);
		tr = (Math.PI/2)-(Math.PI*data[0]);
		c.rotate(tr);
		
		
		
		current = 0;
		for (var i=0; i < data.length; i++) {
			// tr += current;
			c.beginPath();c.moveTo(0,0);
			c.arc(0,0,this.radius,current,current+=(data[i]*Math.PI*2),false);
			c.fillStyle = this.sliceColour(i/data.length);c.fill();
		};
		
		//move back (instead of pop for now)
		c.rotate(-tr);
		c.translate(-this.dims.width/2,-this.dims.height/2);
	},
	sliceColour:function(p){
		return 'rgb('+parseInt(p*255)+','+parseInt(136+(p*119))+',255)'
	}
});
