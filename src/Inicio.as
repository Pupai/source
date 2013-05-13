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
<<<<<<< HEAD
		
		private var input:FlxInputText = new FlxInputText(FlxG.width/3+23, 160, 200, "Escribe tu nombre", 0xffffff0, null, 17, "center");
=======
		[Embed(source = "pupailogo.png")] public static var logoclass:Class;
		private var input:FlxInputText = new FlxInputText(FlxG.width/3+20, 50, 200, "Escribe tu nombre", 0xffffff0, null, 17, "center");
>>>>>>> 4d1f5b54bf63a1316a403722f65d0cac012cfff6
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
<<<<<<< HEAD
			
		   back=new FlxSprite(0,-110,fondo_image);
		   back.immovable=true;
		   add(back);
 
    
 			texto=new FlxText(0, 55, FlxG.width, "Unum Pupai").setFormat(null, 30, 0xFFF3030, "center",100);
         
           add(texto);
		   
		   
		   var botonInicio:FlxButton =  new FlxButton(FlxG.width / 2 - 40, 200, "Start Game!", Iniciar);
		   add(botonInicio);
		}
		public function Iniciar():void{
			var name:String=input.getText();
			remove(input);
			FlxG.switchState(new Creditos());

			
=======
			var logo:FlxSprite=new FlxSprite();
			logo.loadGraphic(logoclass, true, true,500, 265, true);
			logo.x=30;
			logo.y=100;
 
    		add(logo);         
           add(texto);
		   
		   
		   var botonInicio:FlxButton =  new FlxButton(FlxG.width / 2 - 40, FlxG.height / 2 -100, "Start Game!", Iniciar);
		   add(botonInicio);
		}
		public function Iniciar():void{

			var name:String=input.getText();
			remove(input);
			FlxG.switchState(new Tutorial(name));			
>>>>>>> 4d1f5b54bf63a1316a403722f65d0cac012cfff6
		}

	
		
		override public function update():void
    {	   
        super.update();
	   
    }
		
	}
}
