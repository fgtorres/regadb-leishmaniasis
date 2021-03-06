package com.pharmadm.custom.rega.awccomposition;

import java.util.ArrayList;
import java.util.List;

import com.pharmadm.custom.rega.queryeditor.AtomicWhereClause;
import com.pharmadm.custom.rega.queryeditor.CompositionBehaviour;
import com.pharmadm.custom.rega.queryeditor.ConfigurableWord;

/**
 * property of a table as a variable
 * @author fromba0
 *
 */
public class PropertyFetchComposition extends CompositionBehaviour {

	private int group;
	
	public PropertyFetchComposition(int group) {
		this.group = group;
	}
	
	
	public boolean canCompose(AtomicWhereClause signatureClause, AtomicWhereClause clause) {
		return ((PropertyFetchComposition) signatureClause.getCompositionBehaviour()).group == ((PropertyFetchComposition) clause.getCompositionBehaviour()).group &&
		matches(signatureClause) && matches(clause);
	}

	public boolean matches(AtomicWhereClause clause) {
		return clause.getOutputVariables().size() == 1 && 
		clause.getConstants().size() == 0 &&
		clause.getInputVariables().size() == 1 &&
		!clause.getOutputVariables().iterator().next().getObject().isTable();	
	}

	public List<ConfigurableWord> getComposableWords(AtomicWhereClause clause) {
		List<ConfigurableWord> words = new ArrayList<ConfigurableWord>();
		return words;
	}

	@Override
	public List<ConfigurableWord> getKeyWords(AtomicWhereClause clause) {
		List<ConfigurableWord> words = new ArrayList<ConfigurableWord>();
		words.add(clause.getOutputVariables().iterator().next());
		return words;
	}

}
