package com.getDeviceIp.ane;

import java.util.HashMap;
import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.getDeviceIp.ane.function.GetIpFunction;
import com.getDeviceIp.ane.utils.LogUtil;

public class GetDeviceIpContext extends FREContext 
{
	public static final String GET_IP = "get_ip";
	@Override
	public void dispose() {
		// TODO Auto-generated method stub

	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		// TODO Auto-generated method stub
		LogUtil.log("GetDeviceIpContext init");
		Map<String, FREFunction> map = new HashMap<String, FREFunction>();
	    map.put(GET_IP, new GetIpFunction());
		return map;
	}

}
