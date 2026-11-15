module origen_161603 (
  input        clk,
  input        rstn,
  input  [7:0] io_in_data,
  input        io_in_vld,
  output reg   io_in_rdy,
  output reg [7:0] io_out_data,
  output reg       io_out_vld,
  input        io_out_rdy,
  output [4:0] io_err
);

  reg [1:0] loop_state;

  `ifdef SYNTHESIS
    `define mark_debug(x)
  `else
    `define mark_debug(x) (* mark_debug = "true" *)
  `endif

  `mark_debug(io_out_data)
  `mark_debug(loop_state)

  always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
      io_in_rdy   <= 1'b0;
      io_out_vld <= 1'b0;
      loop_state <= 2'b0;
    end else begin
      case (loop_state)
        2'b00: begin
          io_in_rdy <= 1'b1;
          if (io_in_vld && io_in_rdy) begin
            io_out_data <= io_in_data;
            io_out_vld  <= 1'b1;
            loop_state  <= 2'b10;
          end
        end
        2'b10: begin
          if (io_out_rdy && io_out_vld) begin
            io_out_vld <= 1'b0;
            loop_state <= 2'b00;
          end
        end
        default: begin
          loop_state <= 2'b00;
        end
      endcase
    end
  end

  assign io_err = 5'b0;

endmodule