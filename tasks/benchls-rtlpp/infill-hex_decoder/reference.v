module hex_decoder(in, hex_out);
    input [3:0] in;
    output [6:0] hex_out;
    
    assign hex_out[0] = (~in[3] & ~in[2] & ~in[1] & in[0]) | (in[3] & ~in[2] & in[1] & in[0]) 
        | (~in[3] & in[2] & ~in[1] & ~in[0]) | (in[3] & in[2] & ~in[1] & in[0]);
    
    assign hex_out[1] = (in[3] & in[1] & in[0]) | (in[2] & in[1] & ~in[0]) | 
        (~in[3] & in[2] & ~in[1] & in[0]) | (in[3] & in[2] & ~in[1] & ~in[0]);
    
    assign hex_out[2] = (in[3] & in[2] & ~in[1] & ~in[0]) | (in[3] & in[2] & in[1]) 
        | (~in[3] & ~in[2] & in[1] & ~in[0]);
    
    assign hex_out[3] = (~in[2] & ~in[1] & in[0]) | (in[2] & in[1] & in[0]) 
        | (in[3] & ~in[2] & in[1] & ~in[0]);
    
    assign hex_out[4] = (~in[2] & ~in[1] & in[0]) | (~in[3] & in[2] & ~in[1]) 
        | (~in[3] & in[1] & in[0]);
    
    assign hex_out[5] = (~in[3] & ~in[2] & in[0]) | (in[3] & in[2] & ~in[1] & in[0]) 
        | (~in[3] & ~in[2] & in[1]) | (~in[3] & in[1] & in[0]);
    
    assign hex_out[6] = (in[3] & in[2] & ~in[1] & ~in[0]) | (~in[3] & ~in[2] & ~in[1]) 
        | (~in[3] & in[2] & in[1] & in[0]);
    
endmodule