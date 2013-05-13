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
	
	public class Inicio extends FlxState{
		
		private var input:FlxInputText = new FlxInputText(FlxG.width/3+20, 50, 200, "Escribe tu nombre", 0xffffff0, null, 17, "center");
		private var texto:FlxText;
		
		 public function Inicio()
        {
            super();
        }
		
		
		 override public function create():void
        {
            var s:FlxSprite = new FlxSprite();
			s.makeGraphic(FlxG.width, FlxG.height, 0xFFFF50);
            add(s);
			add(input)
 
    
 			texto=new FlxText(0, 100, FlxG.width, "Unum Pupai").setFormat(null, 28, 0xFFF3030, "center");
         
           add(texto);
		   
		   
		   var botonInicio:FlxButton =  new FlxButton(FlxG.width / 2 - 40, FlxG.height / 2 - 60, "Start Game!", Iniciar);
		   add(botonInicio);
		}
		public function Iniciar():void{
<<<<<<< HEAD
			var name:String=input.getText();
			remove(input);
			FlxG.switchState(new HighScore(50,"nivel1","Dobby"));
=======

			FlxG.switchState(new Nivel3());
>>>>>>> fdf56725a1adf8450ae05e321cb798bee8639b4d

			
		}

	
		
		override public function update():void
    {	   
        super.update();
	   
    }
		
	}
}
