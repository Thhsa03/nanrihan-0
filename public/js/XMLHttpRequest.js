// ------------------------------------------------------------
// XMLHttpRequest オブジェクトを作成する関数
// ------------------------------------------------------------
function XMLHttpRequestCreate()
{
	try{
		return new XMLHttpRequest();
	}catch(e){}
	try{
		return new ActiveXObject('MSXML2.XMLHTTP.6.0');
	}catch(e){}
	try{
		return new ActiveXObject('MSXML2.XMLHTTP.3.0');
	}catch(e){}
	try{
		return new ActiveXObject('MSXML2.XMLHTTP');
	}catch(e){}

	return null;
}
// オブジェクトの作成
var xhr = XMLHttpRequestCreate();
// ------------------------------------------------------------
// 「POST メソッド」「接続先 URL」を指定
// ------------------------------------------------------------
//var url = "http://example.com/test.cgi";
//xhr.open("POST" , url);

// ------------------------------------------------------------
// 「送信データ」を指定、XHR 通信を開始する
// ------------------------------------------------------------
//var send_data = "送信テスト";
//xhr.send(send_data);