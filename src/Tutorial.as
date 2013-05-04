package {
	import flash.display.Sprite;
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
		[Embed(source = "Tutorial\\items.png")] public static var itemsTiles:Class;
		[Embed(source = 'Tutorial\\top-tile.png')] public static var topTiles:Class;
		[Embed(source = "Tutorial\\ground.csv", mimeType="application/octet-stream")] public static var Ground:Class;
		[Embed(source = 'Tutorial\\itemsniggas.csv', mimeType="application/octet-stream")] public static var Items:Class;
		[Embed(source = 'Tutorial\\top.csv', mimeType="application/octet-stream")] public static var Top:Class;
		
		private var texto:FlxText;
		private var player:Jugador;
		private var coin:Jugador;
		private var piso:FlxTileblock;
		private var  mapa_ground:FlxTilemap;
		private var  mapa_top:FlxTilemap;
		private var  mapa_items:FlxTilemap;
		
		
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
		  
		  
		   
		   player = new Jugador();
		   add(player);
		   
		   coin= new Jugador();
		   coin.x=168;
		   coin.y=400;
		   add(coin);
		   
		   FlxG.camera.follow(player);
		   FlxG.camera.follow(mapa_ground);
		}
		

		
		
		
		
		override public function update():void
    {
       super.update();
	   
	  
	   if(FlxG.keys.pressed("RIGHT")){
		player.play("taran");
		player.x+=1.5;
	   }
	   if(FlxG.keys.pressed("LEFT")){
		player.play("taran");
		player.x-=1.5;
	   }
	   if(FlxG.keys.pressed("SPACE")){
		player.play("taran");
		
		player.y-=4;
	   }
	  
	  if(FlxG.keys.pressed("DOWN")){
		player.play("taran");
		player.y+=3;
	   }
	   
	   if(FlxG.overlap(coin,player)){
		coin.kill();
	   }
	   
	   
	   
	   player.velocity.y=50;
	   player.acceleration.y = 1200;
	   FlxG.collide(player,mapa_ground)
	   //FlxG.collide(player,mapa_items);
	   
	   
    }
		
	}
}