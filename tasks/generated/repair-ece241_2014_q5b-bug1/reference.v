module dut
(
  input clk,
  input areset,
  input x,
  output z
);

  parameter A = 0;
  parameter B = 1;
  reg state;

  always @(posedge clk) begin
    if(areset) state <= A; 
    else begin
      case(state)
        A: state <= (x)? B : A;
        B: state <= B;
      endcase
    end
  end

  assign z = ((state == A) && (x == 1)) | ((state == B) && (x == 0));

endmodule
