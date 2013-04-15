/**
 * An Eval UDF function to get the twitter names in a tweet
 */
package com.sudarmuthu.pig.udf;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.pig.EvalFunc;
import org.apache.pig.FuncSpec;
import org.apache.pig.data.BagFactory;
import org.apache.pig.data.DataBag;
import org.apache.pig.data.DataType;
import org.apache.pig.data.Tuple;
import org.apache.pig.data.TupleFactory;
import org.apache.pig.impl.logicalLayer.FrontendException;
import org.apache.pig.impl.logicalLayer.schema.Schema;

/**
 * An Eval UDF function to get the twitter names in a tweet
 * 
 * @author Sudar (http://sudarmuthu.com)
 */
public class GetTwitterNames extends EvalFunc<DataBag> {

    private BagFactory mBagFactory = BagFactory.getInstance();
    private TupleFactory mTupleFactory = TupleFactory.getInstance();
    
    /* (non-Javadoc)
     * @see org.apache.pig.EvalFunc#exec(org.apache.pig.data.Tuple)
     */
    @Override
    public DataBag exec(Tuple input) throws IOException {
        if (input == null || input.size() == 0 || input.get(0) == null) {
            return null;
        }

        try {
            DataBag output = mBagFactory.newDefaultBag();
            
            StringTokenizer token = new StringTokenizer((String) input.get(0), " ", false);
            
            while (token.hasMoreElements()) {
                String currentToken = token.nextToken();                
                if (isTwitterName(currentToken)) {
                    output.add(mTupleFactory.newTuple(currentToken));
                }
            }

            return output;
        } catch (ClassCastException e) {
            throw new IOException("Can't convert to String", e);            
        } catch (Exception e) {
            throw new IOException("Unknow error", e);            
        }
    }

    /* (non-Javadoc)
     * @see org.apache.pig.EvalFunc#getArgToFuncMapping()
     */
    @Override
    public List<FuncSpec> getArgToFuncMapping() throws FrontendException {
        Schema s = new Schema();
        s.add(new Schema.FieldSchema(null, DataType.CHARARRAY));
        return Arrays.asList(new FuncSpec(this.getClass().getName(), s));
    }

    /* (non-Javadoc)
     * @see org.apache.pig.EvalFunc#outputSchema(org.apache.pig.impl.logicalLayer.schema.Schema)
     */
    @Override
    public Schema outputSchema(Schema input) {
        try{
            Schema bagSchema = new Schema();
            bagSchema.add(new Schema.FieldSchema("twittername", DataType.CHARARRAY));
            return new Schema(new Schema.FieldSchema(getSchemaName(this.getClass().getName().toLowerCase(), input),
                    bagSchema, DataType.BAG));
        }catch (Exception e){
           return null;
        }        
    }

    /**
     * @param object
     * @return
     */
    private boolean isTwitterName(String text) {
        return text.contains("@");
    }
}
