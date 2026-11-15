// 2-to-1 Multiplexer
module origen_067587 (
  input wire i_Select,
  input wire i_Data1,
  input wire i_Data2,
  output wire o_Data
);

  assign o_Data = i_Select ? i_Data2 : i_Data1;

endmodule

// Parameterized 2-to-1 Multiplexer
module Mux_2_To_1_Width #(
  parameter g_WIDTH = 8
) (
  input wire i_Select,
  input wire [g_WIDTH-1:0] i_Data1,
  input wire [g_WIDTH-1:0] i_Data2,
  output wire [g_WIDTH-1:0] o_Data
);

  assign o_Data = i_Select ? i_Data2 : i_Data1;

endmodule

// Parameterized 4-to-1 Multiplexer
module Mux_4_To_1 #(
  parameter g_WIDTH = 8
) (
  input wire [1:0] i_Select,
  input wire [g_WIDTH-1:0] i_Data1,
  input wire [g_WIDTH-1:0] i_Data2,
  input wire [g_WIDTH-1:0] i_Data3,
  input wire [g_WIDTH-1:0] i_Data4,
  output wire [g_WIDTH-1:0] o_Data
);

  // Combinational logic using nested ternary operators
  wire [g_WIDTH-1:0] w_Mux_Comb;
  assign w_Mux_Comb = i_Select[1] ? (i_Select[0] ? i_Data4 : i_Data3) :
                                    (i_Select[0] ? i_Data2 : i_Data1);

  // Behavioral logic using case statement
  reg [g_WIDTH-1:0] r_Data;
  always @(*) begin
    case (i_Select)
      2'b00: r_Data = i_Data1;
      2'b01: r_Data = i_Data2;
      2'b10: r_Data = i_Data3;
      2'b11: r_Data = i_Data4;
    endcase
  end

  // Final output assignment
  assign o_Data = r_Data;

endmodule