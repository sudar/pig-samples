/**
 * A filter UDF function
 */
package com.sudarmuthu.pig.udf;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.apache.pig.FilterFunc;
import org.apache.pig.FuncSpec;
import org.apache.pig.backend.executionengine.ExecException;
import org.apache.pig.data.DataType;
import org.apache.pig.data.Tuple;
import org.apache.pig.impl.logicalLayer.FrontendException;
import org.apache.pig.impl.logicalLayer.schema.Schema;

/**
 * A filter UDF function
 * 
 * @author Sudar (http://sudarmuthu.com)
 */
public class FromVim extends FilterFunc {

    /* (non-Javadoc)
     * @see org.apache.pig.EvalFunc#exec(org.apache.pig.data.Tuple)
     */
    @Override
    public Boolean exec(Tuple input) throws IOException {
        try {
            String source = (String) input.get(0);
            if (source != null) {
                return source.contains("TwitVim");                
            } else {
                return false;
            }

        } catch (ExecException e) {
            throw e;
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
}