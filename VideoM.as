﻿package  {		// importar no library path o ficheiro libs/FLVPlaybackAS3.swc	// calocar pasta "video" com video Promo.mp4" para dentro da pasta src	// importar o ficheiro 'FLVPlaybackAS3.swc' em 'Advanced ActionScript 3.0 Settings' na tab 'Library path'	import flash.display.Sprite;	import flash.display.Stage;	import fl.video.FLVPlayback;	import flash.events.Event;	import flash.display.Loader;	import flash.net.URLRequest;	import flash.display.Shape;		public class VideoM extends Sprite{				public var myVideo:FLVPlayback;		public function VideoM()		{			myVideo = new FLVPlayback();			myVideo.source = "/src/video/MakingOff.mp4";			myVideo.height = 800;			myVideo.width = 1280;			myVideo.scaleMode  = "exactFit";			myVideo.volume = 0;			addChild(myVideo);												//myVideo.playheadTime = 39;			myVideo.addEventListener(Event.ENTER_FRAME, fl_ClickToSeekToCuePoint);						var rectangle3:Shape = new Shape;			rectangle3.graphics.beginFill(0x000000);			rectangle3.graphics.drawRect (1047, 565, 196, 235); 			rectangle3.graphics.endFill();			rectangle3.alpha = 0.4;			addChild(rectangle3);						var vGalBtn:Loader = new Loader();			vGalBtn.load(new URLRequest("/src/images/embedded/voltar.png"));			addChild(vGalBtn);			vGalBtn.x = 1062;			vGalBtn.y = 580;		}		public function fl_ClickToSeekToCuePoint(event:Event):void		{			if(myVideo.playheadTime > 129.1 && myVideo.playheadTime < 129.3)			{				myVideo.playheadTime = 0;			}		}		public function removeListeners():void{			myVideo.removeEventListener(Event.ENTER_FRAME, fl_ClickToSeekToCuePoint);		}	}}