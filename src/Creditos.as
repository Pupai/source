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
	
	public class Creditos extends FlxState{
		
		private var texto:FlxText;
		
		 public function Creditos()
        {
            super();
        }
		
		
		 override public function create():void
        {
   
 			texto=new FlxText(0, 100, FlxG.width, "Credits").setFormat(null, 28, 0xFFF3030, "center");         
           add(texto);
		   
		}
		
		public function Iniciar():void{
		
		}

	
		
		override public function update():void
    {	   
        super.update();
	   
    }
		
	}
}
