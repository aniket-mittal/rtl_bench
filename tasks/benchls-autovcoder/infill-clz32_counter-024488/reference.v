module autovcoder_024488 (
    zr_num,
    di
);

  output [5:0] zr_num;
  input [31:0] di;

  reg [3:0] b3_num, b2_num, b1_num, b0_num;
  reg w5, w4, w3, w2, w1, w0;

  /* Logic */
  always @(di) begin
    casex (di[31:24])  //synopsys parallel_case
      8'b00000000: b3_num = 4'b1000;  // 8 zeros
      8'b00000001: b3_num = 4'b0111;  // 7 zeros
      8'b0000001x: b3_num = 4'b0110;  // 6 zeros
      8'b000001xx: b3_num = 4'b0101;  // 5 zeros
      8'b00001xxx: b3_num = 4'b0100;  // 4 zeros
      8'b0001xxxx: b3_num = 4'b0011;  // 3 zeros
      8'b001xxxxx: b3_num = 4'b0010;  // 2 zeros
      8'b01xxxxxx: b3_num = 4'b0001;  // 1 zero
      8'b1xxxxxxx: b3_num = 4'b0000;  // none
      default:     b3_num = 4'bxxxx;
    endcase

    casex (di[23:16])  //synopsys parallel_case
      8'b00000000: b2_num = 4'b1000;
      8'b00000001: b2_num = 4'b0111;
      8'b0000001x: b2_num = 4'b0110;
      8'b000001xx: b2_num = 4'b0101;
      8'b00001xxx: b2_num = 4'b0100;
      8'b0001xxxx: b2_num = 4'b0011;
      8'b001xxxxx: b2_num = 4'b0010;
      8'b01xxxxxx: b2_num = 4'b0001;
      8'b1xxxxxxx: b2_num = 4'b0000;
      default:     b2_num = 4'bxxxx;
    endcase

    casex (di[15:8])  //synopsys parallel_case
      8'b00000000: b1_num = 4'b1000;
      8'b00000001: b1_num = 4'b0111;
      8'b0000001x: b1_num = 4'b0110;
      8'b000001xx: b1_num = 4'b0101;
      8'b00001xxx: b1_num = 4'b0100;
      8'b0001xxxx: b1_num = 4'b0011;
      8'b001xxxxx: b1_num = 4'b0010;
      8'b01xxxxxx: b1_num = 4'b0001;
      8'b1xxxxxxx: b1_num = 4'b0000;
      default:     b1_num = 4'bxxxx;
    endcase

    casex (di[7:0])  //synopsys parallel_case
      8'b00000000: b0_num = 4'b1000;  // 8 zero
      8'b00000001: b0_num = 4'b0111;  // 7 zero
      8'b0000001x: b0_num = 4'b0110;  // 6 zero
      8'b000001xx: b0_num = 4'b0101;  // 5 zero
      8'b00001xxx: b0_num = 4'b0100;  // 4 zero
      8'b0001xxxx: b0_num = 4'b0011;  // 3 zero
      8'b001xxxxx: b0_num = 4'b0010;  // 2 zero
      8'b01xxxxxx: b0_num = 4'b0001;  // 1 zero
      8'b1xxxxxxx: b0_num = 4'b0000;  // 0 zero
      default:     b0_num = 4'bxxxx;
    endcase
  end


  always @(b3_num or b2_num or b1_num or b0_num) begin
    casex ({
      ~b3_num[3], ~b2_num[3], ~b1_num[3], ~b0_num[3]
    })  //synopsys parallel_case
      4'b0000: begin
        {w5, w4, w3, w2, w1, w0} = 6'b100000;  // select b3_num same as b0_num. both 0
      end
      4'b0001: begin
        {w5, w4, w3} = 3'b011;  // select b0_num
        {w2, w1, w0} = b0_num[2:0];  // 0
      end
      4'b001x: begin
        {w5, w4, w3} = 3'b010;  // select b1_num
        {w2, w1, w0} = b1_num[2:0];  // 1
      end
      4'b01xx: begin
        {w5, w4, w3} = 3'b001;  // select b2_num
        {w2, w1, w0} = b2_num[2:0];  // 2
      end
      4'b1xxx: begin
        {w5, w4, w3} = 3'b000;  // select b3_num
        {w2, w1, w0} = b3_num[2:0];  // 3
      end
      default: {w5, w4, w3, w2, w1, w0} = 6'bxxxxxx;
    endcase
  end

  assign zr_num[5:0] = {w5, w4, w3, w2, w1, w0};  // pack outputs

endmodule

