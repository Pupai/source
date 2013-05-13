package {
	import org.flixel.FlxObject;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;

	/**
	 * @author ieiomeli
	 */
	public class Jugador extends FlxSprite {
		[Embed(source = 'spritesheet.png')]
		public static var sheet : Class;
		var bandera : Boolean = false;
		var tiempo : Number = 0;
		var bosshurt : Boolean = false;

		public function Jugador(x : Number, y : Number) {
			super(x, y);
			loadGraphic(sheet, true, true, 28, 42, true);

			// frame para que empiece con cierto frame
			// frame = 6;
			health = 80;
			acceleration.y = 850;

			addAnimation("right", [0, 1, 2, 3], 10, false);
			addAnimation("climb", [8, 9, 10, 11], 10, false);
			addAnimation("left", [4, 5, 6, 7], 10, false);
		}

		public function pelea(a : FlxSprite):void {
			if (this.y + 26 < a.y) {
				a.kill();
			} else {
				this.hurt(20);
				this.bandera = true;

				if (this.facing == FlxObject.RIGHT) {
					this.x -= 20;
					this.y -= 20;
				}
				if (this.facing == FlxObject.LEFT) {
					this.x += 20;
					this.y -= 20;
				}
			}
		}
		
		public function peleaj(a : FlxSprite):void {
			if (this.y + 26 < a.y) {
				a.hurt(20);
				this.y-=40;
				
			} else {
				this.hurt(20);
				this.bandera = true;

				if (this.facing == FlxObject.RIGHT) {

					this.x -= 20;
					this.y -= 20;
				}
				if (this.facing == FlxObject.LEFT) {

					this.x += 20;
					this.y -= 20;
				}
			}
		}

		public function bossFight(a : FlxSprite) : Boolean {
			if (this.y + 20 < a.y) {
				bosshurt = true;
				a.hurt(10);
				if (this.facing == FlxObject.RIGHT) {
					// trace("derecha");
					this.x += 50;
					this.y -= 50;
				}
				if (this.facing == FlxObject.LEFT) {
					// trace("izquierda");
					this.x -= 50;
					this.y -= 50;
				}
			} else {
				this.hurt(20);
				this.bandera = true;
				bosshurt = false;
				// trace("en player "+this.bandera);
				if (this.facing == FlxObject.RIGHT) {
					// trace("derecha");
					this.x -= 20;
					this.y -= 20;
				}
				if (this.facing == FlxObject.LEFT) {
					// trace("izquierda");
					this.x += 20;
					this.y -= 20;
				}
			}
			return bosshurt;
		}
	}
}