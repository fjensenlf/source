﻿  package  {		//import com.as3nui.nativeExtensions.air.kinect.examples.userMask.UserMaskDemo;	import com.as3nui.nativeExtensions.air.kinect.examples.basic.BasicDemo;	//import com.as3nui.airkinect.extended.demos.ui.UIHotSpotDemo;		import com.as3nui.nativeExtensions.air.kinect.data.User;	import com.as3nui.nativeExtensions.air.kinect.events.UserEvent;	import caurina.transitions.Tweener;	import flash.events.Event;	import flash.display.Sprite;	import flash.display.Bitmap;	import flash.display.Stage;	import flash.display.StageDisplayState;	import flash.utils.*;		public class Kinky extends Sprite {				public var gal:GaleriaInt;		public var vid:video;		public var hand:Hand;		public var galVid:galeriaL;		public var galBtn:VidGalBtn;		public var sombra:Sombra;				public var dB:BaseD;		public var hSarray:Array;		public var hSVarray:Array;		public var changeSombraState;		//public var hhh:UIHotSpotDemo;				public function Kinky() {			//stage.displayState=StageDisplayState.FULL_SCREEN;						videoGaleria();			dB = new BaseD();			addChild(dB);			dB.device.addEventListener(UserEvent.USERS_ADDED, usersAddedHandler, false, 0, true);			dB.device.addEventListener(UserEvent.USERS_REMOVED, usersRemovedHandler, false, 0, true);			dB.device.addEventListener(UserEvent.USERS_MASK_IMAGE_UPDATE, usersMaskImageUpdateHandler, false, 0, true);		}		protected function usersAddedHandler(e:UserEvent):void {			if(sombra != null){				sombra.usersDetected(e);				changeSombraState = setInterval(sombraState,5000);				Tweener.addTween(galVid, {x:-galVid.width, time: 1, transition: "easeInOutCubic", delay: 1});				Tweener.addTween(galBtn, {y:0, time: 1, transition: "easeInOutCubic", delay: 3});				vid.userV = true;				dispatchEvent(new ChildEvent(ChildEvent.HOTSPOT_VIDEO, "galeria"))			}		}		protected function usersMaskImageUpdateHandler(ev:UserEvent):void {			if(sombra != null){				sombra.usersUpdate(ev);			}		}		protected function usersRemovedHandler(eve:UserEvent):void {			if(sombra != null){				sombra.usersRemoved(eve);			}		}		public function sombraState(){			if(sombra != null){				removeChild(sombra);				sombra = null;			}			hand = new Hand();			addChild(hand);			hand.y = -200;			clearInterval(changeSombraState);		}		public function videoGaleria():void		{			vid = new video();			addChild(vid);			galVid = new galeriaL();			addChild(galVid);			sombra = new Sombra();			addChild(sombra);			galBtn = new VidGalBtn();			addChild(galBtn);			galBtn.y = 330;			//galVid.addEventListener(NavigationEvent.VIDEO_PLAY, playFromGallery);		}		public function galeria():void		{				hSarray = new Array();			hSarray = dB.hotS.instances;			hSVarray = new Array();			hSVarray = dB.hotS.instanceVid;			gal = new GaleriaInt(hSarray, hSVarray);			addChild(gal);			//gal.addEventListener(NavigationEvent.VIDEO_PLAY, playFromGallery);		}		/*public function playFromGallery(event:NavigationEvent):void		{			vid = new video();			addChild(vid);			removeChild(gal);			gal = null;		}*/	}}