/** -----------------------------------------------------------
* Image
* -----------------------------------------------------------
* Description: Each Image Object stores the Image Source, a caption, and a reference
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
	public class Image
	{
		private var _caption:String;
		private var _uri:String;
		private var _src:String;
		
		public function Image(caption:String, uri:String, src:String)
		{
			_caption = caption;
			_uri = uri;
			_src = src;
		}
		
		public function get caption():String
		{
			return _caption;
		}
		
		public function get uri():String
		{
			return _uri;
		}
		
		public function get src():String
		{
			return _src;
		}
	}
}