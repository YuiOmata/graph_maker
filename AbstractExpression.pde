//Tokenがないいいて言われるの対策、ココちゃんと作ること
class Token{
}

public abstract class AbstractExpression {
    private Token value;
    private ArrayList<AbstractExpression> children
        = new ArrayList<AbstractExpression>();
    public void setValue(Token v) { value = v; }
    public Token getValue() { return value; }
    public ArrayList<AbstractExpression> getChildren() {
        return children;
    }
    public void add(AbstractExpression node) { }
    public Iterator<AbstractExpression> iterator() {
        return children.iterator();
    }
    public abstract void compile(List<Byte> objectCodeList)
    throws Exception;
}