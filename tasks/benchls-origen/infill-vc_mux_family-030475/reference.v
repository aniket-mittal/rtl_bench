module origen_030475
#(
  parameter p_nbits = 1
)(
  input  logic [p_nbits-1:0] in0, in1,
  input  logic               sel,
  output logic [p_nbits-1:0] out
);

  always @(*) begin
    case (sel)
      1'b0: out = in0;
      1'b1: out = in1;
      default: out = {p_nbits{1'bx}};
    endcase
  end

endmodule

module vc_Mux3
#(
  parameter p_nbits = 1
)(
  input  logic [p_nbits-1:0] in0, in1, in2,
  input  logic [1:0]         sel,
  output logic [p_nbits-1:0] out
);

  always @(*) begin
    case (sel)
      2'b00: out = in0;
      2'b01: out = in1;
      2'b10: out = in2;
      default: out = {p_nbits{1'bx}};
    endcase
  end

endmodule

module vc_Mux4
#(
  parameter p_nbits = 1
)(
  input  logic [p_nbits-1:0] in0, in1, in2, in3,
  input  logic [1:0]         sel,
  output logic [p_nbits-1:0] out
);

  always @(*) begin
    case (sel)
      2'b00: out = in0;
      2'b01: out = in1;
      2'b10: out = in2;
      2'b11: out = in3;
    endcase
  end

endmodule

module vc_Mux5
#(
  parameter p_nbits = 1
)(
  input  logic [p_nbits-1:0] in0, in1, in2, in3, in4,
  input  logic [2:0]         sel,
  output logic [p_nbits-1:0] out
);

  always @(*) begin
    case (sel)
      3'b000: out = in0;
      3'b001: out = in1;
      3'b010: out = in2;
      3'b011: out = in3;
      3'b100: out = in4;
      default: out = {p_nbits{1'bx}};
    endcase
  end

endmodule

module vc_Mux6
#(
  parameter p_nbits = 1
)(
  input  logic [p_nbits-1:0] in0, in1, in2, in3, in4, in5,
  input  logic [2:0]         sel,
  output logic [p_nbits-1:0] out
);

  always @(*) begin
    case (sel)
      3'b000: out = in0;
      3'b001: out = in1;
      3'b010: out = in2;
      3'b011: out = in3;
      3'b100: out = in4;
      3'b101: out = in5;
      default: out = {p_nbits{1'bx}};
    endcase
  end

endmodule

module vc_Mux7
#(
  parameter p_nbits = 1
)(
  input  logic [p_nbits-1:0] in0, in1, in2, in3, in4, in5, in6,
  input  logic [2:0]         sel,
  output logic [p_nbits-1:0] out
);

  always @(*) begin
    case (sel)
      3'b000: out = in0;
      3'b001: out = in1;
      3'b010: out = in2;
      3'b011: out = in3;
      3'b100: out = in4;
      3'b101: out = in5;
      3'b110: out = in6;
      default: out = {p_nbits{1'bx}};
    endcase
  end

endmodule

module vc_Mux8
#(
  parameter p_nbits = 1
)(
  input  logic [p_nbits-1:0] in0, in1, in2, in3, in4, in5, in6, in7,
  input  logic [2:0]         sel,
  output logic [p_nbits-1:0] out
);

  always @(*) begin
    case (sel)
      3'b000: out = in0;
      3'b001: out = in1;
      3'b010: out = in2;
      3'b011: out = in3;
      3'b100: out = in4;
      3'b101: out = in5;
      3'b110: out = in6;
      3'b111: out = in7;
    endcase
  end

endmodule