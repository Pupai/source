package {
	import org.flixel.FlxButton;
	/**
	 * @author ieiomeli
	 */
	
	import flash.events.MouseEvent;
 
    import org.flixel.FlxG;
    import org.flixel.FlxSprite;
    import org.flixel.FlxState;
    import org.flixel.FlxText;
	import org.flixel.FlxTileblock;
	
	public class Creditos2 extends FlxState{
		
		private var texto:FlxText;
		private var txt:FlxText;
		
		private var player:Jugador;
		private var piso:FlxTileblock;
		private var swap:Boolean=false;
		[Embed(source = 'Nivel2\\nivel2.mp3')] private var sound:Class;
		
		 public function Creditos2()
        {
            super();
        }
		
		
		 override public function create():void
        {
   
 		   texto=new FlxText(0, 55, FlxG.width, "Resources:").setFormat(null, 22, 0xFFFFFF, "center");         
           add(texto);
		   txt=new FlxText(0, 110, FlxG.width, "Music                 FMA"+"\n"+"Tiles        Rpg Maker"+"\n"+"Tiles     Graphicriver"+"\n"+"Sprites    DeviantArt"+"\n"+"Server      SmartFox"+"\n"+"Repository     Github"+"\n"+"Git Client     Tortoise"+"\n"+"Help       Prof. Sergio").setFormat(null, 18, 0xFFFFFF, "center");         
           add(txt);
		   
		   		   
		   piso = new FlxTileblock(0, 370, 950, 1);
		   piso.alpha=0;
		   piso.makeGraphic(950, 1);
		   add(piso);
		  		   
		   var botonInicio:FlxButton =  new FlxButton(FlxG.width / 2 - 40, 335, "Play again!", Iniciar);
		   add(botonInicio);
		   
		   FlxG.playMusic(sound);
		   
		   player = new Jugador(727,330);
		   add(player);
		   
		}
		
		public function Iniciar():void{
			FlxG.switchState(new Inicio());
		
		}

	
		
		override public function update():void
    {	   
        super.update();
		FlxG.collide(player,piso);
		trace(player.x);
		trace(swap);
		if(player.x<=730 && swap==false){
				player.x-=1.5;
				player.play("left");
				if(player.x<=1){
					swap=true;
				}
		   }
		   //mover perro hoyo
		   if(player.x>=0 && swap==true){
				player.x+=1.5;
				player.play("right");
				if(player.x>=727){
					swap=false;
				}
		   }
	   
    }
		
	}
}
