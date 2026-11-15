module autovcoder_058932 (
    Data_In,
    Data_Out
);
  input [15:0] Data_In;
  output [15:0] Data_Out;

  // Internal wires
  wire Data_Out_15;
  wire \Data_In[14] ;
  wire \Data_In[13] ;
  wire \Data_In[12] ;
  wire \Data_In[11] ;
  wire \Data_In[10] ;
  wire \Data_In[9] ;
  wire \Data_In[8] ;
  wire \Data_In[7] ;
  wire \Data_In[6] ;

  assign Data_Out[10] = 1'b0;
  assign Data_Out[9]  = Data_Out_15;
  assign Data_Out[11] = Data_Out_15;
  assign Data_Out[12] = Data_Out_15;
  assign Data_Out[13] = Data_Out_15;
  assign Data_Out[14] = Data_Out_15;
  assign Data_Out[15] = Data_Out_15;
  assign Data_Out_15  = Data_In[15];
  assign Data_Out[8]  = \Data_In[14] ;
  assign \Data_In[14] = Data_In[14];
  assign Data_Out[7]  = \Data_In[13] ;
  assign \Data_In[13] = Data_In[13];
  assign Data_Out[6]  = \Data_In[12] ;
  assign \Data_In[12] = Data_In[12];
  assign Data_Out[5]  = \Data_In[11] ;
  assign \Data_In[11] = Data_In[11];
  assign Data_Out[4]  = \Data_In[10] ;
  assign \Data_In[10] = Data_In[10];
  assign Data_Out[3]  = \Data_In[9] ;
  assign \Data_In[9]  = Data_In[9];
  assign Data_Out[2]  = \Data_In[8] ;
  assign \Data_In[8]  = Data_In[8];
  assign Data_Out[1]  = \Data_In[7] ;
  assign \Data_In[7]  = Data_In[7];
  assign Data_Out[0]  = \Data_In[6] ;
  assign \Data_In[6]  = Data_In[6];
endmodule

