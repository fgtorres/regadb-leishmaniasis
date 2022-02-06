package net.sf.regadb.ui.framework.forms.fields;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import net.sf.regadb.ui.framework.RegaDBMain;
import net.sf.regadb.ui.framework.forms.IForm;
import net.sf.regadb.ui.framework.forms.InteractionState;
import net.sf.regadb.ui.utils.Utils;
import net.sf.regadb.util.file.FileUtils;
import net.sf.regadb.util.settings.RegaDBSettings;
import eu.webtoolkit.jwt.Signal;
import eu.webtoolkit.jwt.Signal.Listener;
import eu.webtoolkit.jwt.WContainerWidget;
import eu.webtoolkit.jwt.WFileUpload;
import eu.webtoolkit.jwt.WImage;
import eu.webtoolkit.jwt.WLength;
import eu.webtoolkit.jwt.WMemoryResource;
import eu.webtoolkit.jwt.WResource;
import eu.webtoolkit.jwt.WWidget;
import eu.webtoolkit.jwt.servlet.UploadedFile;

public class ImageField extends WContainerWidget implements IFormField {

	private WFileUpload wFileUpload;
	private WImage _fieldView;
	private String filename;
	private boolean mandatory_ = false;
	private IForm form;

	public ImageField(InteractionState state, IForm form) {
		this.filename = "";
		this.form = form;
		
		if (state == InteractionState.Adding || state == InteractionState.Editing) {
			wFileUpload = new WFileUpload();
			
			wFileUpload.changed().addListener(this, new Signal.Listener() {
		        public void trigger() {
		        	wFileUpload.upload();
		        }
		    });
			
			wFileUpload.uploaded().addListener(this, new Signal.Listener() {
				@Override
				public void trigger() {
					List<UploadedFile> uploadedFiles = wFileUpload.getUploadedFiles();
		        	byte[] data = null;
		        	UploadedFile uploadedFile = null;
		        	if(uploadedFiles.size() > 0) {
						uploadedFile = uploadedFiles.get(uploadedFiles.size() - 1);
						try {
							String name;
							if(getFileName().length() > 2){
								name= getFileName() + uploadedFile.getClientFileName().substring(
									uploadedFile.getClientFileName().lastIndexOf("."));
								setFileName(name);
							}else{
								name = uploadedFile.getClientFileName()+uploadedFile.getClientFileName().substring(
										uploadedFile.getClientFileName().lastIndexOf("."));
								setFileName(name);
							}
							
							data = Files.readAllBytes(Paths.get(uploadedFile.getSpoolFileName()));
							Files.copy(Paths.get(uploadedFile.getSpoolFileName()), 
									Paths.get(RegaDBSettings.getInstance().getInstituteConfig().getFilesStoreDir().getAbsolutePath()
											+File.separator+ name)
									, java.nio.file.StandardCopyOption.REPLACE_EXISTING );
							
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					WMemoryResource wMemoryResource = new WMemoryResource();
					wMemoryResource.setData(data);
					wMemoryResource.setMimeType(uploadedFile.getContentType());
					setMaximumSize(new WLength(400), new WLength(400));
					setImage(wMemoryResource);
					getWImage().setMaximumSize(new WLength(400), new WLength(400));
				}
			});
			_fieldView = new WImage();
			
			addWidget(_fieldView);
			addWidget(wFileUpload);
			flagValid();
		} else {
			_fieldView = new WImage();
			
			addWidget(_fieldView);
		}

		if (form != null) {
			form.addFormField(this);
		}
	}

	public WImage getWImage() {
		return _fieldView;
	}

	public WFileUpload getWFileUpload() {
		return wFileUpload;
	}

	@Override
	public boolean isMandatory() {
		return mandatory_;
	}

	@Override
	public void setMandatory(boolean mandatory) {
		mandatory_ = mandatory;
	}

	@Override
	public WWidget getViewWidget() {
		return _fieldView;
	}

	@Override
	public boolean validate() {
		// TODO define a good validation
		return true;
	}

	@Override
	public void flagErroneous() {

	}

	@Override
	public void flagValid() {

	}

	@Override
	public WWidget getWidget() {
		return this;
	}

	@Override
	public void setConfirmAction(Listener se) {
		// TODO Auto-generated method stub

	}

	@Override
	public IForm getForm() {
		return form;
	}

	public void setImage(WResource wResource) {
		_fieldView.setResource(wResource);
	}

	public void setFileName(String filename) {
		this.filename = filename;
	}

	public String getFileName() {
		return this.filename;
	}
}