module ct_lsu_rot_data(
  data_in,
  data_settle_out,
  rot_sel
);

// &Ports; @24
input   [127:0]  data_in;        
input   [7  :0]  rot_sel;        
output  [127:0]  data_settle_out; 

// &Regs; @25
reg     [63 :0]  data_settle;    

// &Wires; @26
wire    [63 :0]  data;           
wire    [127:0]  data_in;        
wire    [63 :0]  data_rot0;      
wire    [63 :0]  data_rot1;      
wire    [63 :0]  data_rot2;      
wire    [63 :0]  data_rot3;      
wire    [63 :0]  data_rot4;      
wire    [63 :0]  data_rot5;      
wire    [63 :0]  data_rot6;      
wire    [63 :0]  data_rot7;      
wire    [127:0]  data_settle_out; 
wire    [7  :0]  rot_sel;        


// &CombBeg; @48
// &CombEnd; @68
assign data[63:0]       = data_in[63:0]
                          | data_in[127:64];

assign data_rot0[63:0]  = data[63:0];
assign data_rot1[63:0]  = {data[7:0],data[63:8]};
assign data_rot2[63:0]  = {data[15:0],data[63:16]};
assign data_rot3[63:0]  = {data[23:0],data[63:24]};
assign data_rot4[63:0]  = {data[31:0],data[63:32]};
assign data_rot5[63:0]  = {data[39:0],data[63:40]};
assign data_rot6[63:0]  = {data[47:0],data[63:48]};
assign data_rot7[63:0]  = {data[55:0],data[63:56]};

// &CombBeg; @85
[MASKED]

assign data_settle_out[127:0] = {64'b0,data_settle[63:0]};

// &ModuleEnd; @102
endmodule