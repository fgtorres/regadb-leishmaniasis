package net.sf.regadb.analysis.functions;

import org.biojava.bio.seq.Sequence;

public class FastaRead 
{
    public FastaReadStatus status_;
    public String xna_;
    public String invalidChars_;
    public Sequence seq_;
    public String fastaHeader_;
    
    public FastaRead(Sequence seq)
    {
        xna_ = seq.seqString();
        seq_ = seq;
        status_ = FastaReadStatus.Valid;
        fastaHeader_ = seq.getName();
    }
    
    public FastaRead(FastaReadStatus status)
    {
        status_ = status;
    }
}
