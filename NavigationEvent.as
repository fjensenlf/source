﻿package {    import flash.events.Event;    public class NavigationEvent extends Event    {		public static const VIDEO_PLAY = "video play";		public static const HAND_OVER = "hand over";		public static const BACK_MENU = "back menu";		public static const INIT_BS = "init_bs";		public static const INIT_GAL = "init_gal";		public static const INIT_MAK = "init_mak";		public static const INIT_MENU = "init menu";		public static const MAK_GO = "go tomakingOff";		public static const MAK_BACK = "makingOff back";		public static const VIDEO_MENU = "menu video";		public static const REMOVE_HAND = "remove hand";		public static const HAND_REMOVAL = "hand removal";		public static const REMOVE_LIKE = "remove like";		public static const CLEAR_HOTS = "clear hotspots";        public function NavigationEvent(type:String)        {            super(type);			//trace("NAVIGATION - ", type);        }        //always override clone method in custom events        public override function clone():Event        {            return new NavigationEvent(type);        }    }}