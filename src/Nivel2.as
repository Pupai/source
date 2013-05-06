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
	
	
	
	
	public class Nivel2 extends FlxState{
		[Embed(source = 'Nivel2\\nivel2.mp3')] private var sound:Class;
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
		private var perro1:Perro;
		private var perro2:Perro;
		private var perro3:Perro;
		private var perro4:Perro;
		private var perro5:Perro;
		
		
				
		private var camera:FlxCamera;
		
		private var  mapa_ground:FlxTilemap;
		private var  mapa_top_ground:FlxTilemap;
		
		private var piso:FlxTileblock;
		
		private var pico1: FlxSprite;
		private var pico2: FlxSprite;
		private var pico3: FlxSprite;
		private var pico4: FlxSprite;
		private var pico5: FlxSprite;
		private var pico6: FlxSprite;
		
		private var pipe_s1: FlxSprite;
		private var agua_s1: FlxSprite;
		private var pipe_d1: FlxSprite;
		private var agua_d1: FlxSprite;
		
		private var plat1: FlxSprite;
		private var plat2: FlxSprite;
		private var plat3: FlxSprite;
		private var plat4: FlxSprite;
		private var plat5:FlxSprite;
		
				
		private var puente1: FlxSprite;
		private var puente2: FlxSprite;
		private var puente3: FlxSprite;
		private var puente4: FlxSprite;
		private var puente5: FlxSprite;
		private var puente6: FlxSprite;
		private var puente7: FlxSprite;
		private var puente8: FlxSprite;
		
		private var entrada: FlxSprite;
		private var entrada_gips:FlxTileblock;
		
		var timeRemaining:Number = 0; // in seconds
		var timeRemainingDisplay:FlxText = new FlxText(5, 25, 50);
		

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
		   
		   pico3=new FlxSprite(1700,350,pico_image);
		   pico3.immovable=true;
		   add(pico3);
		   
		   pico4=new FlxSprite(1650,350,pico_image);
		   pico4.immovable=true;
		   add(pico4);
		   
		   pico5=new FlxSprite(1500,350,pico_image);
		   pico5.immovable=true;
		   add(pico5);
		   
		   pico6=new FlxSprite(1550,350,pico_image);
		   pico6.immovable=true;
		   add(pico6);
		   
		   //PIPES
		   pipe_s1=new FlxSprite(900,476,pipe_s_image);
		   pipe_s1.immovable=true;
		   add(pipe_s1);
		   agua_s1=new FlxSprite(901,488,agua_s_image);
		   agua_s1.immovable=true;
		   add(agua_s1);
		   
		   pipe_d1=new FlxSprite(800,476,pipe_d_image);
		   pipe_d1.immovable=true;
		   add(pipe_d1);
		   agua_d1=new FlxSprite(801,488,agua_d_image);
		   agua_d1.immovable=true;
		   add(agua_d1);
		  
		   //PLATAFORMA
		   plat1=new FlxSprite(360,1057,plataforma_image);
		   plat1.immovable=true;
		   add(plat1);
		   
		   plat2=new FlxSprite(460,1057,plataforma_image);
		   plat2.immovable=true;
		   add(plat2);
		   
		   plat3=new FlxSprite(560,1057,plataforma_image);
		   plat3.immovable=true;
		   add(plat3);
		   
		   plat4=new FlxSprite(660,1057,plataforma_image);
		   plat4.immovable=true;
		   add(plat4);
		   
		   plat5=new FlxSprite(760,1057,plataforma_image);
		   plat5.immovable=true;
		   add(plat5);
		   
		  
		   
		   //PUENTE
		   puente1=new FlxSprite(1215,1056,puente_image);
		   puente1.immovable=true;
		   add(puente1);
		   
		   puente2=new FlxSprite(1265,1056,puente_image);
		   puente2.immovable=true;
		   add(puente2);
		   
		   puente3=new FlxSprite(1315,1056,puente_image);
		   puente3.immovable=true;
		   add(puente3);
		   
		   puente4=new FlxSprite(1365,1056,puente_image);
		   puente4.immovable=true;
		   add(puente4);
		   
		   puente5=new FlxSprite(1415,1056,puente_image);
		   puente5.immovable=true;
		   add(puente5);
		   
		   puente6=new FlxSprite(1465,1056,puente_image);
		   puente6.immovable=true;
		   add(puente6);
		   
		   puente7=new FlxSprite(1515,1056,puente_image);
		   puente7.immovable=true;
		   add(puente7);
		   
		   puente8=new FlxSprite(1565,1056,puente_image);
		   puente8.immovable=true;
		   add(puente8);
		   
		    //ENTRADA
		   entrada=new FlxSprite(2070,1002,entrada_image);
		   entrada.immovable=true;
		   add(entrada);
		   entrada_gips = new FlxTileblock(2100, 1010, 2, 50);
		   entrada_gips.alpha=0;
		  entrada_gips.makeGraphic(2, 50);
		   add(entrada_gips);
		   
		   
		   perro= new Perro();
		   perro.x=1632;
		   perro.y=1014;
		   add(perro);
		   
		   perro1= new Perro();
		   perro1.x=2032;
		   perro1.y=1014;
		   add(perro1);
		   
		   perro2= new Perro();
		   perro2.x=1732;
		   perro2.y=1014;
		   add(perro2);
		   
		   perro3= new Perro();
		   perro3.x=1832;
		   perro3.y=1014;
		   add(perro3);
		   
		   perro4= new Perro();
		   perro4.x=1932;
		   perro4.y=1014;
		   add(perro4);
		   
		   
		   
		   
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
		 
		   //player = new Jugador(500,0);
		  // player.x=2050;
		  // player.y=0;

		   player = new Jugador(2050,0);
		   
		   add(player);
		   
		   		   FlxG.playMusic(sound);
		   
	
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
		   //movimiento perros
		   if(perro.x<=1732 && swap==true){
				perro.x--;
				perro1.x--;
				perro2.x--;
				perro3.x--;
				perro4.x--;
				perro.play("left");
				perro1.play("left");
				perro2.play("left");
				perro3.play("left");
				perro4.play("left");
				if(perro.x==1632){
					swap=false;
				}
		   }
		   //mover perro hoyo
		   if(perro.x>=1632 && swap==false){
				perro.x++;
				perro1.x++;
				perro2.x++;
				perro3.x++;
				perro4.x++;
				perro.play("right");
				perro1.play("right");
				perro2.play("right");
				perro3.play("right");
				perro4.play("right");
				if(perro.x==1732){
					swap=true;
				}
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
		   //picos 
		   if(player.x<pico1.x){
			pico1.immovable==false;
			pico1.y+=5;
		   }
		   if(player.x<pico2.x){
			pico2.immovable==false;
			pico2.y+=5;
		   }
		   if(player.x<pico3.x){
			pico3.immovable==false;
			pico3.y+=5;
		   }
		   if(player.x<pico4.x){
			pico4.immovable==false;
			pico4.y+=5;
		   }
		   if(player.x<pico5.x){
			pico5.immovable==false;
			pico5.y+=5;
		   }
		   if(player.x<pico6.x){
			pico6.immovable==false;
			pico6.y+=5;
		   }
		   
		   
		   
		   //Gravedad 
		   if(!FlxG.collide(player,mapa_ground)){
				player.acceleration.y = 850;
		   }
		   //colillides 
		   FlxG.collide(player,mapa_ground);
		   FlxG.collide(perro,mapa_ground);
		   FlxG.collide(perro1,mapa_ground);
		   FlxG.collide(perro2,mapa_ground);
		   FlxG.collide(perro3,mapa_ground);
		   FlxG.collide(perro4,mapa_ground);
		   
		   if(FlxG.overlap(player,agua_s1)){
			player.bandera=true;
			player.hurt(20);
			bajarVida();
			player.x+=20;
			
		   }
		   if(FlxG.overlap(player,agua_d1)){
			player.bandera=true;
			player.hurt(20);
			bajarVida();
			player.x+=20;
			
		   }
		   
		   FlxG.collide(player,pipe_d1);
		   FlxG.collide(player,pipe_s1);
		   
		   
		   FlxG.collide(player,plat1);
		   FlxG.collide(player,plat2);
		   FlxG.collide(player,plat3);
		   FlxG.collide(player,plat4);
		   FlxG.collide(player,plat5);
		   
		   //colide de picos
		   if(FlxG.overlap(pico1,player)){
			player.bandera=true;
			player.hurt(20);
			bajarVida();
			pico1.kill();
			 
		   }
		   
		    if(FlxG.overlap(pico2,player)){
			player.bandera=true;
			player.hurt(20);
			bajarVida();
			pico2.kill();
			 
		   }
		   
		    if(FlxG.overlap(pico3,player)){
			player.bandera=true;
			player.hurt(20);
			bajarVida();
			pico3.kill();
			 
		   }
		   
		    if(FlxG.overlap(pico4,player)){
			player.bandera=true;
			player.hurt(20);
			bajarVida();
			pico4.kill();
			 
		   }
		   
		    if(FlxG.overlap(pico5,player)){
			player.bandera=true;
			player.hurt(20);
			bajarVida();
			pico5.kill();
			 
		   }
		   
		    if(FlxG.overlap(pico6,player)){
			player.bandera=true;
			player.hurt(20);
			bajarVida();
			pico6.kill();
			 
		   }
		   //collide del puente
		   if(FlxG.collide(player,puente1)){
			puente1.y+=10;
		   }
		   if(FlxG.collide(player,puente2)){
			puente2.y+=10;
		   }
		   if(FlxG.collide(player,puente3)){
			puente3.y+=10;
		   }
		   if(FlxG.collide(player,puente4)){
			puente4.y+=10;
		   }
		   if(FlxG.collide(player,puente5)){
			puente5.y+=10;
		   }
		   if(FlxG.collide(player,puente6)){
			puente6.y+=10;
		   }
		   if(FlxG.collide(player,puente7)){
			puente7.y+=10;
		   }
		   if(FlxG.collide(player,puente8)){
			puente8.y+=10;
		   }
		   
		   // pelea con perrorros
		    if(FlxG.overlap(perro2,player)){
			player.pelea(perro2);
			bajarVida();			
		   }
		   if(FlxG.overlap(perro,player)){
			player.pelea(perro);
			bajarVida();
		   }
		   if(FlxG.overlap(perro3,player)){
			player.pelea(perro3);
			bajarVida();
		   }
		   
		   if(FlxG.overlap(perro4,player)){
			player.pelea(perro4);
			bajarVida();
		   }
		   if(FlxG.overlap(perro1,player)){
			bajarVida();
		   }
		   
		  
		   
		  
		   
		  
		   if(bar0_20.exists == false || FlxG.collide(player,piso)){
				FlxG.switchState(new Nivel2());
		   }
		   if(FlxG.collide(player,entrada_gips)){
				FlxG.switchState(new Nivel3());
		   }
		  }
		   
		
	   }
			
	}
	
	
