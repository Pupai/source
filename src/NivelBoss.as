package {
	import org.flixel.FlxU;
	import org.flixel.system.FlxTile;
	import flash.net.dns.AAAARecord;
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
	import org.flixel.FlxGroup;
	
	
	
	
	public class NivelBoss extends FlxState{
		
		[Embed(source = "Nivel3\\tiles_pared.png")] public static var paredTiles:Class;
		[Embed(source = "Nivel3\\tiles_piso.png")] public static var groundTiles:Class;
		
		[Embed(source = "lifebar.png")] public static var barra_image:Class;
		[Embed(source = "vida.png")] public static var vida_image:Class;
		[Embed(source = "Nivel3\\entrada.png")] public static var entrada_img:Class;
		
		[Embed(source = 'Tutorial\\music.mp3')] private var sound:Class;
		
		[Embed(source = "boss\\boss_ground.csv", mimeType="application/octet-stream")] public static var Ground:Class;
		[Embed(source = "boss\\boss_pared.csv", mimeType="application/octet-stream")] public static var Pared:Class;

				
	  
		private var player:Jugador;
		private var lifebar: FlxSprite;
		private var bar0_20: FlxSprite;
		private var bar20_40: FlxSprite;
		private var bar40_60: FlxSprite;
		private var bar60_80: FlxSprite;
			
				
		private var camera:FlxCamera;
		
		private var  mapa_ground:FlxTilemap;
		private var  mapa_pared:FlxTilemap;
		
		private var entrada: FlxSprite;
		
		private var swapc: Boolean=false;

		private var timeRemaining:Number = 0; // in seconds
		private var timeRemainingDisplay:FlxText = new FlxText(5, 25, 50);

		private var counter : int=0;
		private var swap:Boolean=false;
		private var swap2:Boolean=false;
		private var paused:Boolean=true;
		private var pared1:FlxTileblock;
		private var pared2:FlxTileblock;

		
		 public function NivelBoss()
        {
            super();
        }
		
		
		 override public function create():void
        {
           	
			
		
		   mapa_pared =  new FlxTilemap();
		   mapa_pared.loadMap(new Pared(), paredTiles,45,32);
           add(mapa_pared);
			
			mapa_ground =  new FlxTilemap();
			mapa_ground.loadMap(new Ground(), groundTiles,45,32);
         	add(mapa_ground);	
			
		   lifebar=new FlxSprite(5,5,barra_image);
		   lifebar.scrollFactor.x=0;
		   lifebar.scrollFactor.y=0;
		   add(lifebar);
	   		   
		   //Vida de Pupai
		   bar0_20=new FlxSprite(53,18,vida_image);
		   bar0_20.scrollFactor.x=0;
		   bar0_20.scrollFactor.y=0;
		   add(bar0_20);
		   
		   bar20_40=new FlxSprite(73,18,vida_image);
		   bar20_40.scrollFactor.x=0;
		   bar20_40.scrollFactor.y=0;
		   add(bar20_40);
		   
		   bar40_60=new FlxSprite(93,18,vida_image);
		   bar40_60.scrollFactor.x=0;
		   bar40_60.scrollFactor.y=0;
		   add(bar40_60);
		   
		   bar60_80=new FlxSprite(113,18,vida_image);
		   bar60_80.scrollFactor.x=0;
		   bar60_80.scrollFactor.y=0;
		   add(bar60_80);
		   
		   entrada=new FlxSprite(5,188,entrada_img);
		   entrada.immovable=true;
		   add(entrada);
	   
		   pared1 = new FlxTileblock(0, 200, 2, 150);
		   pared1.alpha=100;
		   pared1.makeGraphic(2, 150);
		   add(pared1);
		   
		   pared2 = new FlxTileblock(4497, 0, 2, 450);
		   pared2.alpha=100;
		   pared2.makeGraphic(2, 450);
		   add(pared2);
		   
		   
		   player = new Jugador(20,270);
		   add(player);
			
			FlxG.playMusic(sound);
			
	
		   //mundo de 18 x 13 y Tiles de 45 x 32
		   FlxG.camera.setBounds(0,0,810,416);
		   FlxG.camera.follow(player);
		   FlxG.worldBounds=new FlxRect(0,0,810,416);	   
		}
		
		
		public function barra():void{
			if(player.health==60){
					bar60_80.exists=false;
				}
				else if(player.health==40){
					bar60_80.exists=false;
					bar40_60.exists=false;
				}
				else if(player.health==20){
					bar60_80.exists=false;
					bar40_60.exists=false;
					bar20_40.exists=false;
				}
				else if(player.health==0){
					bar60_80.exists=false;
					bar40_60.exists=false;
					bar20_40.exists=false;
					bar0_20.exists=false;
				}
		}
		
		public function bajarVida():void{
			if(player.bandera){
				barra();
				player.bandera=false;
			}
		}
		
		public function time():void{
		 timeRemaining += FlxG.elapsed;
    	 timeRemainingDisplay.text = FlxU.formatTime(timeRemaining); 
		 timeRemainingDisplay.scrollFactor.x=0;
		 timeRemainingDisplay.scrollFactor.y=0;
		 		 
		 add(timeRemainingDisplay);
		
		}
	
		override public function update():void{
		
	       super.update();
		   time();
		   
				if(FlxG.keys.justPressed("P"))
				paused = !paused;
				if(!paused)
				//texto.kill();
				if(paused){
				//texto.y=player.y-340;
				//texto.revive();
				return;
				}
  
		   //Movimientos Pupai
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
			 //trace(player.x,player.y);
		   }
		   
		   //Pupai corra
		   if(FlxG.keys.pressed("A")){
				if(FlxG.keys.pressed("RIGHT")){
				player.x+=2;
				}
				if(FlxG.keys.pressed("LEFT")){
					player.x-=2;
				}		
		   }
		   
		   //Gravedad 
		   if(!FlxG.collide(player,mapa_ground)){
				player.acceleration.y = 850;
		   }
		   //colillides 

		   FlxG.collide(player,mapa_ground);		   
	  
		   FlxG.collide(player,pared1);
		   FlxG.collide(player,pared2);
		   
		   if(bar0_20.exists == false){
				FlxG.switchState(new NivelBoss());
		   }

		   
		  }
		 }
		   
		
	   }
			
	
