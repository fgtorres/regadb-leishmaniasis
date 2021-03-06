package com.pharmadm.custom.rega.awccomposition;

import java.util.ArrayList;
import java.util.List;

import com.pharmadm.custom.rega.queryeditor.AtomicWhereClause;
import com.pharmadm.custom.rega.queryeditor.CompositionBehaviour;
import com.pharmadm.custom.rega.queryeditor.ConfigurableWord;

/**
 * new table variable
 * @author fromba0
 *
 */
public class NewTableComposition extends CompositionBehaviour {

	public boolean canCompose(AtomicWhereClause signatureClause, AtomicWhereClause clause) {
		return matches(signatureClause) && matches(clause);
	}

	public boolean matches(AtomicWhereClause clause) {
		return clause.getOutputVariables().size() == 1 && 
		clause.getConstants().size() == 0 &&
		clause.getInputVariables().size() == 0 &&
		clause.getOutputVariables().iterator().next().getObject().isTable();	
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
