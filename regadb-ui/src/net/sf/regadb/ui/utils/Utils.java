package net.sf.regadb.ui.utils;

import java.io.IOException;
import java.io.StringReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.codec.binary.Base64;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import eu.webtoolkit.jwt.WMemoryResource;
import eu.webtoolkit.jwt.servlet.UploadedFile;
import net.sf.regadb.ui.framework.RegaDBMain;

public class Utils {

	public static WMemoryResource XMLToWMemoryResource(byte[] xml) {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();  
	    Document document = null;
	    try {  
	    	DocumentBuilder builder = factory.newDocumentBuilder();  
	        document = builder.parse(new InputSource(new StringReader(new String(xml))));						     
	    } catch (Exception e) {  
	        e.printStackTrace();  
	    }
	    NodeList nodeList = document.getElementsByTagName("*");
	    WMemoryResource wMemoryResource = new WMemoryResource();
	    
	    for (int j = 0; j < nodeList.getLength(); j++) {
	        Node node = nodeList.item(j);
	        if (node.getNodeType() == Node.ELEMENT_NODE) {
	        	if(node.getNodeName() == "mime-type") {
	        		wMemoryResource.setMimeType(node.getTextContent());
	        	} else if(node.getNodeName() == "content") {
	        		wMemoryResource.setData(Base64.decodeBase64(node.getTextContent().getBytes()));
	        	}
	        }
	    }
	    
	    return wMemoryResource;
	}
	
	public static String uploadedFilesToXML(List<UploadedFile> uploadedFiles) {
		
		String output = "";
		if(uploadedFiles.size() > 0) {
			UploadedFile uploadedFile = getMostRecentUploadedFile(uploadedFiles);
			byte[] data = null;
			try {
				data = Files.readAllBytes(Paths.get(uploadedFile.getSpoolFileName()));
			} catch (IOException e) {
				System.err.println("Could not find the location of the uploaded file");
				e.printStackTrace();
			}
			
			/**
			 * <img>
			 * 	<mime-type></mime-type>
			 * 	<content></content>
			 * </img>
			 */
			
			output = "<img><mime-type>"+uploadedFile.getContentType()+"</mime-type><content>"+new String(Base64.encodeBase64(data))+"</content></img>";
			//			Code to create the same XML tree but more dynamic and useful to complex trees
//			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
//			try {
//				DocumentBuilder loader = factory.newDocumentBuilder();
//				Document document = loader.newDocument();
//				Element root = document.createElement("img");
//				Element mimeType = document.createElement("mime-type");
//				Element content = document.createElement("content");
//				mimeType.setTextContent(uploadedFile.getContentType());
//				content.setTextContent(Base64.encodeBase64String(data));
//				root.appendChild(mimeType);
//				root.appendChild(content);
//				document.appendChild(root);
//				
//				TransformerFactory tf = TransformerFactory.newInstance();
//				Transformer transformer = tf.newTransformer();
//				transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
//				StringWriter writer = new StringWriter();
//				transformer.transform(new DOMSource(document), new StreamResult(writer));
//				output = writer.getBuffer().toString().replaceAll("\n|\r", "");
//			} catch (ParserConfigurationException | TransformerException e) {
//				e.printStackTrace();
//			}
		}
		return output;
	}
	
	public static UploadedFile getMostRecentUploadedFile(List<UploadedFile> uploadedFiles) {
		if(uploadedFiles.size() > 0) {
			return uploadedFiles.get(uploadedFiles.size() - 1);
		} else {
			return null;
		}
	}
	
	public static String generateFilename(String code){
		SimpleDateFormat formatdate = new SimpleDateFormat("ddMMyyyyHHmmssSSS"); 
		String realizeddate = formatdate.format(System.currentTimeMillis());
		return code + "_" + realizeddate;
	}
}