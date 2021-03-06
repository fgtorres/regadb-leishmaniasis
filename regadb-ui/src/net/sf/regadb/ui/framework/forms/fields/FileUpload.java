package net.sf.regadb.ui.framework.forms.fields;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

import net.sf.regadb.ui.framework.forms.IForm;
import net.sf.regadb.ui.framework.forms.InteractionState;
import eu.webtoolkit.jwt.Signal;
import eu.webtoolkit.jwt.Signal1;
import eu.webtoolkit.jwt.WAnchor;
import eu.webtoolkit.jwt.WContainerWidget;
import eu.webtoolkit.jwt.WFileUpload;
import eu.webtoolkit.jwt.WFormWidget;
import eu.webtoolkit.jwt.WMouseEvent;
import eu.webtoolkit.jwt.WPushButton;
import eu.webtoolkit.jwt.WResource;
import eu.webtoolkit.jwt.WWidget;

public class FileUpload extends WContainerWidget implements IFormField{
	public static class FileBlob implements Serializable {
		public String fileName;
		public String data;
		
		public FileBlob(String fileName, String data) {
			this.fileName = fileName;
			this.data = data;
		}

		public static FileBlob loadBlob(byte[] blob) {
			if (blob == null) 
				return null;
			try {
				ObjectInputStream ois = 
					new ObjectInputStream(new ByteArrayInputStream(blob));
				FileBlob file = (FileBlob)ois.readObject();
				ois.close();
				return file;
			} catch (IOException e) {
				e.printStackTrace();
				return null;
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				return null;
			} 
		}

		public byte[] saveBlob() {
			try {
				ByteArrayOutputStream bos = new ByteArrayOutputStream();
				ObjectOutputStream oos = new ObjectOutputStream(bos);
				oos.writeObject(this);
				oos.close();
				return bos.toByteArray();
			} catch (IOException e) {
				e.printStackTrace();
				return null;
			}
		}
	}
	
	private WAnchor link;
	private WFileUpload uploadFile;
	private WPushButton uploadButton;
	
	private boolean mandatory;
	
	private IForm form;
	
	public FileUpload(InteractionState istate, IForm form) {
		this.form = form;
		
        link = new WAnchor("dummy", "", this);
        link.setStyleClass("link");
        
        uploadFile = new WFileUpload(this);
        uploadFile.uploaded().addListener(this, new Signal.Listener()  {
            public void trigger() {
                link.setHidden(uploadFile.getClientFileName()==null);
                uploadButton.setEnabled(true);
                uploadButton.setText(tr("form.general.button.upload"));
                setAnchor(uploadFile.getClientFileName(), uploadFile.getSpoolFileName());
            }
        });
        
        uploadButton = new WPushButton(tr("form.general.button.upload"), this);
        uploadButton.clicked().addListener(this, new Signal1.Listener<WMouseEvent>() {
            public void trigger(WMouseEvent a) {
                uploadButton.setText(tr("form.general.button.uploading"));
            	uploadFile.upload();
            }
        });
        
        if (istate == InteractionState.Viewing || istate == InteractionState.Deleting) {
        	uploadFile.setHidden(true);
        	uploadButton.setHidden(true);
        }
        
        if (form != null)
        	form.addFormField(this);
	}
	
	public WFileUpload getFileUpload() {
		return uploadFile;
	}
	
	public void setAnchor(CharSequence title, String url) {
	        link.setText(title);
	        link.setRef(url);
	}
	
	public void setAnchor(CharSequence title, WResource res){
		link.setResource(res);
		link.setText(title);
	}

	public void flagErroneous() {
		setStyleClass("Wt-invalid");
	}

	public void flagValid() {
		setStyleClass("");
	}

	public String getFormText() {
		return getFileUpload().getClientFileName();
	}

	public WFormWidget getFormWidget() {
		return null;
	}

	public WWidget getViewWidget() {
		return link;
	}

	public WWidget getWidget() {
		return this;
	}

	public boolean isMandatory() {
		return mandatory;
	}

	public void setConfirmAction(Signal.Listener se) {
//        if(getFormWidget()!=null) {
//            getFormWidget().enterPressed().removeAllListeners();
//            if(se != null)
//                getFormWidget().enterPressed().addListener(this, se);
//            }
	}

	public void setFormText(String text) {
	}

	public void setMandatory(boolean mandatory) {
		this.mandatory = mandatory;
	}

	public boolean validate() {
		if (isMandatory()) {
			return getFileUpload().getClientFileName() != null;
		}
		return true;
	}

	public IForm getForm() {
		return form;
	}
}
