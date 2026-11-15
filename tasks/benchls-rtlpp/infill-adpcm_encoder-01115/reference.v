module rtlpp_01115 
  (input clk, 
   input reset, 
   input signed [15:0] x_in, 
   output [3:0] y_out, 
   output signed [15:0] p_out, 
   output reg p_underflow, p_overflow, 
   output signed [7:0] i_out, 
   output reg i_underflow, i_overflow, 
   output signed [15:0] err, 
   output [14:0] sz_out, 
   output s_out);

  reg signed [15:0] va, va_d; 
  reg sign; 
  reg [3:0] sdelta; 
  reg [14:0] step; 
  reg signed [15:0] sstep; 
  reg signed [15:0] valpred; 
  reg signed [7:0] index; 

  reg signed [16:0] diff0, diff1, diff2, diff3;   
  reg signed [16:0] p1, p2, p3;      
  reg signed [7:0] i1, i2, i3;      
  reg [3:0] delta2, delta3, delta4;  
  reg [14:0] tStep;
  reg signed [15:0] vpdiff2, vpdiff3, vpdiff4;  
    
  wire [14:0] t [0:88];
  reg [14:0] temp_t [0:88];
  reg signed [4:0] temp_indexTable [0:15];

  initial begin
    temp_t[0] = 7; temp_t[1] = 8; temp_t[2] = 9; temp_t[3] = 10; temp_t[4] = 11;
    temp_t[5] = 12; temp_t[6] = 13; temp_t[7] = 14; temp_t[8] = 16; temp_t[9] = 17;
    temp_t[10] = 19; temp_t[11] = 21; temp_t[12] = 23; temp_t[13] = 25; temp_t[14] = 28;
    temp_t[15] = 31; temp_t[16] = 34; temp_t[17] = 37; temp_t[18] = 41; temp_t[19] = 45;
    temp_t[20] = 50; temp_t[21] = 55; temp_t[22] = 60; temp_t[23] = 66; temp_t[24] = 73;
    temp_t[25] = 80; temp_t[26] = 88; temp_t[27] = 97; temp_t[28] = 107; temp_t[29] = 118;
    temp_t[30] = 130; temp_t[31] = 143; temp_t[32] = 157; temp_t[33] = 173; temp_t[34] = 190;
    temp_t[35] = 209; temp_t[36] = 230; temp_t[37] = 253; temp_t[38] = 279; temp_t[39] = 307;
    temp_t[40] = 337; temp_t[41] = 371; temp_t[42] = 408; temp_t[43] = 449; temp_t[44] = 494;
    temp_t[45] = 544; temp_t[46] = 598; temp_t[47] = 658; temp_t[48] = 724; temp_t[49] = 796;
    temp_t[50] = 876; temp_t[51] = 963; temp_t[52] = 1060; temp_t[53] = 1166; temp_t[54] = 1282;
    temp_t[55] = 1411; temp_t[56] = 1552; temp_t[57] = 1707; temp_t[58] = 1878; temp_t[59] = 2066;
    temp_t[60] = 2272; temp_t[61] = 2499; temp_t[62] = 2749; temp_t[63] = 3024; temp_t[64] = 3327;
    temp_t[65] = 3660; temp_t[66] = 4026; temp_t[67] = 4428; temp_t[68] = 4871; temp_t[69] = 5358;
    temp_t[70] = 5894; temp_t[71] = 6484; temp_t[72] = 7132; temp_t[73] = 7845; temp_t[74] = 8630;
    temp_t[75] = 9493; temp_t[76] = 10442; temp_t[77] = 11487; temp_t[78] = 12635; temp_t[79] = 13899;
    temp_t[80] = 15289; temp_t[81] = 16818; temp_t[82] = 18500; temp_t[83] = 20350; temp_t[84] = 22385;
    temp_t[85] = 24623; temp_t[86] = 27086; temp_t[87] = 29794; temp_t[88] = 32767;

    temp_indexTable[0] = -1; temp_indexTable[1] = -1; temp_indexTable[2] = -1; temp_indexTable[3] = -1;
    temp_indexTable[4] = 2; temp_indexTable[5] = 4; temp_indexTable[6] = 6; temp_indexTable[7] = 8;
    temp_indexTable[8] = -1; temp_indexTable[9] = -1; temp_indexTable[10] = -1; temp_indexTable[11] = -1;
    temp_indexTable[12] = 2; temp_indexTable[13] = 4; temp_indexTable[14] = 6; temp_indexTable[15] = 8;
  end  

  always @(posedge clk or posedge reset)
  begin : Encode
    if (reset) begin  
      va <= 0; va_d <= 0;
      step <= 0; index <= 0;
      valpred <= 0;
    end else begin 
      va_d <= va;      
      va <= x_in;
      step <= temp_t[i3];
      index <= i3;
      valpred <= p3;         
    end
  end
  
  always @(va, va_d,step,index,valpred) begin

    diff0 = va - valpred;
    if (diff0 < 0) begin
      sign = 1;      
      diff1 = -diff0;
    end else begin
      sign = 0;
      diff1 = diff0;
    end

    if (diff1 >= step) begin  
      delta2 = 4; 
      diff2 = diff1 - step; 
      vpdiff2 = step/8 + step;
    end else begin
      delta2 = 0; 
      diff2 = diff1; 
      vpdiff2 = step/8;
    end
    if (diff2 >= step/2) begin 
      delta3 = delta2 + 2; 
      diff3 = diff2 - step/2; 
      vpdiff3 = vpdiff2 + step/2;
    end else begin
      delta3 = delta2; 
      diff3 = diff2; 
      vpdiff3 = vpdiff2;
    end
    if (diff3 >= step/4) begin
      delta4 = delta3 + 1; 
      vpdiff4 = vpdiff3 + step/4;
    end else begin
      delta4 = delta3; 
      vpdiff4 = vpdiff3;
    end
  
    if (sign)                      
      p1 = valpred - vpdiff4;
    else               
      p1 = valpred + vpdiff4;
  
    if (p1 > 32767) begin  
      p2 = 32767; p_overflow <= 1;
    end else begin
      p2 = p1; p_overflow <= 0;    
    end
    if (p2 < -32768) begin  
     p3 = -32768; p_underflow <= 1; 
    end else begin
     p3 = p2; p_underflow <= 0; 
    end

    i1 = index + temp_indexTable[delta4];
    if (i1 < 0) begin
      i2 = 0; i_underflow <= 1;
    end else begin
      i2 = i1; i_underflow <= 0;
    end
    if (i2 > 88) begin
      i3 = 88; i_overflow <= 1;
    end else begin
      i3 = i2; i_overflow <= 0;
    end
    if (sign)
      sdelta = delta4 + 8;
    else
      sdelta = delta4;
  end

  assign y_out = sdelta;    
  assign p_out = valpred;
  assign i_out = index;
  assign sz_out = step;
  assign s_out = sign;
  assign err = va_d - valpred;
  
endmodule