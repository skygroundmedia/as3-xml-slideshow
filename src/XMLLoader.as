/** -----------------------------------------------------------
* XML Loader
* -----------------------------------------------------------
* Description: Loads and Parses the XML File
* - ---------------------------------------------------------
* Created by: chrisaiv@gmail.com
* Modified by: 
* Date Modified: September 10, 2008
* - ---------------------------------------------------------
* Copyright ©2008 
* - ---------------------------------------------------------
*
*
*/
package src
{
	import flash.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class XMLLoader extends EventDispatcher
	{
		private var _data:Array;

		public function XMLLoader(target:IEventDispatcher=null)
		{
			super(target);
		}

		public function load( xmlURL:String ):void
		{
			var loader:URLLoader = new URLLoader();
				loader.addEventListener( Event.COMPLETE, onXMLLoaded );
				loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler, false, 0, true);
				loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler, false, 0, true);
				loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler, false, 0, true);
				loader.addEventListener(ProgressEvent.PROGRESS, progressHandler, false, 0, true);
				loader.load( new URLRequest( xmlURL ) );
		}
		
		private function onXMLLoaded( e:Event ):void
		{
			_data = new Array();
			
			var xml:XML = new XML( e.currentTarget.data );
			var images:XMLList = xml.child( "image" );
			var numImages:uint = images.length();
			var image:XML;
			
			for(var i:uint = 0; i < numImages; i++){
				image = images[i] as XML;
				//trace( image.child("caption") );				
				_data.push( new Image( image.child("caption").toString(), image.child("uri").toString(), image.child("src").toString() ) );
			}
			//Fire once the XML has been converted into Image Objects
			dispatchEvent( new Event( Event.COMPLETE ) );			
		}
		
		public function getImageData():Array
		{
			return _data;
		}

		private function httpStatusHandler (e:Event):void
		{
			//trace("httpStatusHandler:" + e);
		}
		
		private function securityErrorHandler (e:Event):void
		{
			trace("securityErrorHandler:" + e);
		}
		
		private function ioErrorHandler(e:Event):void
		{
			trace("ioErrorHandler: " + e);
		}
		
		private function progressHandler(e:Event):void
		{
			//trace(e.currentTarget.bytesLoaded + " / " + e.currentTarget.bytesTotal);
		}
	}
}