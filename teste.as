﻿package  {		//import com.as3nui.nativeExtensions.air.kinect.examples.userMask.Sombra;//examples.basic.BasicDemo;	//import com.as3nui.airkinect.extended.demos.ui.UIHotSpotDemo;	import com.as3nui.nativeExtensions.air.kinect.data.User;	import com.as3nui.nativeExtensions.air.kinect.events.UserEvent;	import caurina.transitions.Tweener;	import flash.events.Event;	import flash.display.Sprite;	import flash.display.Shape;	import flash.display.Stage;	import flash.utils.*;		public class teste extends Sprite {				public var gal:GaleriaInt;		public var vid:video;		public var vidM:VideoM;		public var hand:Hand;		public var galVid:galeriaL;		public var vGalBtn:GalVidBtn;		public var galBtn:VidGalBtn;		public var sombra:Sombra;		public var like:Like;		public var dB:BaseD;		public var hSarray:Array;		public var hSVarray:Array;		public var changeSombraState;		public var usersIO:uint;				public function teste() {			usersIO = 0;						dB = new BaseD();			addChild(dB);									//galeria();			init();		}		public function init():void		{			videoGaleria();			dB.device.addEventListener(UserEvent.USERS_ADDED, usersAddedHandler, false, 0, true);			dB.device.addEventListener(UserEvent.USERS_REMOVED, usersRemovedHandler, false, 0, true);			dB.device.addEventListener(UserEvent.USERS_MASK_IMAGE_UPDATE, usersMaskImageUpdateHandler, false, 0, true);			dB.device.addEventListener(UserEvent.USERS_UPDATED, numbUsers, false, 0, true);			dB.addEventListener(NavigationEvent.INIT_GAL, galeria);			dB.addEventListener(NavigationEvent.INIT_MAK, toMaking);			dB.addEventListener(NavigationEvent.INIT_MENU, fromMaking);			dB.addEventListener(NavigationEvent.HAND_REMOVAL, handRemoval);			setChildIndex(dB,numChildren - 1);		}		protected function numbUsers(event:UserEvent):void {			var changed:uint = usersIO;			if(event.users.length > 0){				for each(var usr:User in event.users) {					if(usr.position.world.z > 0)					{						usersIO = 1;						break					} else {						usersIO = 0;					}									}							}			//trace(usersIO,event.users.length);			if(changed != usersIO && vid != null){				vid.dispatchEvent(new CustomEvent(CustomEvent.VIDEO_STATE, "video", usersIO))			}		}		protected function usersAddedHandler(e:UserEvent):void {			if(sombra != null){				sombra.usersDetected(e);				changeSombraState = setInterval(sombraState,5000);				Tweener.addTween(galVid, {x:-galVid.width, time: 1, transition: "easeInOutCubic", delay: 1});				Tweener.addTween(galBtn, {y:0, time: 1, transition: "easeInOutCubic", delay: 3});				//dB.dispatchEvent(new ChildEvent(ChildEvent.HOTSPOT_VIDEO, "galeria"))			}		}		protected function usersMaskImageUpdateHandler(ev:UserEvent):void {			if(sombra != null){				sombra.usersUpdate(ev);			}		}		protected function usersRemovedHandler(eve:UserEvent):void {			if(sombra != null){				sombra.usersRemoved(eve);			}		}		public function sombraState(){			if(sombra != null){				removeChild(sombra);				sombra = null;			}			hand = new Hand();			addChild(hand);			hand.y = -200;			clearInterval(changeSombraState);			hand.addEventListener(NavigationEvent.REMOVE_HAND, handRemoval);			dB.dispatchEvent(new NavigationEvent(NavigationEvent.VIDEO_MENU));		}		public function handRemoval(event:NavigationEvent){			if(hand != null){				hand.removeEventListener(NavigationEvent.REMOVE_HAND, handRemoval);				removeChild(hand);				hand = null;								like = new Like();				addChild(like);				like.addEventListener(NavigationEvent.REMOVE_LIKE, removeLike);			}		}		public function removeLike(event:NavigationEvent){			like.removeEventListener(NavigationEvent.REMOVE_LIKE, removeLike);			removeChild(like);			like = null;		}		public function videoGaleria():void		{			vid = new video();			addChild(vid);			galVid = new galeriaL();			addChild(galVid);			sombra = new Sombra();			addChild(sombra);			galBtn = new VidGalBtn();			addChild(galBtn);			galBtn.y = 330;			//galVid.addEventListener(NavigationEvent.VIDEO_PLAY, playFromGallery);		}		public function toMaking(e:NavigationEvent):void		{			vidM = new VideoM();			addChild(vidM);						vid.myVideo.stop();			vid.removeListeners();			removeChild(vid);			vid = null;						removeChild(galBtn);			galBtn = null;						if(galVid != null){				galVid.removeListeners();				removeChild(galVid);				galVid = null;			}					}		public function fromMaking(e:NavigationEvent):void		{			vid = new video();			addChild(vid);			galBtn = new VidGalBtn();			addChild(galBtn);			setChildIndex(dB,numChildren - 1);						if(vidM != null){				vidM.myVideo.stop();				vidM.removeListeners();				removeChild(vidM);				vidM = null;			}			if(gal != null){				gal.removeEventListener(NavigationEvent.BACK_MENU, fromMaking);				removeChild(gal);				gal = null;				dB.dispatchEvent(new NavigationEvent(NavigationEvent.VIDEO_MENU));			}		}		public function galeria(e:NavigationEvent):void		{				hSarray = new Array();			hSarray = dB.hotS.instances;			hSVarray = new Array();			hSVarray = dB.hotS.instanceVid;			gal = new GaleriaInt(hSarray, hSVarray);			addChild(gal);						if(vid != null){				vid.myVideo.stop();				vid.removeListeners();				removeChild(vid);				vid = null;				if(galVid != null){					galVid.removeListeners();					removeChild(galVid);					galVid = null;				}				/*removeChild(sombra);				sombra = null;*/				removeChild(galBtn);				galBtn = null;			}			gal.addEventListener(NavigationEvent.BACK_MENU, fromMaking);		}	}}