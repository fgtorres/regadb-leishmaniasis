package net.sf.regadb.ui.framework.widgets.datatable;

import java.util.List;

import net.sf.regadb.db.Transaction;


public interface IDataTable <DataType>
{
	public CharSequence[] getColNames();
	
	public void init(Transaction t);
	
	public List<DataType> getDataBlock(Transaction t, int startIndex, int amountOfRows, int sortIndex, boolean isAscending);
	
	public String[] getRowData(DataType type);
	public String[] getRowTooltips(DataType type);
	
	//return null if you do not want to use any filters
	public IFilter[] getFilters();
    
    public String[] getFieldNames();
    
    public long getDataSetSize(Transaction t);
    
    public void selectAction(DataType selectedItem);
    
    public boolean[] sortableFields();
    
    public int[] getColumnWidths();
}
