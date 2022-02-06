package net.sf.regadb.ui.framework.forms.fields;

import net.sf.regadb.ui.framework.forms.FormWidget;
import net.sf.regadb.ui.framework.forms.InteractionState;
import eu.webtoolkit.jwt.WFormWidget;
import eu.webtoolkit.jwt.WImage;
import eu.webtoolkit.jwt.WLabel;

public class Label extends WLabel
{
	private static WImage createAsterisk() {
		WImage asterisk = new WImage("pics/formAsterisk.gif");
		asterisk.setAlternateText(tr("form.label.alternateText.isRequired"));
		return asterisk;
	}
	
	public Label(CharSequence labelText)
	{
		super(labelText);
        this.setStyleClass("form-label");
	}
	
	public void setBuddy(FormField formField)
	{
		WFormWidget formWidget = formField.getFormWidget();
		if(formWidget!=null)
		{
			setBuddy(formField.getFormWidget());
		}
		if(formField.isMandatory()) {
			setImage(createAsterisk());
		} else {
			setImage(null);
		}	
	}
    
    public void setLabelUIMandatory(FormWidget form)
    {
        if(form.getInteractionState()==InteractionState.Editing || form.getInteractionState()==InteractionState.Adding)
        	setImage(createAsterisk());
        else
        	setImage(null);
    }
}