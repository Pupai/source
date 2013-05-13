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

		
		private var input:FlxInputText = new FlxInputText(FlxG.width/3+23, 100, 200, "Escribe tu nombre", 0xffffff0, null, 17, "center");

		[Embed(source = "pupailogo.png")] public static var logoclass:Class;
	
		private var texto:FlxText;
		[Embed(source = "NuclearBomb.jpg")] public static var fondo_image:Class;
		private var back: FlxSprite;
		
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

			
		   back=new FlxSprite(0,-110,fondo_image);
		   back.immovable=true;
		   add(back);
		   
		   var logo:FlxSprite=new FlxSprite();
			logo.loadGraphic(logoclass, true, true,500, 265, true);
			logo.x=30;
			logo.y=150;
 
    		add(logo);
		   
		   
		   var botonInicio:FlxButton =  new FlxButton(FlxG.width / 2 - 40, 150, "Start Game!", Iniciar);
		   add(botonInicio);
		}
		public function Iniciar():void{
			var name:String=input.getText();
			remove(input);
			FlxG.switchState(new Tutorial(name));
	 
		}

	
		
		override public function update():void
    {	   
        super.update();
	   
    }
		
	}
}
