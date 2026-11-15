module autovcoder_001661 (
    abc,
    sum,
    carry
);
  input [2:0] abc;
  output sum, carry;
  reg sum, carry;

  always @(abc) begin
    case (abc)
      3'd0: begin
        sum   = 1'b0;
        carry = 1'b0;
      end
      3'd1: begin
        sum   = 1'b1;
        carry = 1'b0;
      end
      3'd2: begin
        sum   = 1'b1;
        carry = 1'b0;
      end
      3'd3: begin
        sum   = 1'b0;
        carry = 1'b1;
      end
      3'd4: begin
        sum   = 1'b1;
        carry = 1'b0;
      end
      3'd5: begin
        sum   = 1'b0;
        carry = 1'b1;
      end
      3'd6: begin
        sum   = 1'b0;
        carry = 1'b1;
      end
      3'd7: begin
        sum   = 1'b1;
        carry = 1'b1;
      end
      default: begin
      end
    endcase
  end
endmodule

