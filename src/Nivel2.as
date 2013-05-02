package {
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
	
	
	
	
	public class Nivel2 extends FlxState{
		
		[Embed(source = "Nivel2\\sewer_ground.png")] public static var groundTiles:Class;
		[Embed(source = "Nivel2\\top_sewer.png")] public static var topTiles:Class;
		[Embed(source = "Nivel2\\puente.png")] public static var puente_image:Class;
		[Embed(source = "Nivel2\\pico.png")] public static var pico_image:Class;
		[Embed(source = "Nivel2\\pipe_s.png")] public static var pipe_s_image:Class;
		[Embed(source = "Nivel2\\pipe_d.png")] public static var pipe_d_image:Class;
		[Embed(source = "Nivel2\\agua_s.png")] public static var agua_s_image:Class;
		[Embed(source = "Nivel2\\agua_d.png")] public static var agua_d_image:Class;
		[Embed(source = "Nivel2\\plataforma.png")] public static var plataforma_image:Class;
		[Embed(source = "Nivel2\\entrada.png")] public static var entrada_image:Class;
		[Embed(source = "lifebar.png")] public static var barra_image:Class;
		[Embed(source = "vida.png")] public static var vida_image:Class;
		
		[Embed(source = "Nivel2\\nivel2_ground_sewer.csv", mimeType="application/octet-stream")] public static var Ground:Class;
		[Embed(source = "Nivel2\\nivel2_top_sewer.csv", mimeType="application/octet-stream")] public static var Top:Class;

		
	
		private var player:Jugador;
		private var lifebar: FlxSprite;
		private var bar0_20: FlxSprite;
		private var bar20_40: FlxSprite;
		private var bar40_60: FlxSprite;
		private var bar60_80: FlxSprite;
		
		private var perro:Perro;
		private var camera:FlxCamera;
		
		private var  mapa_ground:FlxTilemap;
		private var  mapa_top_ground:FlxTilemap;
		
		private var piso:FlxTileblock;
		
		private var pico1: FlxSprite;
		private var pico2: FlxSprite;
		
		private var pipe_s1: FlxSprite;
		private var agua_s1: FlxSprite;
		private var pipe_d1: FlxSprite;
		private var agua_d1: FlxSprite;
		
		private var plat1: FlxSprite;
		
		private var puente1: FlxSprite;
		
		private var entrada: FlxSprite;
		private var entrada_gips:FlxTileblock;

		var counter : int=0;
		
		var swap:Boolean=false;
		var swap2:Boolean=false;
		
		var paused:Boolean=true;

		var c:Number=0;
		
		 public function Nivel2()
        {
            super();
        }
		
		
		 override public function create():void
        {
           		
			
			mapa_ground =  new FlxTilemap();
			mapa_ground.loadMap(new Ground(), groundTiles,45,32);
         	add(mapa_ground);
			
			mapa_top_ground =  new FlxTilemap();
			mapa_top_ground.loadMap(new Top(), topTiles,45,32);
         	add(mapa_top_ground);			
  			
			//PICOS
		   pico1=new FlxSprite(1800,350,pico_image);
		   pico1.immovable=true;
		   add(pico1);
		   
		   pico2=new FlxSprite(1750,350,pico_image);
		   pico2.immovable=true;
		   add(pico2);
		   
		   //PIPES
		   pipe_s1=new FlxSprite(900,472,pipe_s_image);
		   pipe_s1.immovable=true;
		   add(pipe_s1);
		   agua_s1=new FlxSprite(901,488,agua_s_image);
		   agua_s1.immovable=true;
		   add(agua_s1);
		   
		   pipe_d1=new FlxSprite(800,472,pipe_d_image);
		   pipe_d1.immovable=true;
		   add(pipe_d1);
		   agua_d1=new FlxSprite(801,488,agua_d_image);
		   agua_d1.immovable=true;
		   add(agua_d1);
		  
		   //PLATAFORMA
		   plat1=new FlxSprite(360,1057,plataforma_image);
		   plat1.immovable=true;
		   add(plat1);
		   
		   //PUENTE
		   puente1=new FlxSprite(1215,1056,puente_image);
		   puente1.immovable=true;
		   add(puente1);
		   
		    //ENTRADA
		   entrada=new FlxSprite(2070,1002,entrada_image);
		   entrada.immovable=true;
		   add(entrada);
		   entrada_gips = new FlxTileblock(2100, 1010, 2, 50);
		   entrada_gips.alpha=0;
		  entrada_gips.makeGraphic(2, 50);
		   add(entrada_gips);
		   
		   
		   perro= new Perro();
		   perro.x=1050;
		   perro.y=1010;
		   add(perro);
		   
		   
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
		   
		   //x, y, width, height
		   piso = new FlxTileblock(0, 1200, 2250, 2);
		   piso.alpha=0;
		   //width height
		   piso.makeGraphic(2250, 2);
		   add(piso);
		 
		   player = new Jugador(500,0);
		   player.x=2050;
		   player.y=0;
		   add(player);
		   trace(player.bandera);
	
		   //mundo de 50 x 40 y Tiles de 45 x 32
		   FlxG.camera.setBounds(0,0,2250,1280);
		   FlxG.camera.follow(player);
		   FlxG.worldBounds=new FlxRect(0,0,2250,1280);	   
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
	
		override public function update():void{
		
	       super.update();
		   
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
		    
		   FlxG.collide(player,mapa_ground);
		   FlxG.collide(perro,mapa_ground);
		   FlxG.collide(player,agua_s1);
		   FlxG.collide(player,agua_d1);
		   
		   FlxG.collide(player,plat1);
		   
		  
		   if(bar0_20.exists == false || FlxG.collide(player,piso)){
				FlxG.switchState(new Nivel2());
		   }
		   if(FlxG.collide(player,entrada_gips)){
				FlxG.switchState(new PreNivel3());
		   }
		   
		
	   }
			
	}
	
	
}