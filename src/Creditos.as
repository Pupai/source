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
	
	public class Creditos extends FlxState{
		
		private var texto:FlxText;
		private var nombres:FlxText;
		private var txt:FlxText;
		
		private var player:Jugador;
		private var perro1:Perro;
		private var perro2:Perro;
		private var piso:FlxTileblock;
		var contador:Number = 0;
		[Embed(source = 'Nivel2\\nivel2.mp3')] private var sound:Class;
		
		 public function Creditos()
        {
            super();
        }
		
		
		 override public function create():void
        {
   
 		   texto=new FlxText(0, 80, FlxG.width, "Unum Pupai was created by:").setFormat(null, 20, 0xFFFFFF, "center");         
           add(texto);
		   nombres=new FlxText(0, 120, FlxG.width, "Edna Ramírez"+"\n"+"Gabriel Macías"+"\n"+"Maya Alba").setFormat(null, 18, 0xFFFFFF, "center");         
           add(nombres);
		   txt=new FlxText(0, 300, FlxG.width, "Prof. Sergio Hernández"+"\n"+"Tec de Monterrey"+"\n"+"Campus Guadalajara"+"\n"+"2013").setFormat(null, 12, 0xFFFFFF, "center");         
           add(txt);
		   
		   piso = new FlxTileblock(0, 270, 950, 1);
		   piso.alpha=0;
		   piso.makeGraphic(950, 1);
		   add(piso);
		   FlxG.playMusic(sound);
		   
		   player = new Jugador(30,220);
		   add(player);
		   perro1 = new Perro();
		   perro1.x=5;
		   perro1.y=240;
		   add(perro1);
		   perro2 = new Perro();
		   perro2.x=-20;
		   perro2.y=240;
		   add(perro2);
		   
		}
				
		override public function update():void
    {	   
        super.update();
		FlxG.collide(player,piso);
		FlxG.collide(perro1,piso);
		FlxG.collide(perro2,piso);
		player.x+=1.5;
		perro1.x+=1.4;
		perro2.x+=1.3;
		perro1.play("right");
		perro2.play("right");
		player.play("right");
		contador+= FlxG.elapsed;
		 if(contador>=8){
		 FlxG.switchState(new Creditos2());
		 }
	   
    }
		
	}
}
