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

var has_run = false;
document.observe('dom:loaded',function(){
	if(has_run){return;}else{has_run = true;}
	//make flashes able to be removed
	$$('.flash').each(function(flash){
		
		if(flash.hasClassName('permanent')){return}
		
		close = new Element('span',{'class':'close'}).update('&times;');
		close.observe('click',function(e){
			Event.element(e).up('.flash').fade();
		});
		flash.insert({bottom:close})
	})	
	
	
	if($('user_bar')){
		new Ajax.Updater('user_bar','/userbar');
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

				canvas = new Element('canvas');
				$w('width height style class id').each(function(a){
					if(element.hasAttribute(a)){
						canvas.writeAttribute(a,element.readAttribute(a));	
					}
				})
				
				element.replace(canvas)
				// element.insert({after:canvas})
				new Pie(canvas,series)
			}
		});
	}
});


document.observe('click',function(e){	
	if(e.element().hasClassName('return')){
		e.stop();
		go_href = e.element().readAttribute('href');
		at_href = document.location.href;
		
		//the seperator between target and this
		sep = go_href.indexOf('?') == -1 ? '?' : '&';
		
		document.location = go_href + sep + 'return=' + at_href;
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
