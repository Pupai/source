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
	
	public class Fin extends FlxState{
		
		
		private var texto:FlxText;
		private var level:String;
		private var time:Number;
		private var name:String;
		
		 public function Fin(t:Number, l:String, n:String)
        {
            super();
			time=t;
			level=l;
			name=n;
        }
		
		
		 override public function create():void
        {
            var s:FlxSprite = new FlxSprite();
			s.makeGraphic(FlxG.width, FlxG.height, 0xFFFF50);
            add(s);
		   
		   var botonScore:FlxButton =  new FlxButton(FlxG.width / 2 - 40, FlxG.height / 2 - 30, " Agregar Score", agregarScore);
		   add(botonScore);
		   var botonInicio:FlxButton =  new FlxButton(FlxG.width / 2 - 40, FlxG.height / 2 - 60, "Continue!", Iniciar);
		   add(botonInicio);
		}
		public function agregarScore():void{
			FlxG.switchState(new HighScore(time, "nivel3", name));
			
		}
		public function Iniciar():void{
			FlxG.switchState(new Creditos());
			
		}

	
		
		override public function update():void
    {	   
        super.update();
	   
    }
		
	}
}
