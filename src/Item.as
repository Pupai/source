package {
	import org.flixel.FlxSprite;
	/**
	 * @author Jahel
	 */
	public class Item extends FlxSprite{
		public function Item(str:String, width:Number, height:Number, x:Number, y:Number){
			super(x,y);
			[Embed(source = "Tutorial\\crate.png")] var Img:Class;
			loadGraphic(Img, true, true,width, height, true);
			
		}
	}
}
