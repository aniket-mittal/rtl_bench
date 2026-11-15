// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 63;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  pcie_us_cfg dut (
    .clk(clk),
    .rst(in_vec[33:33]),
    .cfg_mgmt_read_data(in_vec[32:1]),
    .cfg_mgmt_read_write_done(in_vec[0:0]),
    .ext_tag_enable(out_vec[62:62]),
    .max_read_request_size(out_vec[61:59]),
    .max_payload_size(out_vec[58:56]),
    .cfg_mgmt_addr(out_vec[55:46]),
    .cfg_mgmt_function_number(out_vec[45:38]),
    .cfg_mgmt_write(out_vec[37:37]),
    .cfg_mgmt_write_data(out_vec[36:5]),
    .cfg_mgmt_byte_enable(out_vec[4:1]),
    .cfg_mgmt_read(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2763304c8;
    stim[1] = 34'h2327be8d8;
    stim[2] = 34'h060ebfd1a;
    stim[3] = 34'h0d8f537dc;
    stim[4] = 34'h0ac9e0f32;
    stim[5] = 34'h02ae8d7bc;
    stim[6] = 34'h0f2d4ccde;
    stim[7] = 34'h100aa4c8b;
    stim[8] = 34'h0f00e1d67;
    stim[9] = 34'h13a054429;
    stim[10] = 34'h12cfddc49;
    stim[11] = 34'h056a04b7b;
    stim[12] = 34'h170f647eb;
    stim[13] = 34'h0529b7e65;
    stim[14] = 34'h199d5bdf6;
    stim[15] = 34'h127bdf8a0;
    stim[16] = 34'h04d237064;
    stim[17] = 34'h1eeb14d65;
    stim[18] = 34'h15e811f07;
    stim[19] = 34'h19cbce606;
    stim[20] = 34'h16c1d4dfe;
    stim[21] = 34'h04dad922d;
    stim[22] = 34'h10235986f;
    stim[23] = 34'h0a5dc7ede;
    stim[24] = 34'h118df4fbc;
    stim[25] = 34'h03783a1a5;
    stim[26] = 34'h009bb7861;
    stim[27] = 34'h0c8789e73;
    stim[28] = 34'h127f026cb;
    stim[29] = 34'h18dc5ad97;
    stim[30] = 34'h1809deb32;
    stim[31] = 34'h1a0a36ee5;
    stim[32] = 34'h1e2db0167;
    stim[33] = 34'h09c03a0e6;
    stim[34] = 34'h166a7a5fe;
    stim[35] = 34'h001cece31;
    stim[36] = 34'h020935b53;
    stim[37] = 34'h18889c0f9;
    stim[38] = 34'h1618d9f90;
    stim[39] = 34'h1293f6a11;
    stim[40] = 34'h1e2bceb1c;
    stim[41] = 34'h1a662170e;
    stim[42] = 34'h0522ef309;
    stim[43] = 34'h1efe23cbd;
    stim[44] = 34'h0d1f379ac;
    stim[45] = 34'h0acd8d28d;
    stim[46] = 34'h1f08d3128;
    stim[47] = 34'h13cf442cb;
    stim[48] = 34'h141e74d9d;
    stim[49] = 34'h0de8db334;
    stim[50] = 34'h0240ef0ce;
    stim[51] = 34'h0066a3468;
    stim[52] = 34'h0c48f6617;
    stim[53] = 34'h14c2baa55;
    stim[54] = 34'h1ea5a509b;
    stim[55] = 34'h372db286e;
    stim[56] = 34'h0148ad849;
    stim[57] = 34'h085d1fb92;
    stim[58] = 34'h057042b51;
    stim[59] = 34'h1936abb56;
    stim[60] = 34'h1e5547849;
    stim[61] = 34'h165844652;
    stim[62] = 34'h0053f1837;
    stim[63] = 34'h1d3bf5e24;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 63'h0000000000000000;
      expv[1] = 63'h0000000000000000;
      expv[2] = 63'h0000000000000000;
      expv[3] = 63'h0000000000000000;
      expv[4] = 63'h0000000000000000;
      expv[5] = 63'h0000000000000000;
      expv[6] = 63'h0000000000000000;
      expv[7] = 63'h0000000000000000;
      expv[8] = 63'h0000000000000000;
      expv[9] = 63'h0000000000000000;
      expv[10] = 63'h0000000000000000;
      expv[11] = 63'h0000000000000000;
      expv[12] = 63'h0000000000000000;
      expv[13] = 63'h0000000000000000;
      expv[14] = 63'h0000000000000000;
      expv[15] = 63'h0000000000000000;
      expv[16] = 63'h0000000000000000;
      expv[17] = 63'h0000000000000000;
      expv[18] = 63'h0000000000000000;
      expv[19] = 63'h0000000000000000;
      expv[20] = 63'h0000000000000000;
      expv[21] = 63'h0000000000000000;
      expv[22] = 63'h0000000000000000;
      expv[23] = 63'h0000000000000000;
      expv[24] = 63'h0000000000000000;
      expv[25] = 63'h0000000000000000;
      expv[26] = 63'h0000000000000000;
      expv[27] = 63'h0000000000000000;
      expv[28] = 63'h0000000000000000;
      expv[29] = 63'h0000000000000000;
      expv[30] = 63'h0000000000000000;
      expv[31] = 63'h0000000000000000;
      expv[32] = 63'h0000000000000000;
      expv[33] = 63'h0000000000000000;
      expv[34] = 63'h0000000000000000;
      expv[35] = 63'h0000000000000000;
      expv[36] = 63'h0000000000000000;
      expv[37] = 63'h0000000000000000;
      expv[38] = 63'h0000000000000000;
      expv[39] = 63'h0000000000000000;
      expv[40] = 63'h0000000000000000;
      expv[41] = 63'h0000000000000000;
      expv[42] = 63'h0000000000000000;
      expv[43] = 63'h0000000000000000;
      expv[44] = 63'h0000000000000000;
      expv[45] = 63'h0000000000000000;
      expv[46] = 63'h0000000000000000;
      expv[47] = 63'h0000000000000000;
      expv[48] = 63'h0000000000000000;
      expv[49] = 63'h0000000000000000;
      expv[50] = 63'h0000000000000000;
      expv[51] = 63'h0000000000000000;
      expv[52] = 63'h0000000000000000;
      expv[53] = 63'h0000000000000000;
      expv[54] = 63'h0000000000000000;
      expv[55] = 63'h0000000000000000;
      expv[56] = 63'h0000000000000000;
      expv[57] = 63'h0000000000000000;
      expv[58] = 63'h0000000000000000;
      expv[59] = 63'h0000000000000000;
      expv[60] = 63'h0000000000000000;
      expv[61] = 63'h0000000000000000;
      expv[62] = 63'h0000000000000000;
      expv[63] = 63'h0000000000000000;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
