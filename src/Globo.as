package {
	import org.flixel.FlxSprite;
	/**
	 * 
	 * @author Jahel
	 */
	public class Globo extends FlxSprite{
		
		public function Globo(){
			this.x=10;
			this.y=20;
			this.acceleration.y=9;
			this.exists = false;
			makeGraphic(10, 10);
			
		}
		override public function update():void{
			super.update();
			if(this.y > 300){
				this.exists = false;
			}
		}

	}
}
