module pack_ctrl #(
  parameter PORT_ADDRESS_WIDTH = 2,
  parameter MUX_ORDER = 1,
  parameter MIN_STAGE = 0,
  parameter NUM_STAGES = 2,
  parameter PACK = 0
) (
  input [PORT_ADDRESS_WIDTH-1:0] rotate,
  input [2**PORT_ADDRESS_WIDTH*PORT_ADDRESS_WIDTH-1:0] prefix_count,

  output [2**PORT_ADDRESS_WIDTH*MUX_ORDER*NUM_STAGES-1:0] ctrl
);

  /*
   * This module computes the control bits that are used to configure the MUXes
   * in the pack interconect network. The controls are configured according to
   * the specified global rotation and the prefix count of each of the outputs.
   */

  localparam NUM_OF_PORTS = 2**PORT_ADDRESS_WIDTH;

  wire [NUM_OF_PORTS*MUX_ORDER*NUM_STAGES-1:0] ctrl1;
  reg [NUM_OF_PORTS*MUX_ORDER*NUM_STAGES-1:0] ctrl2;

  generate
  genvar i, j, k;
  integer n;

  localparam z = 2**MUX_ORDER;

  // This part is magic
  for (i = 0; i < NUM_STAGES; i = i + 1) begin: ctrl_gen_outer
    localparam k0 = 2**(PORT_ADDRESS_WIDTH - MUX_ORDER*(i+1)-MIN_STAGE);
    localparam k1 = 2**(MUX_ORDER*(1+i)+MIN_STAGE);

    for (j = 0; j < NUM_OF_PORTS; j = j + 1) begin: ctrl_gen_inner
      // Offset in the ctrl signal
      localparam s = (i*NUM_OF_PORTS+j)*MUX_ORDER;
      localparam m = (j % k1) * k0;
      localparam n = j / k1;

      if (MUX_ORDER == 1 && j % 2 == 0) begin
        // This is an optimization that only works for 2:1 MUXes
        assign ctrl1[s] = ~ctrl1[s+1];
      end else begin
        assign ctrl1[s+:MUX_ORDER] = (j - (prefix_count[m*PORT_ADDRESS_WIDTH+:PORT_ADDRESS_WIDTH] + n - rotate) / k0) % z;
      end
    end
  end

  if (PACK == 0 || MUX_ORDER == 1) begin
    // For 2:1 MUXes pack and unpack control is the same
    assign ctrl = ctrl1;
  end else begin
    /*
     * Transform demux control into mux control. The implementation here uses a
     * priority encoder.
     */
    for (i = 0; i < NUM_STAGES*NUM_OF_PORTS; i = i + z) begin: demux_gen_outer
      localparam base = i*MUX_ORDER;
      for (k = 0; k < z; k = k + 1) begin: demux_gen_inner
        always @(ctrl1) begin
          ctrl2[base+k*MUX_ORDER+:MUX_ORDER] <= {MUX_ORDER{1'b1}};
          for (n = 0; n < z; n = n + 1) begin
            if (ctrl1[base+n*MUX_ORDER+:MUX_ORDER] == k) begin
              ctrl2[base+k*MUX_ORDER+:MUX_ORDER] <= n[MUX_ORDER-1:0];
            end
          end
        end
      end
    end
    assign ctrl = ctrl2;
  end
  endgenerate

endmodule