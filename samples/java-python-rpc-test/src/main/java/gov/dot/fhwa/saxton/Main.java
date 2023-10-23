package gov.dot.fhwa.saxton;

import org.apache.xmlrpc.XmlRpcException;
import org.apache.xmlrpc.client.XmlRpcClient;
import org.apache.xmlrpc.client.XmlRpcClientConfigImpl;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) throws XmlRpcException, MalformedURLException {
        XmlRpcClientConfigImpl config = new XmlRpcClientConfigImpl();
        config.setServerURL(new URL("http://127.0.0.1:8000/RPC2"));
        XmlRpcClient client = new XmlRpcClient();
        client.setConfig(config);

        String result = (String) client.execute("get_detected_objects_json", new ArrayList<Object>());

//        Object[] params = new Object[]{new String("Hello world!")};
//        String result = (String) client.execute("test.echo", params);

        System.out.println(result);


        result = (String) client.execute("get_detected_objects_json", new ArrayList<Object>());
        System.out.println(result);

        result = (String) client.execute("get_detected_objects_json", new ArrayList<Object>());
        System.out.println(result);
    }
}