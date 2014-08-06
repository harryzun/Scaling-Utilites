import com.stencyl.models.Actor;

class ScaleUtils
{
	public static function getScale(axis:String, actor:Actor)
	{
	
		switch axis
		{
			case "h": 		return actor.realScaleY * 100;
			default:
							return actor.realScaleX * 100;
		}
	}
	
	public static function scaledCoord(axis:String, actor:Actor)
	{
		switch axis
		{
			case "xs":		return ScaleUtils.offset(actor.getScreenX(), "xr", actor);
			case "ys": 		return ScaleUtils.offset(actor.getScreenY(), "yr", actor);
			case "y": 		return ScaleUtils.offset(actor.getY(), "yr", actor);
			default:
							return ScaleUtils.offset(actor.getX(), "xr", actor);
		}
	}
	
	public static function offset(coord:Float, axis:String, actor:Actor)
	{
		switch axis
		{
			case "xr":		return ((	actor.getWidth()	- actor.getWidth()	% 2) * (actor.realScaleX - 1)) / -2 + coord;
			case "yr": 		return ((	actor.getHeight()	- actor.getHeight() % 2) * (actor.realScaleY - 1)) / -2 + coord;
			case "ya": 		return (((	actor.getHeight()	- actor.getHeight() % 2) * (actor.realScaleY - 1)) / -2 + coord) * -1;
			default:
							return (((	actor.getWidth()	- actor.getWidth()	% 2) * (actor.realScaleX - 1)) / -2 + coord) * -1;
		}
	}
	
	public static function scale(axis:String, percent:Float, actor:Actor)
	{
		var factor = percent / 100;
		
		switch axis
		{
			case "width":	actor.realScaleX = factor;
			case "height":	actor.realScaleY = factor;
			default:
							actor.realScaleX = factor;
							actor.realScaleY = factor;
		}
	}
	
	public static function setScale(axis:String, newSize:Float, actor:Actor)
	{
		switch axis
		{
			case "width":	actor.realScaleX = newSize / actor.getWidth();
			case "height":	actor.realScaleY = newSize / actor.getHeight();
			default:
							actor.realScaleX = newSize / actor.getWidth();
							actor.realScaleY = newSize / actor.getHeight();
		}
	}
	
	public static function scaledSize(axis:String, actor:Actor)
	{
		switch axis
		{
			case "halfwidth":	return actor.getWidth()		* actor.realScaleX / 2;
			case "halfheight":	return actor.getHeight()	* actor.realScaleY / 2;
			case "height":		return actor.getHeight()	* actor.realScaleY;
			default:
								return actor.getWidth()		* actor.realScaleX;
		}
	}
	
	public static function isScaled(actor:Actor)
	{
		return actor.realScaleX != 1 || actor.realScaleY != 1;
	}
}