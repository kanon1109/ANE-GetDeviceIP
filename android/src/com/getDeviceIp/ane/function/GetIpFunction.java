package com.getDeviceIp.ane.function;

import android.content.Context;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;

public class GetIpFunction implements FREFunction 
{
	@Override
	public FREObject call(FREContext context, FREObject[] args) 
	{
		FREObject ipObj = null;
		context.getActivity();
		WifiManager wifiManager = (WifiManager)context.getActivity().getSystemService(Context.WIFI_SERVICE);   
		WifiInfo wifiInfo = wifiManager.getConnectionInfo();   
		int ipAddress = wifiInfo.getIpAddress();   
		String ip = intToIp(ipAddress);   
		try {
			ipObj = FREObject.newObject(ip);
		} catch (FREWrongThreadException e) {
			e.printStackTrace();
		} 
		return ipObj;
	}
	
	/**
	 * 将int型的ip 转换为ip字符串
	 * @param i
	 * @return IP地址
	 */
	public String intToIp(int i) 
	{
		return ( i & 0xFF) + "." + 
				((i >> 8 ) & 0xFF) + "." +  
				((i >> 16 ) & 0xFF) + "." +   
				((i >> 24 ) & 0xFF );
	}  

}
