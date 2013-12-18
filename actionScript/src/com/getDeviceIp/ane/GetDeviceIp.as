package com.getDeviceIp.ane 
{
import flash.events.EventDispatcher;
import flash.events.StatusEvent;
import flash.external.ExtensionContext;

/**
 * ... 获取安卓设备ip地址
 * @author Kanon
 */
public class GetDeviceIp extends EventDispatcher 
{
	//与extension.xml中的id标签一致
	public static const EXTENSION_ID:String = "com.getDeviceIp.ane";
	public static const GET_IP:String = "get_ip";
	//用于连接静态库的上下文 
	private var context:ExtensionContext;
	private static var instance:GetDeviceIp;
	public function GetDeviceIp(singletoner:Singletoner) 
	{
		if (!singletoner) throw new Error("非法初始化单例元件");
		this.initContext();
	}
	
	/**
	 * 获取单例
	 * @return
	 */
	public static function getInstance():GetDeviceIp
	{
		if (!instance) instance = new GetDeviceIp(new Singletoner());
		return instance;
	}
	
	/**
	 * 初始化上下文
	 */
	private function initContext():void
	{
		if (!this.context)
		{
			this.context = ExtensionContext.createExtensionContext(GetDeviceIp.EXTENSION_ID, "");
			this.context.addEventListener(StatusEvent.STATUS, statusHandler);
		}
	}
	
	/**
	 * 转抛事件 由游戏内部监听
	 * @param event 回调事件
	 */
	private function statusHandler(event:StatusEvent):void
	{
		this.dispatchEvent(event);
	}
    
    /**
     * 获取设备ip
     * @return  设备ip地址
     */
    public function getIp():String
    {
        if (this.context)
            return this.context.call(GetDeviceIp.GET_IP) as String;
        return "get ip fail";
    }
}
}
class Singletoner {
}