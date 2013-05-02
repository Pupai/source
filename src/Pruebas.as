package {
	import org.flixel.FlxGroup;
	import flash.net.dns.AAAARecord;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;
	import org.flixel.FlxCamera;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxTileblock;
	import org.flixel.FlxButton;

	
	import flash.events.MouseEvent;
 
    import org.flixel.FlxG;
    import org.flixel.FlxSprite;
    import org.flixel.FlxState;
    import org.flixel.FlxText;
	
	
	public class Pruebas extends FlxState{
		
		[Embed(source = "Tutorial\\ground-tile.png")] public static var groundTiles:Class;
		[Embed(source = "Tutorial\\escalera.png")] public static var itemsTiles:Class;
		[Embed(source = "Tutorial\\trailer.png")] public static var trailer_image:Class;
		[Embed(source = 'Tutorial\\top-tile.png')] public static var topTiles:Class;
		[Embed(source = "Tutorial\\ground.csv", mimeType="application/octet-stream")] public static var Ground:Class;
		[Embed(source = 'Tutorial\\escalera.csv', mimeType="application/octet-stream")] public static var Items:Class;
		[Embed(source = 'Tutorial\\top.csv', mimeType="application/octet-stream")] public static var Top:Class;
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
		private var boss:Jefe=new Jefe();
		var counter : int=0;
		var bullet:Globo;
		var globiza:FlxGroup;
		var bool:Boolean=false;
		var dir:Boolean=false;
		var bossmove:Number=0;
		
		
		var _jump:Number = 0;
		var swap:Boolean=false;
		var swap2:Boolean=false;
		
		 public function Pruebas()
        {
            super();
        }
		
		
		 override public function create():void
        {
            /*var s:FlxSprite = new FlxSprite();
			s.makeGraphic(FlxG.width, FlxG.height, 0xFFFF50);
            add(s);*/			
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
		  
		   player = new Jugador();
		  	   
		   perro= new Perro();
		   

		   perro2= new Perro();
		   perro2.x=650;
		   perro2.y=370;

		   texto=new FlxText(50, 260, FlxG.width, "Muevete con las flechas del teclado, salta con espacio y acelera con A," +"\n"+ "tu primera prueba sera esquivar a los enemigos y llegar al final" ).setFormat(null, 9, 0xFFF3030, "center");
         
           add(texto);
		   
		   add(boss);
		   
		   globiza=new FlxGroup();
			for (var i:Number=0;i<10;i++){
				bullet=new Globo();
				globiza.add(bullet);
			}
			add(globiza);
		   
		   //camera=new FlxCamera(-100, 100, 770, 544);
		   FlxG.camera.setBounds(0,0,765,544);
		   FlxG.camera.follow(player);
		   FlxG.worldBounds=new FlxRect(0,0,765,544);
		   
		}
			
		override public function update():void
    {
		
       super.update();
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
			else if(bossmove>=56 && bossmove<=70){
				boss.move("stop"); 
			}
			else{
				boss.move("runright");
				dir=false;
				
				
			}
	   }

	   else if(bossmove<220){
		bossmove++;
		boss.move("runleft");
		dir=true;
		
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
	   
	   if(FlxG.keys.pressed("S")){
			bool=true;
			boss.shoot(bool,"attackright");
			bullet= Globo(globiza.getFirstAvailable());
				bullet.x=boss.x+55;
				bullet.y=boss.y+54;
				bullet.exists=true;
		
		}
		
		
	   
	   
	   
	   
	   
	   
	   //player.velocity.y=50;
	   
	   
	  
	   
	   
	   //FlxG.collide(crate,trailer);
	//FlxG.collide(crate,player) ;
	   //FlxG.collide(player,mapa_items);
	   
	   
			
		}
	}	
	
}