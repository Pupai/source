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
	
	public class PreNivel1 extends FlxState{
		
		
		private var texto:FlxText;
		
		 public function PreNivel1()
        {
            super();
        }
		
		
		 override public function create():void
        {
            var s:FlxSprite = new FlxSprite();
			s.makeGraphic(FlxG.width, FlxG.height, 0xFFFF50);
            add(s);
			
 
    
 			texto=new FlxText(0, 300, FlxG.width, "bla bla bla bla").setFormat(null, 21, 0xFFF3030, "center");
         
           add(texto);
		   
		   
		   var botonInicio:FlxButton =  new FlxButton(FlxG.width / 2 - 40, FlxG.height / 2 - 60, "Level 1!", Iniciar);
		   add(botonInicio);
		}
		public function Iniciar():void{
			FlxG.switchState(new Nivel1());
			
		}

	
		
		override public function update():void
    {	   
        super.update();
	   
    }
		
	}
}
