package {
	import org.flixel.FlxU;
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
	
	
	public class Tutorial extends FlxState{
		
		[Embed(source = "Tutorial\\ground-tile.png")] public static var groundTiles:Class;
		[Embed(source = "Tutorial\\escalera.png")] public static var itemsTiles:Class;
		[Embed(source = "Tutorial\\trailer.png")] public static var trailer_image:Class;
		[Embed(source = 'Tutorial\\top-tile.png')] public static var topTiles:Class;
		[Embed(source = "Tutorial\\ground.csv", mimeType="application/octet-stream")] public static var Ground:Class;
		[Embed(source = 'Tutorial\\escalera.csv', mimeType="application/octet-stream")] public static var Items:Class;
		[Embed(source = 'Tutorial\\top.csv', mimeType="application/octet-stream")] public static var Top:Class;
		[Embed(source = 'Tutorial\\music.mp3')] private var sound:Class;
		[Embed(source = 'visores.png')] public static var vsheet:Class;
		
		private var texto:FlxText;
		private var textoperdiste:FlxText;
		private var player:Jugador;
		private var perro:Perro;
		private var perro2:Perro;
		private var pared:FlxTileblock;
		private var escalera:FlxTileblock;
		private var trampadelmal:FlxTileblock;
		private var  mapa_ground:FlxTilemap;
		private var  mapa_top:FlxTilemap;
		private var  mapa_items:FlxTilemap;
		private var camera:FlxCamera;
		private var crate:Item;
		private var visores: Item;
		private var trailer: FlxSprite;
		private var musica:FlxG= new FlxG();
		var counter : int=0;
		
		var contador:Number = 0; // in seconds

		
		private var name:String;
		
		var _jump:Number = 0;
		var swap:Boolean=false;
		var swap2:Boolean=false;
		
		 public function Tutorial(n:String)
        {
            super();
			name=n;
        }
		
		
		 override public function create():void
        {
	
			mapa_top =  new FlxTilemap();
			mapa_top.loadMap(new Top(), topTiles,45,32);
         	add(mapa_top);
         		
			mapa_items =  new FlxTilemap();
			mapa_items.loadMap(new Items(), itemsTiles,45,32);
         	add(mapa_items);
			
			mapa_ground =  new FlxTilemap();
			mapa_ground.loadMap(new Ground(), groundTiles,45,32);
         	add(mapa_ground);
					  
		   pared = new FlxTileblock(0, 0, 1, 544);
		   pared.alpha=0;
		   pared.makeGraphic(1, 544);
		   add(pared);
		   escalera = new FlxTileblock(585, 129, 45, 224);
		   escalera.alpha=0;
		   escalera.makeGraphic(45, 224);
		   add(escalera);
		   crate=new Item("crate",45,32,300,415);
		   crate.acceleration.y=1000;
		   
		   visores=new Item("visores",68,54,0,250);
		   
		   trampadelmal = new FlxTileblock(586, 118, 45, 32);
		   trampadelmal.alpha=0;
		   trampadelmal.makeGraphic(45, 32);
		   add(trampadelmal);
		   
		   trailer=new FlxSprite(0,355,trailer_image);
		   trailer.immovable=true;
		   add(trailer);
		   add(crate);
		   add(visores);
		  
		   player = new Jugador(0,370);  
		   add(player);
		   
		   perro= new Perro();
		   
		   add(perro);
		   
		   perro2= new Perro();
		   perro2.x=650;
		   perro2.y=370;
		   add(perro2);
		   texto=new FlxText(10, 200, FlxG.width, "Move with the arrows, jump with spacebar"+"\n"+"and run with A. Your first test is to avoid the enemies"+"\n"+ "to get to the end. Good luck Pupai!" ).setFormat(null, 14, 0xFFF3030, "center",1);
         
           add(texto);
		   
		   FlxG.playMusic(sound);
		  
		   //camera=new FlxCamera(-100, 100, 770, 544);
		   FlxG.camera.setBounds(0,0,765,544);
		   FlxG.camera.follow(player);
		   FlxG.worldBounds=new FlxRect(0,0,765,544);
		   
		}
		
		
			
		override public function update():void
    {
		
       super.update();
	   
	   
	   
	   visores.x=player.x-10;
	   texto.x=visores.x+20;
	   visores.play("move");
	   
	   if(player.x>100){
		texto.visible=false;
	   }
	   
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
	   
	   
	   
	   
	   //player.velocity.y=50;
	   
	   if(!FlxG.collide(player,mapa_ground) && !FlxG.overlap(player,escalera)){
		player.acceleration.y = 850;
	   }
	   FlxG.collide(player,pared);
	   FlxG.collide(perro,pared);
	   FlxG.collide(perro,mapa_ground);
	   FlxG.collide(perro2,mapa_ground);
	   FlxG.collide(perro,crate);
	   FlxG.collide(perro2, crate);
	   
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
				visores.y=player.y-100;
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
			perro2.kill;
			 //FlxG.collide(player,perro2)==false;			
			
	   }
	   if(player.angularVelocity>200 ){
		visores.y=250;
		player.kill();
		texto=new FlxText(300, 300, FlxG.width, "You've failed the first test..." ).setFormat(null, 15, 0xFFF3030, "left",1);
         add(texto);

		 contador+= FlxG.elapsed;
		 if(contador>=3){
		 FlxG.switchState(new PreNivel1(name));
		 }

	   }
	   
	    if(FlxG.overlap(perro2,player)){
			player.pelea(perro2);

		 }
		 if(FlxG.overlap(perro,player)){
			player.pelea(perro);

		 }
		
	   }
	  
	   
	   
	   //FlxG.collide(crate,trailer);
	//FlxG.collide(crate,player) ;
	   //FlxG.collide(player,mapa_items);
	   
	   
			
		}
	
	
}