package net.sf.regadb.db;


/**
 * QueryDefinitionParameterType generated by hbm2java
 */
public class QueryDefinitionParameterType implements java.io.Serializable {

    private Integer queryDefinitionParameterTypeIi;

    private String name;

    private int id;

    public QueryDefinitionParameterType() {
    }

    public QueryDefinitionParameterType(String name, int id) {
        this.name = name;
        this.id = id;
    }

    public Integer getQueryDefinitionParameterTypeIi() {
        return this.queryDefinitionParameterTypeIi;
    }

    public void setQueryDefinitionParameterTypeIi(
            Integer queryDefinitionParameterTypeIi) {
        this.queryDefinitionParameterTypeIi = queryDefinitionParameterTypeIi;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
