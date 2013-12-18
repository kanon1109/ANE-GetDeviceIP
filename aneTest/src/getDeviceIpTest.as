package
{
import com.getDeviceIp.ane.GetDeviceIp;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.text.TextField;

public class getDeviceIpTest extends Sprite
{
	private var txt:TextField;
	public function getDeviceIpTest()
	{
		super();
		
		// 支持 autoOrient
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		
		this.txt = new TextField();
		this.txt.textColor = 0xFF0000;
		this.txt.multiline = true;
		this.txt.wordWrap = true;
		this.txt.width = 550;
		this.txt.height = 400;
		this.txt.selectable = false;
		this.txt.mouseEnabled = false;
		this.addChild(this.txt);
		//NetworkInfo在设备上无法获取ip
		/*var netInterfaces = NetworkInfo.networkInfo.findInterfaces();
		var addresses = netInterfaces[0].addresses;
		var userIp = addresses[0].address;
		this.txt.text = "ip:" + userIp;*/
		this.txt.text = "ip:" + GetDeviceIp.getInstance().getIp();
	}
}
}