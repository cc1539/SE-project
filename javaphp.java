
import java.net.*;
import java.io.*;
import java.nio.charset.StandardCharsets;

// this function uses the below two functions to send a post request with data to a given url address.
void example() {
  try {
	  
    HttpURLConnection urlc = getURLConnection(
      "https://inspark2019.000webhostapp.com/v2/php/traffic.php"+ // main url
      "?activity=enter&spot=10&lpnum=deletus", // url parameters
      "POST"); // request method
	
    println(urlc.getResponseCode());
	// this gives the website's response code.
	// for example, if the file you're looking for doesn't exist, you'll get 404.
	// 200 indicates success.
	
    println(getURLConnectionOutput(urlc));
	// see below for an explanation
	
  } catch(Exception e) {}
}

// this gives you the output of the php files, which I've programmed to provide
// diagnostic information 
String getURLConnectionOutput(HttpURLConnection urlc) {
  StringBuilder str = new StringBuilder();
  try {
    BufferedReader in = new BufferedReader(
      new InputStreamReader(
      urlc.getInputStream(),"UTF-8"));
    for(int c;(c=in.read())>=0;) {
      str.append((char)c);
    }
    in.close();
  } catch(Exception e) {
    e.printStackTrace();
  }
  return str.toString();
}

HttpURLConnection getURLConnection(String url, String type) throws Exception {
  
  String agent =
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "+
    "AppleWebKit/537.36 (KHTML, like Gecko) "+
    "Chrome/70.0.3538.102 Safari/537.36";
    
  if(type.equals("POST")) {
    
    //println("POST request detected!");
    //println("given url is: "+url);
    
    int param_index = url.lastIndexOf("?");
    String params = "";
    if(param_index!=-1) {
      params = url.substring(param_index+1);
      url = url.substring(0,param_index);
    }
    byte[] data = params.getBytes(StandardCharsets.UTF_8);
    
    //println("trimmed url is: "+url);
    //println("parameter text is: "+params);
    
    HttpURLConnection urlc = (HttpURLConnection)new URL(url).openConnection();
    urlc.setDoOutput(true);
    urlc.setInstanceFollowRedirects(false);
    urlc.setRequestMethod("POST");
    urlc.setRequestProperty("user-agent",agent);
    urlc.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
    urlc.setRequestProperty("charset","utf-8");
    urlc.setRequestProperty("Content-Length",Integer.toString(data.length));
    urlc.setUseCaches(false);
    urlc.getOutputStream().write(data);
    
    return urlc;
  } else if(type.equals("GET")) {
    
    HttpURLConnection urlc = (HttpURLConnection)new URL(url).openConnection();
    urlc.setRequestMethod("GET");
    urlc.setRequestProperty("user-agent",agent);
    
    return urlc;
  }
  throw new Exception("only POST and GET allowed");
}
