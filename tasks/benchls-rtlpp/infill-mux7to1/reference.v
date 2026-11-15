module mux7to1(MuxSelect, Input, Out);
  input [2:0] MuxSelect;
  input [7:0] Input;
  output [7:0] Out;

  wire [7:4] a;
  wire [3:0] b;
  assign a = Input[7:4];
  assign b = Input[3:0];
  wire [7:0] a_concat_b;
  assign a_concat_b = {a, b};

  wire [4:0] adder_connection;
  wire [4:0] veri_add_connection;
  assign adder_connection = f_adder_internal(Input[7:0]);
  assign veri_add_connection = a + b;

  wire [7:0] a_xor_or_b;
  wire [3:0] a_xor_b;
  wire [7:4] a_or_b;
  assign a_xor_b = a ^ b;
  assign a_or_b = a | b;
  assign a_xor_or_b = {a_or_b, a_xor_b};

  wire or_reduction;
  assign or_reduction = | a_concat_b;

  wire and_reduction;
  assign and_reduction = & a_concat_b;

  reg [7:0] Out;
  always @(*)
  begin
    case (MuxSelect[2:0])
      3'b000: Out = {3'b0, adder_connection};
      3'b001: Out = {3'b0, veri_add_connection};
      3'b010: Out = a_xor_or_b;
      3'b011: Out = or_reduction;
      3'b100: Out = and_reduction;
      3'b101: Out = a_concat_b;
      default: Out = 8'b0;
    endcase
  end

  function [4:0] f_adder_internal;
    input [7:0] Input;
    reg [4:0] result;
    begin
      result[0] = Input[4] ^ Input[0];
      result[1] = Input[5] ^ Input[1] ^ (Input[4] & Input[0]);
      result[2] = Input[6] ^ Input[2] ^ ((Input[5] & Input[1]) | (Input[4] & Input[0] & Input[1]));
      result[3] = Input[7] ^ Input[3] ^ ((Input[6] & Input[2]) | (Input[5] & Input[1] & Input[2]) | (Input[4] & Input[0] & Input[1] & Input[2]));
      result[4] = ((Input[7] & Input[3]) | (Input[6] & Input[2] & Input[3]) | (Input[5] & Input[1] & Input[2] & Input[3]) | (Input[4] & Input[0] & Input[1] & Input[2] & Input[3]));
      f_adder_internal = result;
    end
  endfunction
endmodule