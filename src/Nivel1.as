package {
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
	
	/*
	 *Al rato que llegue hago la casa destruida para ponerla al principio y la plataforma donde irá el boss
	 *No puedo hacer que el crate collidee con el bochito!
	 *Tmb en la carpeta de nivel 1 está guardada la imagen del boton que tiene que ir adentro del edificio para activar el boss
	 *pero no está puesto
	  
	 */
	
	
	public class Nivel1 extends FlxState{
		
		[Embed(source = "Nivel 1\\edificio_rojo.png")] public static var edificioTiles:Class;
		[Embed(source = "Nivel 1\\escritorio.png")] public static var escritorioTiles:Class;
		[Embed(source = "Nivel 1\\fondo_edificio.png")] public static var fondo_edificioTiles:Class;
		[Embed(source = 'Nivel 1\\ground-tile.png')] public static var groundTiles:Class;
		[Embed(source = 'Nivel 1\\top-tile.png')] public static var topTiles:Class;
		[Embed(source = 'Nivel 1\\plataforma.png')] public static var plataformaTiles:Class;
		[Embed(source = "Nivel 1\\volteado.png")] public static var carro_image:Class;
		[Embed(source = "Nivel 1\\boton.png")] public static var boton_image:Class;
		[Embed(source = "Nivel 1\\casa1.png")] public static var casa_image:Class;
		
		
		[Embed(source = "Nivel 1\\nivel1_edificio.csv", mimeType="application/octet-stream")] public static var Edificio:Class;
		[Embed(source = 'Nivel 1\\nivel1_escritorios.csv', mimeType="application/octet-stream")] public static var Escritorios:Class;
		[Embed(source = 'Nivel 1\\nivel1_fondo_ed.csv', mimeType="application/octet-stream")] public static var Fondo_ed:Class;
		[Embed(source = 'Nivel 1\\nivel1_tierra.csv', mimeType="application/octet-stream")] public static var Ground:Class;
		[Embed(source = 'Nivel 1\\nivel1_top_tierra.csv', mimeType="application/octet-stream")] public static var Top_ground:Class;
		[Embed(source = 'Nivel 1\\nivel1_plataforma.csv', mimeType="application/octet-stream")] public static var Plataforma:Class;

		
	
		private var player:Jugador;
		private var boss:Jefe;
		private var perro:Perro;
		private var perro2:Perro;
		private var perro3:Perro;
		private var perro_ed:Perro;
		private var perro2_ed:Perro;
		private var perro3_ed:Perro;
	
		private var pared:FlxTileblock;
		private var rampa:FlxTileblock;
		private var escalera:FlxTileblock;
	
		private var crate:Item;
		private var crate2:Item;

		
		private var  mapa_edificio:FlxTilemap;
		private var  mapa_top_ground:FlxTilemap;
		private var  mapa_ground:FlxTilemap;
		private var  mapa_escritorios:FlxTilemap;
		private var  mapa_fondo_ed:FlxTilemap;
		private var  mapa_plataforma:FlxTilemap;
		
		private var camera:FlxCamera;
		
		private var carro: FlxSprite;
		private var casa: FlxSprite;
		private var boton: FlxSprite;

		var counter : int=0;
		
		
		var _jump:Number = 0;
		var swap:Boolean=false;
		var swap2:Boolean=false;
		
		 public function Nivel1()
        {
            super();
        }
		
		
		 override public function create():void
        {
            /*var s:FlxSprite = new FlxSprite();
			s.makeGraphic(FlxG.width, FlxG.height, 0xFFFF50);
            add(s);*/			
			
			mapa_ground =  new FlxTilemap();
			mapa_ground.loadMap(new Ground(), groundTiles,45,32);
         	add(mapa_ground);
			
			mapa_fondo_ed =  new FlxTilemap();
			mapa_fondo_ed.loadMap(new Fondo_ed(), fondo_edificioTiles,45,32);
         	add(mapa_fondo_ed);
			
			mapa_top_ground =  new FlxTilemap();
			mapa_top_ground.loadMap(new Top_ground(), topTiles,45,32);
         	add(mapa_top_ground);
			
			mapa_edificio =  new FlxTilemap();
			mapa_edificio.loadMap(new Edificio(), edificioTiles,45,32);
         	add(mapa_edificio);			
			
			mapa_escritorios =  new FlxTilemap();
			mapa_escritorios.loadMap(new Escritorios(), escritorioTiles,45,32);
         	add(mapa_escritorios);
			
			mapa_plataforma =  new FlxTilemap();
			mapa_plataforma.loadMap(new Plataforma(), plataformaTiles,45,32);
         	add(mapa_plataforma);
			
					  
		  
		  //pared invisible!
		   pared = new FlxTileblock(0, 0, 1, 960);
		   pared.alpha=0;
		   pared.makeGraphic(1, 960);
		   add(pared);
		   
		   //rampa
		   rampa = new FlxTileblock(1200,600,10,400);
		   rampa.alpha=100;
		   rampa.angle=45;
		   rampa.makeGraphic(10, 300);
		   add(rampa);
	
		   carro=new FlxSprite(1020,777,carro_image);
		   carro.immovable=true;
		   add(carro);
		   
		   casa=new FlxSprite(300,770,casa_image);
		   casa.immovable=true;
		   add(casa);
		   
		   boton=new FlxSprite(1550,804,boton_image);
		   boton.immovable=true;
		   add(boton);
		   
		   crate=new Item("crate",45,32,940,777);
		   crate.acceleration.y=1000;
		   add(crate);
		   
		   crate2=new Item("crate",45,32,150,760);
		   crate2.acceleration.y=1000;
		   add(crate2);
		 
		   player = new Jugador();
		   //player.x=1600;
		   //player.y=20;
		   add(player);
		   
		   boss = new Jefe();
		   add(boss);
		   
		   perro= new Perro();
		   perro.x=130;
		   perro.y=600;
		   //add(perro);
		   
		   perro2= new Perro();
		   perro2.x=650;
		   perro2.y=370;
		   add(perro2);
		   
		   perro3= new Perro();
		   perro3.x=770;
		   perro3.y=370;
		   //add(perro3);  
		   
		   perro_ed= new Perro();
		   perro_ed.x=1680;
		   perro_ed.y=320;
		   add(perro_ed);  
		   
		   perro2_ed= new Perro();
		   perro2_ed.x=1800;
		   perro2_ed.y=450;
		   add(perro2_ed);  
		   
		   perro3_ed= new Perro();
		   perro3_ed.x=1700;
		   perro3_ed.y=800;
		   add(perro3_ed);  
		   
		   //mundo de 45 x 30 y Tiles de 45 x 32
		   FlxG.camera.setBounds(0,0,2025,960);
		   FlxG.camera.follow(player);
		   FlxG.worldBounds=new FlxRect(0,0,2025,960);
		   
		   
		   
		}
		

		
		
		
		
		override public function update():void
    {
		
       super.update();
	   
	   FlxG.collide(player,rampa);
	   
	  /* if(FlxG.collide(player,rampa)){
		
			if(FlxG.keys.pressed("RIGHT")){
				player.play("right");
				player.x+=1.5;
				player.y-=1.5;
	   		}
	   		if(FlxG.keys.pressed("LEFT")){
				player.play("left");
				player.x-=1.5;
				player.y+=1.5;
	   		}	
	   }*/
	   
	   
	   if(perro.x<=250 && swap==false){
		perro.x--;
		perro2.x--;
		perro.play("left");
		perro2.play("left");
		if(perro.x==100){
			swap=true;
		}
	   }
	   
	   if(perro.x>=100 && swap==true){
		perro.x++;
		perro2.x++;
		perro.play("right");
		perro2.play("right");
		
		if(perro.x==250){
			swap=false;
		}
	   }
	 
	   
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
	   
	   if(!FlxG.collide(player,mapa_ground) && !FlxG.overlap(player,escalera)){
		player.acceleration.y = 850;
	   }
	   FlxG.collide(player,pared);
	   FlxG.collide(boss,pared);
	   
	   FlxG.collide(crate2,pared);
	   FlxG.collide(perro,pared);
	   FlxG.collide(boss,mapa_ground);
	   FlxG.collide(perro,mapa_ground);
	   FlxG.collide(perro2,mapa_ground);
	   FlxG.collide(perro3,mapa_ground);
	   
	   
	   FlxG.collide(player,mapa_edificio);
	   FlxG.collide(boss,mapa_edificio);
	   FlxG.collide(perro_ed,mapa_edificio);
	   FlxG.collide(perro2_ed,mapa_edificio);
	   FlxG.collide(perro3_ed,mapa_edificio);		   
	   
	   FlxG.collide(player,mapa_escritorios);
	   FlxG.collide(carro,player);
	   FlxG.collide(casa,player);
	   
	   
   
	   if(FlxG.collide (player, boton)){
			trace("activar boss");
	   }

	   FlxG.collide(mapa_ground,crate2);
	   FlxG.collide(mapa_ground,crate);
	   
	   if(FlxG.collide(crate,player) && !FlxG.collide(mapa_ground,crate)){
		
			if(FlxG.keys.pressed("RIGHT")){
				crate.x+=0.5;
			}
			if(FlxG.keys.pressed("LEFT")){
				crate.x-=0.5;
			}
			FlxG.collide(carro,crate);
			
			
	   }
	   
	   if(FlxG.collide(crate2,player) && !FlxG.collide(mapa_ground,crate2)){
		
			if(FlxG.keys.pressed("RIGHT")){
				crate2.x+=0.5;
			}
			if(FlxG.keys.pressed("LEFT")){
				crate2.x-=0.5;
			}
			FlxG.collide(casa,crate2);
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


	   if( FlxG.collide(perro,player) || FlxG.collide(perro2,player) || FlxG.collide(perro3,player) ){
			player.kill();
			FlxG.switchState(new Nivel1());
	   }
	    if( FlxG.collide(perro_ed,player) || FlxG.collide(perro2_ed,player) || FlxG.collide(perro3_ed,player) ){
			player.kill();
			FlxG.switchState(new Nivel1());
	   }
		
	   }
	  
	   
	   
	   //FlxG.collide(crate,trailer);
	//FlxG.collide(crate,player) ;
	   //FlxG.collide(player,mapa_items);
	   
	   
			
		}
	
	
}