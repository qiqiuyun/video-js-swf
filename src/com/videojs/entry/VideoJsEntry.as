package com.videojs.entry
{
	import com.videojs.VideoJSModel;
	import com.videojs.events.VideoJSEvent;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
	
	public class VideoJsEntry extends Sprite
	{
		private var w:Number = 0;
		
		private var h:Number = 0;
		
		private var watermark_pos:String = null;
	
		private var watermark_file:String = null;
		
		private var watermark_xrepeat:int = 0;
		
		private var watermark_opacity:Number = 0;
		
		private var fingerprint_text:String = null;
		
		private var fingerprint_size:int = 0;
		
		private var fingerprint_color:uint = 0;
		
		private var fingerprint_duration:int = 0;
		
		private var loader:Loader = null;
		
		private var text:TextField = null;

		private var _model:VideoJSModel = null;
		
		public function VideoJsEntry(param:Object,w:Number,h:Number)
		{
			this.w = w;
			this.h = h;
			
			watermark_pos = param["watermark_pos"];
			watermark_xrepeat = param["watermark_xrepeat"];
			watermark_opacity = param["watermark_opacity"];
			watermark_file = param["watermark_file"];
			
			fingerprint_text = param["fingerprint_text"];
			fingerprint_size = param["fingerprint_size"];
			fingerprint_color = param["fingerprint_color"];
			fingerprint_duration = param["fingerprint_duration"];

			_model = VideoJSModel.getInstance();
			_model.addEventListener(VideoJSEvent.STAGE_RESIZE, onStageResize);
			
			loadPrint();
			
			setThumb();
		}

		private function onStageResize(e:VideoJSEvent):void
		{
			this.w = _model.stageRect.width;
			this.h = _model.stageRect.height;
			
			if(loader == null) return;
			
			const disX:int = 15;
			const disY:int = 10;
			
			loader.x = disX;
			loader.y = disY;
			
			switch(watermark_pos)
			{
				case "top.left":
				{
					loader.x = disX;
					loader.y = disY;
					
					break;
				}
					
				case "top.right":
				{
					loader.x = w - loader.width - disX;
					loader.y = disY;
					
					break;
				}
					
				case "bottom.right":
				{
					
					loader.x = disX;
					loader.y = h - loader.height - disY;
					
					break;
				}
					
				case "bottom.left":
				{
					
					loader.x = w - loader.width - disX;
					loader.y = h - loader.height - disY;
					
					
					break;
				}
					
				case "center":
				{
					loader.x = w / 2 - loader.width / 2;
					loader.y = h / 2 - loader.height / 2;
					
					break;
				}
					
				default:
				{
					break;
				}
			}
			
		}
		
		private function setThumb():void
		{
			if(fingerprint_text == null || fingerprint_text== "" || isNaN(fingerprint_duration) || isNaN(fingerprint_size) || isNaN(fingerprint_color))return;
			
			text = new TextField();
			text.text = fingerprint_text;
			text.width = 350;
			var tft:TextFormat = new TextFormat();
			tft.size = fingerprint_size;
			tft.color = fingerprint_color;
			
			text.setTextFormat(tft);
			text.visible = false;
			
			addChild(text);
			
			const disX:int = 15;
			const disY:int = 10;
			
			var X:Number = 0;
			var Y:Number = 0;
			
			setInterval(function():void{
				
				X = disX +  Math.random() * (w - text.width - disX);
				Y = disY + Math.random() * ( h - text.height - disY);
				
				text.x = X;
				text.y = Y;
				
				text.visible = true;
				
				setTimeout(function():void{text.visible = false},fingerprint_duration);
				
			},3000);
			
		}
		
		private function loadPrint():void
		{
			if(watermark_file != "" && watermark_file != null)
			{
				
				try
				{
					loader = new Loader();
					
					loader.load(new URLRequest(watermark_file));
					
					loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoadComplete);
					
				} 
				catch(error:Error) 
				{
					
				}
				
			}
		}
		
	
	
		private function onLoadComplete(e:Event):void
		{
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoadComplete);
			
			const disX:int = 15;
			const disY:int = 10;
			
			loader.x = disX;
			loader.y = disY;
			
			switch(watermark_pos)
			{
				case "top.left":
				{
					loader.x = disX;
					loader.y = disY;
					
					break;
				}
					
				case "top.right":
				{
					loader.x = w - loader.width - disX;
					loader.y = disY;
					
					break;
				}
					
				case "bottom.right":
				{
					
					loader.x = disX;
					loader.y = h - loader.height - disY;
					
					break;
				}
					
				case "bottom.left":
				{
					
					loader.x = w - loader.width - disX;
					loader.y = h - loader.height - disY;
					
					
					break;
				}
					
				case "center":
				{
					loader.x = w / 2 - loader.width / 2;
					loader.y = h / 2 - loader.height / 2;
					
					break;
				}
					
				default:
				{
					break;
				}
			}
			
			loader.alpha = watermark_opacity;
			
			addChild(loader);
		}
	}
}