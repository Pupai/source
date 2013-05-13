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
		private var scores: String;
		private var time: int;
		private var level: String;
		private var name: String;
		private var pressed:Boolean=false;
		private var botonAgregar:FlxButton
		
		 public function HighScore(t:Number, l:String, n:String)
        {
            super();
			time=t;
			level=l;
			name=n;
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
			sfs.addEventListener(SFSEvent.CONNECTION, onConnection);
			sfs.addEventListener(SFSEvent.EXTENSION_RESPONSE, onExtensionResponse);
			sfs.addEventListener(SFSEvent.LOGIN, onLogin);
			sfs.addEventListener(SFSEvent.LOGIN_ERROR, onLoginError);

			sfs.addEventListener(SFSEvent.ROOM_JOIN, onJoin);
			sfs.addEventListener(SFSEvent.ROOM_JOIN_ERROR, onJoinError);
			
		   botonAgregar=  new FlxButton(FlxG.width / 2 - 40, FlxG.height / 2 - 90, "Enviar", enviarHS);
		   var botonInicio:FlxButton =  new FlxButton(FlxG.width / 2 - 40, FlxG.height / 2 - 60, "Next Level!", Iniciar);
		   var titulo : FlxText=new FlxText(0, 170, FlxG.width, "High Scores").setFormat(null, 20, 0xFFFFFF, "center");
		   var nombre : FlxText=new FlxText(0, 80, FlxG.width, "Tu score es: "+time).setFormat(null, 20, 0xFFF3030, "center");
		   
		   add(nombre);
		   add(titulo);
		   add(botonAgregar);
		   add(botonInicio);
		}
		public function Iniciar():void{
			if(level=="nivel1"){
				FlxG.switchState(new Nivel2(name,0));
			}
			if(level=="nivel2"){
				FlxG.switchState(new Nivel3(name,0));
			}
			if(level=="nivel3"){
				FlxG.switchState(new Creditos());
			}
			
		}
		
		public function enviarHS():void{
			var fedex:ISFSObject= SFSObject.newInstance();
			fedex.putUtfString("level",level);
			fedex.putUtfString("name",name);
			fedex.putUtfString("score",time+"");
			sfs.send(new ExtensionRequest("db",fedex));
			pressed=true;
			
		}

	
		
		override public function update():void
    {	   
        super.update();
		remove(texto);
		texto=new FlxText(0, 200, FlxG.width, scores).setFormat(null, 15, 0xFFF3030, "center");
		add(texto);
		if(pressed){
			botonAgregar.visible=false;
		}
	   
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
		private function onConnection(evt:SFSEvent):void
		{
			if (evt.params.success)
			{
				
			trace("Estoy conectado");
				
				sfs.send( new LoginRequest("", "", "Pupai") );
				
			}
			else
			{
				trace(evt.params.errorMessage);
			}
		}
		
		
		
		private function onExtensionResponse(evt:SFSEvent):void
		{
			trace("Me han respondido");
			
			var extParams:SFSObject = evt.params.params;
			scores=extParams.getUtfString("json");
		}
		
		private function onLogin(evt:SFSEvent):void {
			trace("si se pudo");
			sfs.send( new JoinRoomRequest("Tutorial") );
			var fedex:ISFSObject= SFSObject.newInstance();
			fedex.putUtfString("level",level);
			sfs.send(new ExtensionRequest("db",fedex));

			
			
			/**/
			
		}
		
		private function onLoginError(evt:SFSEvent):void {
			
			trace("no se pudo");
			 trace(evt.params.errorMessage);
			
		}
		
		private function onJoin(evt:SFSEvent):void {
			
			trace("Estoy en un cuarto");
			
			
			
		}
		
		private function onJoinError(evt:SFSEvent):void {
			
			trace("No se pudo entrar al cuarto");
			
		}
	}
}

