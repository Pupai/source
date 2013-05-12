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
	
	
	
	
	public class Nivel3 extends FlxState{
		
		[Embed(source = 'Nivel3\\nivel3.mp3')] private var sound:Class;
		[Embed(source = "Nivel3\\tiles_pared.png")] public static var paredTiles:Class;
		[Embed(source = "Nivel3\\gips.png")] public static var gipsTiles:Class;
		[Embed(source = "Nivel3\\tiles_piso.png")] public static var groundTiles:Class;
		
		[Embed(source = "Nivel3\\entrada.png")] public static var entrada_img:Class;
		[Embed(source = "Nivel3\\salida.png")] public static var salida_img:Class;
		[Embed(source = "Nivel3\\picos.png")] public static var picos_img:Class;
		[Embed(source = "Nivel3\\plataforma.png")] public static var plataforma_img:Class;
		[Embed(source = "Nivel3\\rayo.png")] public static var rayo_img:Class;
		[Embed(source = "Nivel3\\sierra.png")] public static var sierra_img:Class;
		[Embed(source = "Nivel3\\pizarron2.png")] public static var pizarron_img:Class;
		[Embed(source = "Nivel3\\pizarra.png")] public static var pizarra_img:Class;
		[Embed(source = "Nivel3\\librero.png")] public static var librero_img:Class;
		[Embed(source = "Nivel3\\pantalla.png")] public static var pantalla_img:Class;
		[Embed(source = "Nivel3\\barril.png")] public static var barril_img:Class;
		[Embed(source = "lifebar.png")] public static var barra_image:Class;
		[Embed(source = "vida.png")] public static var vida_image:Class;
		
		[Embed(source = "Nivel3\\nivel3_ground.csv", mimeType="application/octet-stream")] public static var Ground:Class;
		[Embed(source = "Nivel3\\nivel3_pared.csv", mimeType="application/octet-stream")] public static var Pared:Class;
		[Embed(source = "Nivel3\\nivel3_gips.csv", mimeType="application/octet-stream")] public static var Gips:Class;

				
	    private var boss:sentinel;	
		private var player:Jugador;
		private var lifebar: FlxSprite;
		private var bar0_20: FlxSprite;
		private var bar20_40: FlxSprite;
		private var bar40_60: FlxSprite;
		private var bar60_80: FlxSprite;
			
				
		private var camera:FlxCamera;
		
		private var  mapa_ground:FlxTilemap;
		private var  mapa_gips:FlxTilemap;
		private var  mapa_pared:FlxTilemap;

		private var piso:FlxTileblock;
		
		private var rayo1: FlxSprite;
		private var rayo2: FlxSprite;
		private var rayo3: FlxSprite;
		private var rayo4: FlxSprite;
		private var rayo5: FlxSprite;
		
		private var picos1: FlxSprite;
		private var picos2: FlxSprite;
		private var picos3: FlxSprite;
		private var picos4: FlxSprite;
		private var picos5: FlxSprite;
		
		private var robot1:Robot;
		private var robot2:Robot;
		private var robot3:Robot;
		private var robot4:Robot;
		private var robot5:Robot;
		private var robot6:Robot;
		
		private var plat1: FlxSprite;
		private var plat2: FlxSprite;
		private var plat3: FlxSprite;
		private var plat4: FlxSprite;
		private var plat5: FlxSprite;
		private var plat6: FlxSprite;
		private var platc:FlxSprite;
		private var platj:FlxSprite;
		private var platj1:FlxSprite;
		
		private var bosstime:Number=0;
		private var bosshurt:Boolean=false;
		
		private var saw1: FlxSprite;
		private var saw2: FlxSprite;
		private var saw3: FlxSprite;
		private var saw4: FlxSprite;
		
		private var entrada: FlxSprite;
		private var salida: FlxSprite;
		private var pizarrond: FlxSprite;
		private var pizarra: FlxSprite;
		private var pantalla: FlxSprite;
		private var lib: FlxSprite;
		private var barril: FlxSprite;
		
		private var swapc: Boolean=false;
				

		private var timeRemaining:Number = 0; // in seconds
		private var timeRemainingDisplay:FlxText = new FlxText(5, 25, 50);
		

		private var counter : int=0;
		private var swap:Boolean=false;
		private var swap2:Boolean=false;
		private var paused:Boolean=true;
		private var pared1:FlxTileblock;
		private var pared2:FlxTileblock;

		
		 public function Nivel3()
        {
            super();
        }
		
		
		 override public function create():void
        {
           	
			
		
		   mapa_pared =  new FlxTilemap();
		   mapa_pared.loadMap(new Pared(), paredTiles,45,32);
           add(mapa_pared);
		   
		   pizarra=new FlxSprite(402,230,pizarra_img);
		   pizarra.immovable=true;
		   add(pizarra);
		   
		   lib=new FlxSprite(830,255,librero_img);
		   lib.immovable=true;
		   add(lib);
		   
		   pantalla=new FlxSprite(2100,255,pantalla_img);
		   pantalla.immovable=true;
		   add(pantalla);
		   
		   pizarrond=new FlxSprite(2410,250,pizarron_img);
		   pizarrond.immovable=true;
		   add(pizarrond);
		   
		   saw1=new FlxSprite(2300,300,sierra_img);
		   saw1.angularVelocity=80;
		   saw1.immovable=true;
		   add(saw1);
		   
		   saw2=new FlxSprite(2470,300,sierra_img);
		   saw2.angularVelocity=80;
		   saw2.immovable=true;
		   add(saw2);
		   
		   saw3=new FlxSprite(2750,300,sierra_img);
		   saw3.angularVelocity=80;
		   saw3.immovable=true;
		   add(saw3);
		   
		   saw4=new FlxSprite(3860,300,sierra_img);
		   saw4.angularVelocity=80;
		   saw4.immovable=true;
		   add(saw4);
			
			mapa_ground =  new FlxTilemap();
			mapa_ground.loadMap(new Ground(), groundTiles,45,32);
         	add(mapa_ground);	
			
			
			mapa_gips =  new FlxTilemap();
			mapa_gips.loadMap(new Gips(), gipsTiles,45,32);
         	add(mapa_gips);
			
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
		   piso = new FlxTileblock(0, 540, 4500, 2);
		   piso.alpha=100;
		   //width height
		   piso.makeGraphic(4500, 2);
		   add(piso);
		   
		   entrada=new FlxSprite(5,188,entrada_img);
		   entrada.immovable=true;
		   add(entrada);
		   
		   salida=new FlxSprite(4375,188,salida_img);
		   salida.immovable=true;
		   add(salida);
			
		   //RAYOS
		 /* rayo1=new FlxSprite(150,292,rayo_img);
		   rayo1.immovable=true;
		   add(rayo1);	
		   
		   rayo2=new FlxSprite(270,250,rayo_img);
		   rayo2.immovable=true;
		   add(rayo2);	
		   
		   rayo3=new FlxSprite(440,292,rayo_img);
		   rayo3.immovable=true;
		   add(rayo3);
		   
		   rayo4=new FlxSprite(605,292,rayo_img);
		   rayo4.immovable=true;
		   add(rayo4);
		   
		   rayo5=new FlxSprite(2615,292,rayo_img);
		   rayo5.immovable=true;
		   add(rayo5);*/
		   
		   //PICOS
		   picos1=new FlxSprite(340,299,picos_img);
		   picos1.immovable=true;
		   add(picos1);	
		   
		   picos2=new FlxSprite(515,299,picos_img);
		   picos2.immovable=true;
		   add(picos2);	
		   
		   picos3=new FlxSprite(750,299,picos_img);
		   picos3.immovable=true;
		   add(picos3);
		   
		   picos4=new FlxSprite(1985,299,picos_img);
		   picos4.immovable=true;
		   add(picos4);
		   
		   picos5=new FlxSprite(3244,299,picos_img);
		   picos5.immovable=true;
		   add(picos5);
		   
		   
		   //ROBOTS
		   robot1= new Robot();
		   robot1.x=675;
		   robot1.y=280;
		   add(robot1);	
		   
		   robot2= new Robot();
		   robot2.x=880;
		   robot2.y=280;
		   add(robot2);	
		   
		   robot3= new Robot();
		   robot3.x=2120;
		   robot3.y=280;
		   add(robot3);
		   
		   robot4= new Robot();
		   robot4.x=3700;
		   robot4.y=280;
		   add(robot4);
		   
		   robot5= new Robot();
		   robot5.x=3980;
		   robot5.y=280;
		   add(robot5);
		   
		   robot6= new Robot();
		   robot6.x=4150;
		   robot6.y=280;
		   add(robot6);
		   
		   //PLATAFORMAS MOVEDIZAS
		   plat1=new FlxSprite(1350,320,plataforma_img);
		   plat1.immovable=true;
		   add(plat1);
		   
		   plat2=new FlxSprite(1600,320,plataforma_img);
		   plat2.immovable=true;
		   add(plat2);
		   
		    platc=new FlxSprite(1800,320,plataforma_img);
		   platc.immovable=true;
		   add(platc);
		   
		   
		   
		   plat3=new FlxSprite(2970,320,plataforma_img);
		   plat3.immovable=true;
		   add(plat3);
		   
		   plat4=new FlxSprite(3085,320,plataforma_img);
		   plat4.immovable=true;
		   add(plat4);
		   
		   plat5=new FlxSprite(3375,320,plataforma_img);
		   plat5.immovable=true;
		   add(plat5);
		   
		   plat6=new FlxSprite(3485,320,plataforma_img);
		   plat6.immovable=true;
		   add(plat6);
		   
		   platj=new FlxSprite(3970,260,plataforma_img);
		   platj.immovable=true;
		   add(platj);
		   
		   platj1=new FlxSprite(4290,260,plataforma_img);
		   platj1.immovable=true;
		   add(platj1);
		   
		   pared1 = new FlxTileblock(0, 200, 2, 150);
		   pared1.alpha=0;
		   pared1.makeGraphic(2, 150);
		   add(pared1);
		   
		   pared2 = new FlxTileblock(4497, 200, 2, 150);
		   pared2.alpha=0;
		   pared2.makeGraphic(2, 150);
		   add(pared2);


		   player = new Jugador(4100,270);
		   add(player);
		   boss= new sentinel();
			boss.x=4100;
			boss.y=140;
			add(boss);
			
			FlxG.playMusic(sound);
			
	
		   //mundo de 100 x 17 y Tiles de 45 x 32
		   FlxG.camera.setBounds(0,0,4500,544);
		   FlxG.camera.follow(player);
		   FlxG.worldBounds=new FlxRect(0,0,4500,544);	   
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
		//SWAP1
		  if(robot1.x<=755 && swap==false){
			plat1.x-=2;
			plat2.x+=2;
			plat3.x--;
			plat4.x--;
			plat5.x--;
			plat6.x--;
			platj.y++;
			platj1.y++;
			
			robot1.x--;
			robot3.x--;
			robot5.x--;
			robot1.play("left");
			robot3.play("left");
			robot5.play("left");
			
			if(robot1.x==620){
				swap=true;
			}
	   	  }
	   
	  	 if(robot1.x>=620 && swap==true){
			plat1.x+=2;
			plat2.x-=2;
			plat3.x++;
			plat4.x++;
			plat5.x++;
			plat6.x++;
			platj.y--;
			platj1.y--;
			robot1.x++;
			robot3.x++;
			robot5.x++;
			robot1.play("right");
			robot3.play("right");
			robot5.play("right");	
			if(robot1.x==755){
			swap=false;
			}
	  	 }
		 
		 //SWAP2
		 if(robot2.x<=1000 && swap2==false){
			robot2.x--;
			platc.x--;
			robot4.x--;
			robot6.x--;
			robot2.play("left");
			robot4.play("left");
			robot6.play("left");
			
			if(robot2.x==800){
				swap2=true;
			}
	   	  }
	   
	  	 if(robot2.x>=800 && swap2==true){
			robot2.x++;
			platc.x++;
			robot4.x++;
			robot6.x++;
			robot2.play("right");
			robot4.play("right");	
			robot6.play("right");	
			if(robot2.x==1000){
			swap2=false;
			}
	  	 }
		 
		 //swap platc
		
	   
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
		   
		   //el boss
		   if(boss.x>player.x){
			boss.play("left");
			
		   }
		   
		   else{
			boss.play("right");
		   
		   }
		   
		   //Gravedad 
		   if(!FlxG.collide(player,mapa_ground)){
				player.acceleration.y = 850;
		   }
		   //colillides 
		   
		   FlxG.collide(boss,mapa_ground);
		   FlxG.collide(platj,player);
		   FlxG.collide(platj1,player);

		   
		   

		   FlxG.collide(player,mapa_ground);
		   FlxG.collide(player,plat1);
		    FlxG.collide(player,platc);
		   
		   
		   FlxG.collide(player,plat2);
		   FlxG.collide(player,plat3);
		   FlxG.collide(player,plat4);
		   FlxG.collide(player,plat5);
		   FlxG.collide(player,plat6);
		   FlxG.collide(player,pared1);
		   FlxG.collide(player,pared2);
		  		   
		   FlxG.collide(robot1,mapa_ground);
		   FlxG.collide(robot2,mapa_ground);
		   FlxG.collide(robot3,mapa_ground);
		   FlxG.collide(robot4,mapa_ground);	
		   FlxG.collide(robot5,mapa_ground);
		   FlxG.collide(robot6,mapa_ground);	   
		   
		   //collides con daños
		  		   
		  if(FlxG.collide(player,picos1) || FlxG.collide(player,picos2) ||FlxG.collide(player,picos3) ||FlxG.collide(player,picos4) ||
		   FlxG.collide(player,picos5) || FlxG.collide(player,rayo1)||FlxG.collide(player,rayo2)||FlxG.collide(player,rayo3)||
		   FlxG.collide(player,rayo4)||FlxG.collide(player,rayo5) || FlxG.collide(player,saw1) || FlxG.collide(player,saw2) ||
		   FlxG.collide(player,saw3) ||FlxG.collide(player,saw4) ){
			
			player.bandera=true;
			player.hurt(20);
			bajarVida();
			
			player.x-=30;
			
			
		   }
		   
		   //pelea con robots
		   if(FlxG.overlap(robot1,player)){
			player.pelea(robot1);
			bajarVida();			
		   }
		   if(FlxG.overlap(robot2,player)){
			player.pelea(robot2);
			bajarVida();			
		   }
		  if(FlxG.overlap(robot3,player)){
			player.pelea(robot3);
			bajarVida();			
		   }
		   if(FlxG.overlap(robot4,player)){
			player.pelea(robot4);
			bajarVida();			
		   }
		   if(FlxG.overlap(robot5,player)){
			player.pelea(robot5);
			bajarVida();			
		   }
		  if(FlxG.overlap(robot6,player)){
			player.pelea(robot6);
			bajarVida();			
		   }
		   
		    if(FlxG.overlap(boss,player)){
			if(bosstime==0){
			bosshurt=player.bossFight(boss);
			bosstime++;
			bajarVida();
			}
			
		   }
		   //trace("bosstime: "+bosstime);
		   if (bosstime>0 && bosstime<100){
				bosshurt=true;
				bosstime++;
			}
			else {
				bosstime=0;
				bosshurt=false;
			}
		   
		   
		   
		   
		   if(bar0_20.exists == false || FlxG.collide(player,piso)){
				FlxG.switchState(new Nivel3());
		   }
		   
		  }
		 }
		   
		
	   }
			
	
