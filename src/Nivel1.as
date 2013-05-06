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
	
	
	
	
	public class Nivel1 extends FlxState{
		[Embed(source = 'Nivel 1\\nivel1.mp3')] private var sound:Class;
		[Embed(source = "Nivel 1\\edificio_rojo.png")] public static var edificioTiles:Class;
		[Embed(source = "Nivel 1\\escritorio.png")] public static var escritorioTiles:Class;
		[Embed(source = "Nivel 1\\fondo_edificio.png")] public static var fondo_edificioTiles:Class;
		[Embed(source = 'Nivel 1\\ground_tile.png')] public static var groundTiles:Class;
		[Embed(source = 'Nivel 1\\top-tile.png')] public static var topTiles:Class;
		[Embed(source = 'Nivel 1\\plataforma.png')] public static var plataformaTiles:Class;
		[Embed(source = 'Nivel 1\\escalera.png')] public static var escaleraTiles:Class;
		[Embed(source = 'Nivel 1\\escalera_sewer.png')] public static var esc_sewerTiles:Class;
		[Embed(source = "Nivel 1\\volteado.png")] public static var carro_image:Class;
		[Embed(source = "Nivel 1\\boton.png")] public static var boton_image:Class;
		[Embed(source = "Nivel 1\\casa1.png")] public static var casa_image:Class;
		[Embed(source = "Nivel 1\\roca.png")] public static var roca_image:Class;
		[Embed(source = "Nivel 1\\tapa.png")] public static var tapa_image:Class;
		[Embed(source = "lifebar.png")] public static var barra_image:Class;
		[Embed(source = "vida.png")] public static var vida_image:Class;
		
		
		
		[Embed(source = "Nivel 1\\nivel1_edificio.csv", mimeType="application/octet-stream")] public static var Edificio:Class;
		[Embed(source = 'Nivel 1\\nivel1_escritorios.csv', mimeType="application/octet-stream")] public static var Escritorios:Class;
		[Embed(source = 'Nivel 1\\nivel1_fondo_ed.csv', mimeType="application/octet-stream")] public static var Fondo_ed:Class;
		[Embed(source = 'Nivel 1\\nivel1_tierra.csv', mimeType="application/octet-stream")] public static var Ground:Class;
		[Embed(source = 'Nivel 1\\nivel1_top_tierra.csv', mimeType="application/octet-stream")] public static var Top_ground:Class;
		[Embed(source = 'Nivel 1\\nivel1_plataforma.csv', mimeType="application/octet-stream")] public static var Plataforma:Class;
		[Embed(source = "Nivel 1\\nivel1_escalera.csv", mimeType="application/octet-stream")] public static var Escalera:Class;
		[Embed(source = "Nivel 1\\nivel1_esc_sewer.csv", mimeType="application/octet-stream")] public static var Escalera_sewer:Class;

		
	
		private var player:Jugador;
		private var boss:Jefe;
		private var perro:Perro;
		private var perro2:Perro;
		private var perro3:Perro;
		private var perro_ed:Perro;
		private var perro2_ed:Perro;
		private var perro3_ed:Perro;
	
		private var pared:FlxTileblock;
		private var paredcrate2:FlxTileblock;
		private var paredcrate:FlxTileblock;
		private var pared_ed:FlxTileblock;
		
		private var escalera_ed:FlxTileblock;
		private var escalera_ed1E:FlxTileblock;
		private var escalera_12:FlxTileblock;
		private var escalera_23:FlxTileblock;
		private var escalera_34:FlxTileblock;
		private var escalera_45:FlxTileblock;
		private var escalera_sw:FlxTileblock;
	
		private var crate:Item;
		private var crate2:Item;		
		
		private var  mapa_edificio:FlxTilemap;
		private var  mapa_top_ground:FlxTilemap;
		private var  mapa_ground:FlxTilemap;
		private var  mapa_escritorios:FlxTilemap;
		private var  mapa_fondo_ed:FlxTilemap;
		private var  mapa_plataforma:FlxTilemap;
		private var  mapa_escalera:FlxTilemap;
		private var  mapa_esc_sewer:FlxTilemap;
		
		private var camera:FlxCamera;
		
		private var carro: FlxSprite;
		private var casa: FlxSprite;
		private var boton: FlxSprite;
		private var roca: FlxSprite;
		private var tapa: FlxSprite;
		private var lifebar: FlxSprite;
		private var bar0_20: FlxSprite;
		private var bar20_40: FlxSprite;
		private var bar40_60: FlxSprite;
		private var bar60_80: FlxSprite;
		
		var counter : int=0;
		
		
		
		var _jump:Number = 0;
		var swap:Boolean=false;
		var swap2:Boolean=false;
		
		var paused:Boolean=true;
		var bullet:Globo;
		var globiza:FlxGroup;
		var bool:Boolean=false;
		var dir:Boolean=false;
		var bossmove:Number=0;
		var bosshurt:Boolean=false;
		var addboss:Boolean=false;
		var bosstime:Number=0;
		var timeRemaining:Number = 0; // in seconds
		var timeRemainingDisplay:FlxText = new FlxText(5, 25, 50);
		
		
		 public function Nivel1()
        {
            super();
        }
		
		
		 override public function create():void
        {
            /*var s:FlxSprite = new FlxSprite();
			s.makeGraphic(FlxG.width, FlxG.height, 0xFFFF50);
            add(s);*/			
			
			mapa_top_ground =  new FlxTilemap();
			mapa_top_ground.loadMap(new Top_ground(), topTiles,45,32);
         	add(mapa_top_ground);
			
			mapa_ground =  new FlxTilemap();
			mapa_ground.loadMap(new Ground(), groundTiles,45,32);
         	add(mapa_ground);
			
			mapa_fondo_ed =  new FlxTilemap();
			mapa_fondo_ed.loadMap(new Fondo_ed(), fondo_edificioTiles,45,32);
         	add(mapa_fondo_ed);
				
			mapa_edificio =  new FlxTilemap();
			mapa_edificio.loadMap(new Edificio(), edificioTiles,45,32);
         	add(mapa_edificio);			
			
			mapa_escritorios =  new FlxTilemap();
			mapa_escritorios.loadMap(new Escritorios(), escritorioTiles,45,32);
         	add(mapa_escritorios);
			
			mapa_plataforma =  new FlxTilemap();
			mapa_plataforma.loadMap(new Plataforma(), plataformaTiles,45,32);
         	add(mapa_plataforma);
			
			mapa_escalera =  new FlxTilemap();
			mapa_escalera.loadMap(new Escalera(), escaleraTiles,45,32);
         	add(mapa_escalera);
			
			mapa_esc_sewer =  new FlxTilemap();
			mapa_esc_sewer.loadMap(new Escalera_sewer(), esc_sewerTiles,45,32);
         	add(mapa_esc_sewer);
  
		  //pared invisible!
		   pared = new FlxTileblock(0, 0, 1, 960);
		   pared.alpha=0;
		   pared.makeGraphic(1, 960);
		   add(pared);
	
		   carro=new FlxSprite(1020,783,carro_image);
		   carro.immovable=true;
		   add(carro);
		   
		   casa=new FlxSprite(300,770,casa_image);
		   casa.immovable=true;
		   add(casa);
		   
		   roca=new FlxSprite(400,800,roca_image);
		   roca.immovable=true;
		   add(roca);
		   
		   boton=new FlxSprite(1550,804,boton_image);
		   boton.immovable=true;
		   add(boton);
		   
		   crate=new Item("crate",45,32,930,777);
		   crate.acceleration.y=1000;
		   add(crate);
		   
		   crate2=new Item("crate",45,32,150,760);
		   crate2.acceleration.y=1000;
		   add(crate2);
		   
		   paredcrate2 = new FlxTileblock(125, 790, 2, 50);
		   paredcrate2.alpha=0;
		   paredcrate2.makeGraphic(2, 50);
		   add(paredcrate2);
		   
		   paredcrate = new FlxTileblock(880, 780, 2, 50);
		   paredcrate.alpha=0;
		   paredcrate.makeGraphic(2, 50);
		   add(paredcrate);
		   
		   pared_ed = new FlxTileblock(2022, 0, 2, 200);
		   pared_ed.alpha=0;
		   pared_ed.makeGraphic(2, 200);
		   add(pared_ed);
		   
		   //x, y, width, height
		   escalera_ed = new FlxTileblock(1440, 226, 44, 285);
		   escalera_ed.alpha=0;
		   //width height
		   escalera_ed.makeGraphic(44, 285);
		   add(escalera_ed);
		   
		   escalera_45 = new FlxTileblock(1530, 290, 44, 29);
		   escalera_45.alpha=0;
		   escalera_45.makeGraphic(44, 29);
		   add(escalera_45);
		   
		   escalera_ed1E= new FlxTileblock(1800, 190, 44, 29);
		   escalera_ed1E.alpha=0;
		   escalera_ed1E.makeGraphic(44, 29);
		   add(escalera_ed1E);
		   
		   escalera_34 = new FlxTileblock(1937, 418, 44, 29);
		   escalera_34.alpha=0;
		   escalera_34.makeGraphic(44, 29);
		   add(escalera_34);
		   
		   escalera_23 = new FlxTileblock(1530, 546, 44, 29);
		   escalera_23.alpha=0;
		   escalera_23.makeGraphic(44, 29);
		   add(escalera_23);
		   
		   escalera_12 = new FlxTileblock(1937, 672, 44, 29);
		   escalera_12.alpha=0;
		   escalera_12.makeGraphic(44, 29);
		   add(escalera_12);
		   
		   escalera_sw = new FlxTileblock(1666, 834, 44, 128);
		   escalera_sw.alpha=0;
		   escalera_sw.makeGraphic(44, 128);
		   add(escalera_sw);
		   
		   //cuando el boss se muera mover tapa para que Pupai baje por escaleras
		   tapa=new FlxSprite(1666,832,tapa_image);
		   tapa.immovable=false;
		 
		   add(tapa);
		   
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
		   
		   /*vida = new FlxGroup();
		   vida.add(bar60_80);
		   vida.add(bar40_60);
		   vida.add(bar20_40);
		   vida.add(bar0_20);
		   add(vida);*/
		 
		   player = new Jugador(0,700);
		   //player.x=1600;
		   //player.y=750;
		   add(player);
		   trace(player.bandera);
		   
		   boss = new Jefe();
		   
		   perro= new Perro();
		   perro.x=130;
		   perro.y=770;
		   add(perro);
		   
		   perro2= new Perro();
		   perro2.x=650;
		   perro2.y=820;
		   add(perro2);
		   
		   perro3= new Perro();
		   perro3.x=770;
		   perro3.y=820;
		   add(perro3);  
		   
		   perro_ed= new Perro();
		   perro_ed.x=1680;
		   perro_ed.y=320;
		   add(perro_ed);  
		   
		   perro2_ed= new Perro();
		   perro2_ed.x=1800;
		   perro2_ed.y=450;
		   add(perro2_ed);  
		   
		   perro3_ed= new Perro();
		   perro3_ed.x=1800;
		   perro3_ed.y=800;
		   add(perro3_ed);  
		   globiza=new FlxGroup();
		   for (var i:Number=0;i<10;i++){
				bullet=new Globo();
				globiza.add(bullet);
		   }
		   add(globiza);
		   //mundo de 45 x 30 y Tiles de 45 x 32
		   FlxG.camera.setBounds(0,0,2025,960);
		   FlxG.camera.follow(player);
		   FlxG.worldBounds=new FlxRect(0,0,2025,960);	   
		}
		
		
		public function barra():void{
			if(player.health==60){
					bar60_80.exists=false;
				}
				else if(player.health==40){
					bar40_60.exists=false;
				}
				else if(player.health==20){
					bar20_40.exists=false;
				}
				else if(player.health==0){
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

		   trace(player.y);
		   
		   time();
		   FlxG.play(sound,.2);
		   
		   if( player.y>930){
			
			FlxG.switchState(new PreNivel2());
			
		   }
		   
		   if(boss.health==0){
		   tapa.immovable=true;
		   }

			   if(FlxG.keys.justPressed("P"))
				paused = !paused;
				if(!paused)
				//texto.kill();
				if(paused){
				//texto.y=player.y-340;
				//texto.revive();
				return;
					}
		   
		   
		   
		   // llamar a la barra de vida
		   
		   //mover perro cercano a casa
		   if(perro.x<=250 && swap==false){
				perro.x--;
				perro2.x--;
				perro3.x--;
				perro_ed.x--;
				perro2_ed.x--;
				perro3_ed.x--;
				perro.play("left");
				perro2.play("left");
				perro3.play("left");
				perro_ed.play("left");
				perro2_ed.play("left");
				perro3_ed.play("left");
				if(perro.x==100){
					swap=true;
				}
		   }
		   //mover perro hoyo
		   if(perro.x>=100 && swap==true){
				perro.x++;
				perro2.x++;
				perro3.x++;
				perro_ed.x++;
				perro2_ed.x++;
				perro3_ed.x++;
				perro.play("right");
				perro2.play("right");
				perro3.play("right");
				perro_ed.play("right");
				perro2_ed.play("right");
				perro3_ed.play("right");
				if(perro.x==250){
					swap=false;
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
		   
		   //Gravedad 
		   if(!FlxG.collide(player,mapa_ground) && !FlxG.overlap(player,escalera_ed)&& !FlxG.overlap(player,escalera_45)
		   && !FlxG.overlap(player,escalera_34)&& !FlxG.overlap(player,escalera_23)&& !FlxG.overlap(player,escalera_12) 
		   && !FlxG.overlap(player,escalera_sw) && !FlxG.overlap(player,escalera_ed1E)){
			player.acceleration.y = 850;
		   }
		    
		   FlxG.collide(player,pared);
		   FlxG.collide(player,mapa_edificio);
		   //collide de un lado!!
		   FlxG.collide(player,mapa_escritorios);
		   FlxG.collide(boss,pared);
		   FlxG.collide(boss,mapa_edificio);
		   //collide de un lado!!
		   FlxG.collide(boss,mapa_escritorios);
		   FlxG.collide(boss,mapa_edificio);
		   
		   FlxG.collide(perro,pared);
		   FlxG.collide(perro,roca);
		   FlxG.collide(perro,mapa_ground);
		   FlxG.collide(perro_ed,mapa_edificio);
		   FlxG.collide(perro2,mapa_ground);
		   FlxG.collide(perro2_ed,mapa_edificio);
		   FlxG.collide(perro3,mapa_ground);
		   FlxG.collide(perro3_ed,mapa_edificio);
		   FlxG.collide(perro3_ed,tapa);
		   
		   FlxG.collide(pared_ed,player);	   
		   
		   FlxG.collide(carro,player);
		   FlxG.collide(tapa,player);
		   FlxG.collide(casa,player);
		   FlxG.collide(roca,player);
		   FlxG.collide(crate,mapa_ground);
		   FlxG.collide(crate2,mapa_ground);
	   
		   //mover la caja cercana al carro
		   if(FlxG.collide(crate,player) && !FlxG.collide(mapa_ground,crate)){
				if(FlxG.keys.pressed("RIGHT")){
					crate.x+=0.5;
				}
				if(FlxG.keys.pressed("LEFT")){
					crate.x-=0.5;
				}
				FlxG.collide(carro,crate);
				FlxG.collide(crate,paredcrate);	
				
		   }
		   
		   //mover caja cercana a la casa
		   if(FlxG.collide(crate2,player) && !FlxG.collide(mapa_ground,crate2)){
			
				if(FlxG.keys.pressed("RIGHT")){
					crate2.x+=0.5;
				}
				if(FlxG.keys.pressed("LEFT")){
					crate2.x-=0.5;
				}
				FlxG.collide(casa,crate2);
				FlxG.collide(crate2,paredcrate2);
		   }
		   
		   // subir escalera
		   if(FlxG.overlap(player,escalera_ed) || FlxG.overlap(player,escalera_45) || FlxG.overlap(player,escalera_34)
		   || FlxG.overlap(player,escalera_23) || FlxG.overlap(player,escalera_12) || FlxG.overlap(player,escalera_sw)
		   || FlxG.overlap(player,escalera_ed1E)){
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
	
		  //-20 de vida cuando choque con perro
		  
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
		   
		   if(FlxG.overlap(perro_ed,player)){
			player.pelea(perro_ed);
			bajarVida();
		   }
		   if(FlxG.overlap(perro2_ed,player)){
			player.pelea(perro2_ed);
			bajarVida();
		   }
		   if(FlxG.overlap(perro3_ed,player)){
			player.pelea(perro3_ed);
			bajarVida();
		   }
		   if(FlxG.overlap(boss,player) && !FlxG.collide(player,casa)){
			trace("bosstime: "+bosstime);
			if(bosstime==0){
			bosshurt=player.bossFight(boss);
			bosstime++;
			bajarVida();
			}
			
		   }
		   trace("bosstime: "+bosstime);
		   if (bosstime>0 && bosstime<100){
				bosshurt=true;
				bosstime++;
			}
			else {
				bosstime=0;
				bosshurt=false;
			}
		  
		  trace("boss health: "+boss.health);
		   if(bar0_20.exists == false){
				FlxG.switchState(new Nivel1());
		   }
		    if(FlxG.collide (player, boton) && FlxG.keys.pressed("S")){
				addboss=true;
				trace("activar boss");				
		   }
		   if(addboss){
			add(boss);
		   }
		   if(boss.health==0){
			//FlxG.switchState(new HighScore());
		   }
		  if(FlxG.overlap(bullet,player)){
					player.pelea(bullet);
					bajarVida();
				}
		 	if(FlxG.collide(boss,mapa_ground)){
				
		if(bossmove<120){
			bossmove++;
			if(bossmove>=50 && bossmove<=55){
				trace("pew");
			   	bool=true;
				boss.shoot(bool,"attackright");
				bullet= Globo(globiza.getFirstAvailable());
				bullet.x=boss.x+55;
				bullet.y=boss.y+54;
				bullet.exists=true;
				
			}
			else if(bosshurt){
				boss.play("hurtright");
			}
			else{
				if(boss.x<300){
					boss.move("runright");
					dir=false;
				}
				else {
					bossmove=120;
				}

			}
	   }	
	   else if(bossmove<220){
		
		if(boss.x>0){
			trace("no collidea. hurt: "+bosshurt);
			bossmove++;
			if(bosshurt){
				boss.play("hurtleft");
			}
			else{
				boss.move("runleft");
				dir=true;

			}
		}
		else {
			trace("collidea. hurt: "+bosshurt);
			bossmove=0;
		}
		
	   }
	   
		else {
			bossmove=0;
			if(!dir){
				boss.play("right");
			}
			else {
				boss.play("left");
			}
			
	   }
	   }
			
			
		
	   }
			
	}
	
	
}