module rtlpp_09543                      
  (input clk,                     
   input reset,                   
   input signed [15:0] x_in,      
   output [3:0] y_out,           
   output signed [15:0] p_out,  
   output reg p_underflow, p_overflow, 
   output signed [7:0] i_out,         
   output reg i_underflow, i_overflow, 
   output signed [15:0]  err,          
   output [14:0] sz_out,               
   output s_out);                      

  reg signed [15:0] va, va_d; 
  reg sign ; 
  reg [3:0]   sdelta; 
  reg [14:0]  step; 
  reg signed [15:0] sstep; 
  reg signed [15:0] valpred; 
  reg signed [7:0]  index; 

  reg signed [16:0] diff0, diff1, diff2, diff3;   
                                
  reg signed [16:0] p1, p2, p3;      
  reg signed [7:0]  i1, i2, i3;      
  reg [3:0] delta2, delta3, delta4;  
                           
  reg [14:0]  tStep;
  reg signed [15:0] vpdiff2, vpdiff3, vpdiff4 ;  
                               
    
  wire [14:0] t [0:88];

  wire signed [4:0] indexTable [0:15];

  assign indexTable[0]=-1; assign indexTable[1]=-1;
  assign indexTable[2]=-1; assign indexTable[3]=-1;
  assign indexTable[4]=2; assign indexTable[5]=4; 
  assign indexTable[6]=6; assign indexTable[7]=8;
  assign indexTable[8]=-1; assign indexTable[9]=-1;
  assign indexTable[10]=-1; assign indexTable[11]=-1;
  assign indexTable[12]=2; assign indexTable[13]=4;
  assign indexTable[14]=6; assign indexTable[15]=8;
 
  assign t[0]=7; assign t[1]=8; assign t[2]=9; 
  assign t[3]=10; assign t[4]=11; assign t[5]=12; 
  assign t[6]= 13; assign t[7]= 14; assign t[8]= 16; 
  assign t[9]= 17; assign t[10]= 19; assign t[11]= 21; 
  assign t[12]= 23; assign t[13]= 25; assign t[14]= 28; 
  assign t[15]= 31; assign t[16]= 34; assign t[17]= 37; 
  assign t[18]= 41; assign t[19]= 45; assign t[20]= 50; 
  assign t[21]= 55; assign t[22]= 60; assign t[23]= 66; 
  assign t[24]= 73; assign t[25]= 80; assign t[26]= 88; 
  assign t[27]= 97; assign t[28]= 107; assign t[29]= 118; 
  assign t[30]= 130; assign t[31]= 143; assign t[32]= 157; 
  assign t[33]= 173; assign t[34]= 190; assign t[35]= 209; 
  assign t[36]= 230; assign t[37]= 253; assign t[38]= 279; 
  assign t[39]= 307; assign t[40]= 337; assign t[41]= 371; 
  assign t[42]= 408; assign t[43]= 449; assign t[44]= 494; 
  assign t[45]= 544; assign t[46]= 598; assign t[47]= 658; 
  assign t[48]= 724; assign t[49]= 796; assign t[50]= 876; 
  assign t[51]= 963; assign t[52]= 1060;assign t[53]= 1166;
  assign t[54]= 1282; assign t[55]= 1411;assign t[56]=1552; 
  assign t[57]= 1707; assign t[58]= 1878;assign t[59]=2066; 
  assign t[60]= 2272; assign t[61]= 2499;assign t[62]=2749; 
  assign t[63]= 3024; assign t[64]= 3327;assign t[65]=3660; 
  assign t[66]= 4026; assign t[67]= 4428;assign t[68]=4871; 
  assign t[69]= 5358; assign t[70]= 5894;assign t[71]=6484; 
  assign t[72]= 7132; assign t[73]= 7845;assign t[74]=8630; 
  assign t[75]=9493; assign t[76]=10442;assign t[77]=11487;
  assign t[78]= 12635; assign t[79]= 13899; 
  assign t[80]= 15289; assign t[81]= 16818; 
  assign t[82]= 18500; assign t[83]= 20350; 
  assign t[84]= 22385; assign t[85]= 24623; 
  assign t[86]= 27086; assign t[87]= 29794; 
  assign t[88]= 32767;

  always @(posedge clk or posedge reset)
  begin : Encode
    if (reset) begin  
      va <= 0; va_d <= 0;
      step <= 0; index <= 0;
      valpred <= 0;
    end else begin 
      va_d <= va;      
      va <= x_in;
      step <= t[i3];
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
      delta3 = delta2 + 2 ; 
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
      p2 = p1; p_overflow = 0;    
    end
    if (p2 < -32768) begin  
     p3 = -32768; p_underflow = 1; 
    end else begin
     p3 = p2; p_underflow = 0; 
    end

    i1 = index + indexTable[delta4];
    if  (i1 < 0) begin      
      i2 = 0; i_underflow = 1;
    end else begin
      i2 = i1; i_underflow = 0;
    end
    if (i2 > 88) begin
      i3 = 88; i_overflow = 1;
    end else begin
      i3 = i2; i_overflow = 0;
    end
    if (sign)
      sdelta = delta4 + 8;
    else
      sdelta = delta4;
  end
   
  assign  y_out  = sdelta;    
  assign  p_out  = valpred;
  assign  i_out  = index;
  assign  sz_out = step;
  assign  s_out  = sign;
  assign  err = va_d - valpred;
   
endmodule