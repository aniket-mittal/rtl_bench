module rounding_mod(
    input [15:0] data_in,
    output [15:0] data_out
);
    wire [15:0] tmp;
    genvar i;
    generate
    for (i=3; i<14; i=i+1) 
      begin
        assign tmp[i] = &(~data_in[15:i+1]);
        assign data_out[i] = ((~(data_in[i]) & data_in[i-1] & data_in[i-2]) | (data_in[i] & ~data_in[i-1])) & tmp[i];
      end
    endgenerate
    
    assign data_out[15] = (~data_in[15] & data_in[14] & data_in[13]) | (data_in[15] & ~data_in[14]);
    assign data_out[14] = ((~data_in[14] & data_in[13] & data_in[12]) | (data_in[14] & ~data_in[13])) & ~data_in[15];
    assign data_out[2] = data_in[2] & ~data_in[1] & (&(~data_in[15:3]));
    assign data_out[1] = data_in[1] & (&(~data_in[15:2]));
    assign data_out[0] = data_in[0] & (&(~data_in[15:1]));

endmodule