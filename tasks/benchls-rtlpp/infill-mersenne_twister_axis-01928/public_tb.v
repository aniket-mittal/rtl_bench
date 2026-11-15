// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01928 dut (
    .clk(clk),
    .rst(in_vec[34:34]),
    .output_axis_tready(in_vec[33:33]),
    .seed_val(in_vec[32:1]),
    .seed_start(in_vec[0:0]),
    .output_axis_tdata(out_vec[33:2]),
    .output_axis_tvalid(out_vec[1:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h52a2304cc;
    stim[1] = 35'h794ba2e5c;
    stim[2] = 35'h156730c65;
    stim[3] = 35'h2e88a86be;
    stim[4] = 35'h06c06c3d4;
    stim[5] = 35'h1d19af337;
    stim[6] = 35'h3178fba13;
    stim[7] = 35'h17ec2d3b7;
    stim[8] = 35'h274667cdb;
    stim[9] = 35'h3a2b51307;
    stim[10] = 35'h3b8a6a5ff;
    stim[11] = 35'h258090cbc;
    stim[12] = 35'h3c46a329a;
    stim[13] = 35'h0f7187491;
    stim[14] = 35'h019007bb1;
    stim[15] = 35'h0f9dddfcc;
    stim[16] = 35'h1b30522fa;
    stim[17] = 35'h28e27ce75;
    stim[18] = 35'h258864fdc;
    stim[19] = 35'h2f6fd1db1;
    stim[20] = 35'h25a3827e2;
    stim[21] = 35'h32e9a3621;
    stim[22] = 35'h38b3fd15e;
    stim[23] = 35'h15191bafe;
    stim[24] = 35'h347937cd7;
    stim[25] = 35'h32894443f;
    stim[26] = 35'h25c6851a8;
    stim[27] = 35'h03d693ee6;
    stim[28] = 35'h2ee234be4;
    stim[29] = 35'h05a6d1abd;
    stim[30] = 35'h1f8a9540c;
    stim[31] = 35'h2436f5146;
    stim[32] = 35'h2ff7dd2c6;
    stim[33] = 35'h39dc1bab3;
    stim[34] = 35'h16618e79f;
    stim[35] = 35'h0546d2102;
    stim[36] = 35'h1e7393f55;
    stim[37] = 35'h018ed1379;
    stim[38] = 35'h54606b566;
    stim[39] = 35'h1707a866b;
    stim[40] = 35'h185780776;
    stim[41] = 35'h1fe570f91;
    stim[42] = 35'h24da1cf9e;
    stim[43] = 35'h0a7cd67ea;
    stim[44] = 35'h318cab2c8;
    stim[45] = 35'h0c7601ae7;
    stim[46] = 35'h3a1f72503;
    stim[47] = 35'h0dcc4875c;
    stim[48] = 35'h2596182e5;
    stim[49] = 35'h27621ea40;
    stim[50] = 35'h210d90ef8;
    stim[51] = 35'h0672aca01;
    stim[52] = 35'h2537cdd31;
    stim[53] = 35'h0ff809392;
    stim[54] = 35'h005ef698a;
    stim[55] = 35'h37aade9f5;
    stim[56] = 35'h0afe71306;
    stim[57] = 35'h02da38b6f;
    stim[58] = 35'h016409ca0;
    stim[59] = 35'h38e3ac069;
    stim[60] = 35'h3f2060403;
    stim[61] = 35'h0fdfc2595;
    stim[62] = 35'h073d2975c;
    stim[63] = 35'h19ccb45d5;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000001;
      expv[4] = 34'h000000001;
      expv[5] = 34'h000000001;
      expv[6] = 34'h000000001;
      expv[7] = 34'h000000001;
      expv[8] = 34'h000000001;
      expv[9] = 34'h000000001;
      expv[10] = 34'h000000001;
      expv[11] = 34'h000000001;
      expv[12] = 34'h000000001;
      expv[13] = 34'h000000001;
      expv[14] = 34'h000000001;
      expv[15] = 34'h000000001;
      expv[16] = 34'h000000001;
      expv[17] = 34'h000000001;
      expv[18] = 34'h000000001;
      expv[19] = 34'h000000001;
      expv[20] = 34'h000000001;
      expv[21] = 34'h000000001;
      expv[22] = 34'h000000001;
      expv[23] = 34'h000000001;
      expv[24] = 34'h000000001;
      expv[25] = 34'h000000001;
      expv[26] = 34'h000000001;
      expv[27] = 34'h000000001;
      expv[28] = 34'h000000001;
      expv[29] = 34'h000000001;
      expv[30] = 34'h000000001;
      expv[31] = 34'h000000001;
      expv[32] = 34'h000000001;
      expv[33] = 34'h000000001;
      expv[34] = 34'h000000001;
      expv[35] = 34'h000000001;
      expv[36] = 34'h000000001;
      expv[37] = 34'h000000001;
      expv[38] = 34'h000000001;
      expv[39] = 34'h000000000;
      expv[40] = 34'h000000001;
      expv[41] = 34'h000000001;
      expv[42] = 34'h000000001;
      expv[43] = 34'h000000001;
      expv[44] = 34'h000000001;
      expv[45] = 34'h000000001;
      expv[46] = 34'h000000001;
      expv[47] = 34'h000000001;
      expv[48] = 34'h000000001;
      expv[49] = 34'h000000001;
      expv[50] = 34'h000000001;
      expv[51] = 34'h000000001;
      expv[52] = 34'h000000001;
      expv[53] = 34'h000000001;
      expv[54] = 34'h000000001;
      expv[55] = 34'h000000001;
      expv[56] = 34'h000000001;
      expv[57] = 34'h000000001;
      expv[58] = 34'h000000001;
      expv[59] = 34'h000000001;
      expv[60] = 34'h000000001;
      expv[61] = 34'h000000001;
      expv[62] = 34'h000000001;
      expv[63] = 34'h000000001;
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
