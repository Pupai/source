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
	
	public class PreNivel3 extends FlxState{
		
		
		private var texto:FlxText;
		
		 public function PreNivel3()
        {
            super();
        }
		
		
		 override public function create():void
        {
            var s:FlxSprite = new FlxSprite();
			s.makeGraphic(FlxG.width, FlxG.height, 0xFFFF50);
            add(s);
		   
		   
		   var botonInicio:FlxButton =  new FlxButton(FlxG.width / 2 - 40, FlxG.height / 2 - 60, "Level 3!", Iniciar);
		   add(botonInicio);
		}
		public function Iniciar():void{
			FlxG.switchState(new Nivel3());
			
		}

	
		
		override public function update():void
    {	   
        super.update();
	   
    }
		
	}
}
