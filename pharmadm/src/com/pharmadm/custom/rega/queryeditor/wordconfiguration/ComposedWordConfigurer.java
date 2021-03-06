package com.pharmadm.custom.rega.queryeditor.wordconfiguration;

import java.util.List;

public interface ComposedWordConfigurer extends WordConfigurer {
    /**
     * adds the given words to this configurer
     * @param words
     */
    public void add(List<WordConfigurer> keys, List<WordConfigurer> words);
    
    /**
     * gets the index of the selected word
     * @return
     */
    public int getSelectedIndex();
    
    /**
     * sets the initially selected element
     */
    public void setSelectedIndex(int index);
}
