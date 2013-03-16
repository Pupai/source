package {
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;
	import org.flixel.FlxCamera;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxTileblock;
	import org.flixel.FlxButton;
	/**
	 * @author ieiomeli
	 */
	
	import flash.events.MouseEvent;
 
    import org.flixel.FlxG;
    import org.flixel.FlxSprite;
    import org.flixel.FlxState;
    import org.flixel.FlxText;
	
	public class Tutorial extends FlxState{
		
		[Embed(source = "Tutorial\\ground-tile.png")] public static var groundTiles:Class;
		[Embed(source = "Tutorial\\escalera.png")] public static var itemsTiles:Class;
		[Embed(source = 'Tutorial\\top-tile.png')] public static var topTiles:Class;
		[Embed(source = "Tutorial\\ground.csv", mimeType="application/octet-stream")] public static var Ground:Class;
		[Embed(source = 'Tutorial\\escalera.csv', mimeType="application/octet-stream")] public static var Items:Class;
		[Embed(source = 'Tutorial\\top.csv', mimeType="application/octet-stream")] public static var Top:Class;
		
		private var texto:FlxText;
		private var player:Jugador;
		private var pared:FlxTileblock;
		private var escalera:FlxTileblock;
		private var trampadelmal:FlxTileblock;
		private var  mapa_ground:FlxTilemap;
		private var  mapa_top:FlxTilemap;
		private var  mapa_items:FlxTilemap;
		private var camera:FlxCamera;
		private var crate:Item;
		var _jump:Number = 0;
		
		 public function Tutorial()
        {
            super();
        }
		
		
		 override public function create():void
        {
            /*var s:FlxSprite = new FlxSprite();
			s.makeGraphic(FlxG.width, FlxG.height, 0xFFFF50);
            add(s);*/

 			texto=new FlxText(0, 50, FlxG.width, "Tutorial").setFormat(null, 21, 0xFFF3030, "center");
			
			mapa_top =  new FlxTilemap();
			mapa_top.loadMap(new Top(), topTiles,45,32);
         	add(mapa_top);
         	
			
			mapa_items =  new FlxTilemap();
			mapa_items.loadMap(new Items(), itemsTiles,45,32);
         	add(mapa_items);
			
			mapa_ground =  new FlxTilemap();
			mapa_ground.loadMap(new Ground(), groundTiles,45,32);
         	add(mapa_ground);
			
         	 
			
           add(texto);
		  
		   pared = new FlxTileblock(0, 0, 1, 544);
		   pared.alpha=0;
		   pared.makeGraphic(1, 544);
		   add(pared);
		   escalera = new FlxTileblock(585, 129, 45, 224);
		   escalera.alpha=0;
		   escalera.makeGraphic(45, 224);
		   add(escalera);
		   crate=new Item("Tutorial\\crate.png",45,32,300,415);
		   crate.acceleration.y=1000;
		   trampadelmal = new FlxTileblock(586, 118, 45, 32);
		   trampadelmal.alpha=0;
		   trampadelmal.makeGraphic(45, 32);
		   add(trampadelmal);
		   add(crate);
		   player = new Jugador();
		   
		   add(player);
		   
		   //camera=new FlxCamera(-100, 100, 770, 544);
		   FlxG.camera.setBounds(0,0,765,544);
		   FlxG.camera.follow(player);
		   FlxG.worldBounds=new FlxRect(0,0,765,544);
		   
		}
		

		
		
		
		
		override public function update():void
    {
       super.update();
	   
	   
	   if(FlxG.keys.pressed("RIGHT")){
		player.play("right");
		player.x+=1.5;
	   }
	   if(FlxG.keys.pressed("LEFT")){
		player.play("left");
		player.x-=1.5;
	   }
	   if(FlxG.keys.pressed("SPACE")){
		player.y-=4;
	   }
	  
	  if(FlxG.keys.pressed("DOWN")){
		player.y+=3;
	   }
	   
	   if(FlxG.keys.pressed("A")){
		
		if(FlxG.keys.pressed("RIGHT")){
			
			player.x+=2;
			//player.acceleration.x*2;
		}
		if(FlxG.keys.pressed("LEFT")){
			player.x-=2;
		}
		
	   }
	   
	   
	   
	   
	   //player.velocity.y=50;
	   
	   if(!FlxG.collide(player,mapa_ground) && !FlxG.overlap(player,escalera)){
		player.acceleration.y = 850;
	   }
	   FlxG.collide(player,pared);
	   FlxG.collide(mapa_ground,crate);
	   if(FlxG.collide(crate,player) && !FlxG.collide(mapa_ground,crate)){
		
			if(FlxG.keys.pressed("RIGHT")){
				crate.x+=0.5;
			}
			if(FlxG.keys.pressed("LEFT")){
				crate.x-=0.5;
			}
	   }
	   if(FlxG.overlap(player,escalera)){
		player.play("climb");
			if(FlxG.keys.pressed("UP")){
				player.acceleration.y=0;
				player.velocity.y=0;
				
				player.y-=2;
			}
			if(FlxG.keys.pressed("DOWN")){
				player.acceleration.y=0;
				player.velocity.y=0;
			
				player.y+=2;
			}
	   }
	  	if(FlxG.collide(player,trampadelmal)){
			player.acceleration.y+=200;
			player.maxAngular=400;
			player.angularAcceleration=200;
			escalera.kill();
	   }
	   if(player.angularVelocity>200 ){
			player.kill();
	   }
	//FlxG.collide(crate,player) ;
	   //FlxG.collide(player,mapa_items);
	   
	   
    }
		
	}
}