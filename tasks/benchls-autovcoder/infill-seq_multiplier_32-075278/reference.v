module autovcoder_075278 (

    clk_i,
    rst_i,
    stall_d,
    kill_x,















    operand_0_d,
    operand_1_d,

    result_x,




    stall_request_x
);





  input clk_i;
  input rst_i;
  input stall_d;
  input kill_x;















  input [(32-1):0] operand_0_d;
  input [(32-1):0] operand_1_d;





  output [(32-1):0] result_x;
  reg [(32-1):0] result_x;





  output stall_request_x;
  wire stall_request_x;





  reg [(32-1):0] p;
  reg [(32-1):0] a;
  reg [(32-1):0] b;





  reg [2:0] state;
  reg [5:0] cycles;












  assign stall_request_x = state != 3'b000;


















  always @(posedge clk_i) begin
    if (rst_i == 1'b1) begin
      cycles <= {6{1'b0}};
      p <= {32{1'b0}};
      a <= {32{1'b0}};
      b <= {32{1'b0}};








      result_x <= {32{1'b0}};
      state <= 3'b000;
    end else begin




      case (state)
        3'b000: begin
          if (stall_d == 1'b0) begin
            cycles <= 32;
            p <= 32'b0;
            a <= operand_0_d;
            b <= operand_1_d;































          end
        end














































































      endcase
    end
  end

endmodule

