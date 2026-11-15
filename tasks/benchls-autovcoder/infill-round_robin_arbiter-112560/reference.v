module autovcoder_112560 (
    // Inputs
      input       clk_i
    , input       rst_i
    , input       hold_i
    , input [3:0] request_i

    // Outputs
    , output [3:0] grant_o
);


  //-----------------------------------------------------------------
  // Registers / Wires
  //-----------------------------------------------------------------
  wire [3:0] req_ffs_masked_w;
  wire [3:0] req_ffs_unmasked_w;
  wire [3:0] req_ffs_w;

  reg  [3:0] mask_next_q;
  reg  [3:0] grant_last_q;
  wire [3:0] grant_new_w;

  //-----------------------------------------------------------------
  // ffs: Find first set
  //-----------------------------------------------------------------
  function [3:0] ffs;
    input [3:0] request;
    begin
      ffs[0] = request[0];
      ffs[1] = ffs[0] | request[1];
      ffs[2] = ffs[1] | request[2];
      ffs[3] = ffs[2] | request[3];
    end
  endfunction

  assign req_ffs_masked_w = ffs(request_i & mask_next_q);
  assign req_ffs_unmasked_w = ffs(request_i);

  assign req_ffs_w = (|req_ffs_masked_w) ? req_ffs_masked_w : req_ffs_unmasked_w;

  always @(posedge clk_i or posedge rst_i)
    if (rst_i == 1'b1) begin
      mask_next_q  <= {4{1'b1}};
      grant_last_q <= 4'b0;
    end else begin
      if (~hold_i) mask_next_q <= {req_ffs_w[2:0], 1'b0};

      grant_last_q <= grant_o;
    end

  assign grant_new_w = req_ffs_w ^ {req_ffs_w[2:0], 1'b0};
  assign grant_o = hold_i ? grant_last_q : grant_new_w;


endmodule

