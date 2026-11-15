module rtlpp_07780
   (A,
    AND_OUT,
    AVALID,
    B,
    BVALID,
    CLK,
    D,
    OR_OUT,
    P,
    Q,
    QVALID,
    S,
    XOR_OUT);
  input [15:0]A;
  output [15:0]AND_OUT;
  input AVALID;
  input [15:0]B;
  input BVALID;
  input CLK;
  output [15:0]D;
  output [15:0]OR_OUT;
  output [31:0]P;
  output [31:0]Q;
  output QVALID;
  output [15:0]S;
  output [15:0]XOR_OUT;

  reg [15:0]and16_0_Y;
  reg [15:0]c_addsub_0_S;
  reg [15:0]c_addsub_1_S;
  reg [31:0]div_gen_0_m_axis_dout_tdata;
  reg div_gen_0_m_axis_dout_tvalid;
  reg [31:0]mult_gen_0_P;
  reg [15:0]or16_0_Y;
  reg [15:0]xor2_0_Y;
  
  always @(posedge CLK) begin
    and16_0_Y <= A & B;
    c_addsub_0_S <= A + B;
    c_addsub_1_S <= A - B;
    div_gen_0_m_axis_dout_tvalid <= AVALID & BVALID;
    
    if (div_gen_0_m_axis_dout_tvalid) begin
      div_gen_0_m_axis_dout_tdata <= A / B;
    end else begin
      div_gen_0_m_axis_dout_tdata <= 32'b0;
    end
    
    mult_gen_0_P <= A * B;
    or16_0_Y <= A | B;
    xor2_0_Y <= A ^ B;
  end

  assign AND_OUT = and16_0_Y;
  assign D = c_addsub_1_S;
  assign OR_OUT = or16_0_Y;
  assign P = mult_gen_0_P;
  assign Q = div_gen_0_m_axis_dout_tdata;
  assign QVALID = div_gen_0_m_axis_dout_tvalid;
  assign S = c_addsub_0_S;
  assign XOR_OUT = xor2_0_Y;
  
endmodule