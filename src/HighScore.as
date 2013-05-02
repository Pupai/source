package {
	import org.flixel.FlxButton;
	/**
	 * @author ieiomeli
	 */
	
	import flash.events.MouseEvent;
 	import com.smartfoxserver.v2.SmartFox;
	import com.smartfoxserver.v2.core.SFSEvent;
	import com.smartfoxserver.v2.entities.*;
	import com.smartfoxserver.v2.entities.data.*;
	import com.smartfoxserver.v2.requests.*;
    import org.flixel.FlxG;
    import org.flixel.FlxSprite;
    import org.flixel.FlxState;
    import org.flixel.FlxText;
	
	public class HighScore extends FlxState{
		
		
		private var texto : FlxText;
		private var sfs : SmartFox;
		private var posx : Number;
		private var posy : Number;
		
		 public function HighScore()
        {
            super();
        }
		
		
		 override public function create():void
        {
            var s:FlxSprite = new FlxSprite();
			s.makeGraphic(FlxG.width, FlxG.height, 0xFFFF50);
            add(s);
		   sfs = new SmartFox();
			sfs.loadConfig("sfs-config.xml",true);
			sfs.addEventListener(SFSEvent.CONFIG_LOAD_SUCCESS, onConfigLoadSuccess);
			sfs.addEventListener(SFSEvent.CONFIG_LOAD_FAILURE, onConfigLoadFailure);
			
			
		   var input:CaptureInput=new CaptureInput(100, 100, "Agregar");
		   var botonInicio:FlxButton =  new FlxButton(100, 120, "Enviar", enviarHS);
		   var botonInicio:FlxButton =  new FlxButton(FlxG.width / 2 - 40, FlxG.height / 2 - 60, "Level 1!", Iniciar);
		   
		   add(input);
		   add(botonInicio);
		}
		public function Iniciar():void{
			FlxG.switchState(new Nivel1());
			
		}
		
		public function enviarHS():void{
			FlxG.switchState(new Nivel1());
			
		}

	
		
		override public function update():void
    {	   
        super.update();
	   
    }
	private function onConfigLoadSuccess(evt:SFSEvent):void
		{
			trace("Configuracion lista");
			
			//trace("Server settings: " + sfs.config.host + ":" + sfs.config.port +sfs.config.zone);
		}
		
		private function onConfigLoadFailure(evt:SFSEvent):void
		{
			trace("Configuracion nolista");
		}
		
		
		private function onExtensionResponse(evt:SFSEvent):void
		{
			trace("Me han respondido");
			
			var extParams:SFSObject = evt.params.params;
			trace(evt.params.params.getInt("server_posx"));
			posx=evt.params.params.getInt("server_posx");
			posy=evt.params.params.getInt("server_posy");
			trace(evt.params.params.getInt("server_posy"));
			trace(evt.params.params.getUtfString("server_response"));
		}
		
		private function onLogin(evt:SFSEvent):void {
			trace("si se pudo");
			
			//sfs.send( new JoinRoomRequest("Tutorial") );
			
			var fedex:ISFSObject= SFSObject.newInstance();
			fedex.putInt("posx",100);
			fedex.putInt("posy",100);
			trace(fedex);
			sfs.send(new ExtensionRequest("solicitud",fedex));
			
			/**/
			
		}
		
		private function onLoginError(evt:SFSEvent):void {
			
			trace("no se pudo");
			 trace(evt.params.errorMessage);
			
		}
	}
}

