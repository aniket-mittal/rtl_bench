module autovcoder_086405 #(
    // Master AXI Stream Data Width
    parameter C_S_AXIS_DATA_WIDTH = 256,
    parameter C_S_AXIS_TUSER_WIDTH = 128,
    parameter output_file = "../../stream_data_out.axi"
) (
    // Part 1: System side signals
    // Global Ports
    input aclk,

    // Slave Stream Ports (interface to data path)
    input [C_S_AXIS_DATA_WIDTH - 1:0] s_axis_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s_axis_tstrb,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s_axis_tuser,
    input s_axis_tvalid,
    output s_axis_tready,
    input s_axis_tlast,

    output reg [7:0] counter,
    output reg activity_rec
);

  integer f;
  integer bubble_count = 0;
  integer result;
  reg [8*2-1:0] terminal_flag;

  assign s_axis_tready = 1;

  initial begin
    ;
    counter = 0;
  end

  always @(posedge aclk) begin
    if (s_axis_tvalid == 1'b1) begin
      if (bubble_count != 0) begin
        ;
        bubble_count <= 0;
      end
      if (s_axis_tlast == 1'b1) begin
        terminal_flag = ".";
        counter <= counter + 1;
        activity_rec <= 1;
      end else begin
        terminal_flag = ",";
        activity_rec <= 1;
      end

      ;
    end else begin
      bubble_count <= bubble_count + 1;
      activity_rec <= 0;
    end
  end
endmodule

