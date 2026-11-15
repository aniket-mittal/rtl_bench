// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05889 dut (
    .clk(clk),
    .hsync_in(in_vec[27:27]),
    .vsync_in(in_vec[26:26]),
    .blnk_in(in_vec[25:25]),
    .rgb_in(in_vec[24:1]),
    .rst(in_vec[0:0]),
    .hsync_out(out_vec[26:26]),
    .vsync_out(out_vec[25:25]),
    .blnk_out(out_vec[24:24]),
    .rgb_out(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'h6018877;
    stim[1] = 28'h9dd8da1;
    stim[2] = 28'h217e284;
    stim[3] = 28'hbef1cf4;
    stim[4] = 28'hd0b87ec;
    stim[5] = 28'he53b9f8;
    stim[6] = 28'h08af8f8;
    stim[7] = 28'h702c956;
    stim[8] = 28'h13af196;
    stim[9] = 28'h0306aae;
    stim[10] = 28'h0b206fc;
    stim[11] = 28'hd8308bc;
    stim[12] = 28'h3fc8a16;
    stim[13] = 28'h987a55c;
    stim[14] = 28'h9569d62;
    stim[15] = 28'h5c32282;
    stim[16] = 28'h6c5f472;
    stim[17] = 28'h9029188;
    stim[18] = 28'hc2fe7e6;
    stim[19] = 28'hbcbdae0;
    stim[20] = 28'h35f401a;
    stim[21] = 28'h9475cea;
    stim[22] = 28'ha6f7f90;
    stim[23] = 28'h21b5cc6;
    stim[24] = 28'h1233e4c;
    stim[25] = 28'h8e43876;
    stim[26] = 28'h5df883e;
    stim[27] = 28'hbecb01c;
    stim[28] = 28'h0efd42c;
    stim[29] = 28'hc4665e4;
    stim[30] = 28'hdbfdda6;
    stim[31] = 28'hdf1a7f6;
    stim[32] = 28'h07de10e;
    stim[33] = 28'hc5a88c4;
    stim[34] = 28'h1743cfc;
    stim[35] = 28'h0fed8c2;
    stim[36] = 28'hd08495a;
    stim[37] = 28'h7d4c9ce;
    stim[38] = 28'h9a88c16;
    stim[39] = 28'h3d55848;
    stim[40] = 28'h2b0d9f2;
    stim[41] = 28'hea8093a;
    stim[42] = 28'h7748258;
    stim[43] = 28'hb85fb92;
    stim[44] = 28'h1157a40;
    stim[45] = 28'h1b85a14;
    stim[46] = 28'h3e29bea;
    stim[47] = 28'h80997e8;
    stim[48] = 28'h7598bfa;
    stim[49] = 28'h8de2a04;
    stim[50] = 28'hee58ba2;
    stim[51] = 28'h9c52bf6;
    stim[52] = 28'hb0fc71c;
    stim[53] = 28'hfb8e24e;
    stim[54] = 28'h89d3f42;
    stim[55] = 28'hddba096;
    stim[56] = 28'h18030b2;
    stim[57] = 28'hd729796;
    stim[58] = 28'h30800b6;
    stim[59] = 28'h5109bc8;
    stim[60] = 28'h04c0d4e;
    stim[61] = 28'h421af70;
    stim[62] = 28'h45e4cb2;
    stim[63] = 28'h44fc772;
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
      expv[0] = 27'h0000000;
      expv[1] = 27'h0000000;
      expv[2] = 27'h0000000;
      expv[3] = 27'h10bf142;
      expv[4] = 27'h5f78e7a;
      expv[5] = 27'h685c3f6;
      expv[6] = 27'h729dcfc;
      expv[7] = 27'h0457c7c;
      expv[8] = 27'h38164ab;
      expv[9] = 27'h09d78cb;
      expv[10] = 27'h0183557;
      expv[11] = 27'h059037e;
      expv[12] = 27'h6c1845e;
      expv[13] = 27'h1fe450b;
      expv[14] = 27'h4c3d2ae;
      expv[15] = 27'h4ab4eb1;
      expv[16] = 27'h2e19141;
      expv[17] = 27'h362fa39;
      expv[18] = 27'h48148c4;
      expv[19] = 27'h617f3f3;
      expv[20] = 27'h5e5ed70;
      expv[21] = 27'h1afa00d;
      expv[22] = 27'h4a3ae75;
      expv[23] = 27'h537bfc8;
      expv[24] = 27'h10dae63;
      expv[25] = 27'h0919f26;
      expv[26] = 27'h4721c3b;
      expv[27] = 27'h2efc41f;
      expv[28] = 27'h5f6580e;
      expv[29] = 27'h077ea16;
      expv[30] = 27'h62332f2;
      expv[31] = 27'h6dfeed3;
      expv[32] = 27'h6f8d3fb;
      expv[33] = 27'h03ef087;
      expv[34] = 27'h62d4462;
      expv[35] = 27'h0ba1e7e;
      expv[36] = 27'h07f6c61;
      expv[37] = 27'h68424ad;
      expv[38] = 27'h3ea64e7;
      expv[39] = 27'h4d4460b;
      expv[40] = 27'h1eaac24;
      expv[41] = 27'h1586cf9;
      expv[42] = 27'h754049d;
      expv[43] = 27'h3ba412c;
      expv[44] = 27'h5c2fdc9;
      expv[45] = 27'h08abd20;
      expv[46] = 27'h0dc2d0a;
      expv[47] = 27'h1f14df5;
      expv[48] = 27'h404cbf4;
      expv[49] = 27'h3acc5fd;
      expv[50] = 27'h46f1502;
      expv[51] = 27'h772c5d1;
      expv[52] = 27'h4e295fb;
      expv[53] = 27'h587e38e;
      expv[54] = 27'h7dc7127;
      expv[55] = 27'h44e9fa1;
      expv[56] = 27'h6edd04b;
      expv[57] = 27'h0c01859;
      expv[58] = 27'h6b94bcb;
      expv[59] = 27'h184005b;
      expv[60] = 27'h2884de4;
      expv[61] = 27'h02606a7;
      expv[62] = 27'h210d7b8;
      expv[63] = 27'h22f2659;
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
