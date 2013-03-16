package {
import org.flixel.FlxGame;


  [SWF(width="1000", height="600", backgroundColor="#FF2dFF")]
	public class Flixel extends FlxGame {
		public function Flixel() {
			
			super(500, 300, Inicio, 2, 60,30,true);
			//super(800, 600, Nivel1, 1);
		}
	}
}
