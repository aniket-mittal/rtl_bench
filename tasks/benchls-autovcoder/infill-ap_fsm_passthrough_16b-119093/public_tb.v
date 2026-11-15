// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_119093 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[18:18]),
    .ap_start(in_vec[17:17]),
    .ap_continue(in_vec[16:16]),
    .tmp(in_vec[15:0]),
    .ap_done(out_vec[18:18]),
    .ap_idle(out_vec[17:17]),
    .ap_ready(out_vec[16:16]),
    .ap_return(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h555cf;
    stim[1] = 19'h4bb9a;
    stim[2] = 19'h3f4f4;
    stim[3] = 19'h331f5;
    stim[4] = 19'h34455;
    stim[5] = 19'h0a490;
    stim[6] = 19'h37f38;
    stim[7] = 19'h1b6ab;
    stim[8] = 19'h2da5e;
    stim[9] = 19'h1280a;
    stim[10] = 19'h28431;
    stim[11] = 19'h13d3e;
    stim[12] = 19'h36240;
    stim[13] = 19'h32c96;
    stim[14] = 19'h0b70e;
    stim[15] = 19'h0c66e;
    stim[16] = 19'h293b6;
    stim[17] = 19'h00a07;
    stim[18] = 19'h160b5;
    stim[19] = 19'h34265;
    stim[20] = 19'h297f7;
    stim[21] = 19'h210a7;
    stim[22] = 19'h2208a;
    stim[23] = 19'h3df30;
    stim[24] = 19'h28b03;
    stim[25] = 19'h340c8;
    stim[26] = 19'h1724e;
    stim[27] = 19'h09edb;
    stim[28] = 19'h3c698;
    stim[29] = 19'h2c361;
    stim[30] = 19'h0e3b1;
    stim[31] = 19'h00731;
    stim[32] = 19'h2f915;
    stim[33] = 19'h04f61;
    stim[34] = 19'h1712c;
    stim[35] = 19'h0b972;
    stim[36] = 19'h3527b;
    stim[37] = 19'h35e37;
    stim[38] = 19'h4472e;
    stim[39] = 19'h1237e;
    stim[40] = 19'h2d4da;
    stim[41] = 19'h2baf6;
    stim[42] = 19'h25f05;
    stim[43] = 19'h3e66c;
    stim[44] = 19'h079b5;
    stim[45] = 19'h32137;
    stim[46] = 19'h3fd8a;
    stim[47] = 19'h03b46;
    stim[48] = 19'h2add7;
    stim[49] = 19'h38e54;
    stim[50] = 19'h27ff5;
    stim[51] = 19'h0ced7;
    stim[52] = 19'h2a8d5;
    stim[53] = 19'h0f09b;
    stim[54] = 19'h1aa7d;
    stim[55] = 19'h1279b;
    stim[56] = 19'h17e18;
    stim[57] = 19'h0fb04;
    stim[58] = 19'h23b62;
    stim[59] = 19'h1c01f;
    stim[60] = 19'h1de13;
    stim[61] = 19'h0a916;
    stim[62] = 19'h07729;
    stim[63] = 19'h48fca;
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
      expv[0] = 19'h20000;
      expv[1] = 19'h20000;
      expv[2] = 19'h5f4f4;
      expv[3] = 19'h531f5;
      expv[4] = 19'h54455;
      expv[5] = 19'h24455;
      expv[6] = 19'h57f38;
      expv[7] = 19'h27f38;
      expv[8] = 19'h5da5e;
      expv[9] = 19'h6da5e;
      expv[10] = 19'h58431;
      expv[11] = 19'h68431;
      expv[12] = 19'h56240;
      expv[13] = 19'h52c96;
      expv[14] = 19'h22c96;
      expv[15] = 19'h22c96;
      expv[16] = 19'h593b6;
      expv[17] = 19'h693b6;
      expv[18] = 19'h693b6;
      expv[19] = 19'h54265;
      expv[20] = 19'h597f7;
      expv[21] = 19'h497f7;
      expv[22] = 19'h497f7;
      expv[23] = 19'h497f7;
      expv[24] = 19'h58b03;
      expv[25] = 19'h48b03;
      expv[26] = 19'h28b03;
      expv[27] = 19'h28b03;
      expv[28] = 19'h5c698;
      expv[29] = 19'h5c361;
      expv[30] = 19'h6c361;
      expv[31] = 19'h6c361;
      expv[32] = 19'h4c361;
      expv[33] = 19'h6c361;
      expv[34] = 19'h6c361;
      expv[35] = 19'h2c361;
      expv[36] = 19'h5527b;
      expv[37] = 19'h55e37;
      expv[38] = 19'h25e37;
      expv[39] = 19'h20000;
      expv[40] = 19'h5d4da;
      expv[41] = 19'h4d4da;
      expv[42] = 19'h4d4da;
      expv[43] = 19'h4d4da;
      expv[44] = 19'h2d4da;
      expv[45] = 19'h52137;
      expv[46] = 19'h5fd8a;
      expv[47] = 19'h2fd8a;
      expv[48] = 19'h5add7;
      expv[49] = 19'h4add7;
      expv[50] = 19'h57ff5;
      expv[51] = 19'h67ff5;
      expv[52] = 19'h47ff5;
      expv[53] = 19'h67ff5;
      expv[54] = 19'h67ff5;
      expv[55] = 19'h27ff5;
      expv[56] = 19'h27ff5;
      expv[57] = 19'h27ff5;
      expv[58] = 19'h53b62;
      expv[59] = 19'h63b62;
      expv[60] = 19'h23b62;
      expv[61] = 19'h23b62;
      expv[62] = 19'h23b62;
      expv[63] = 19'h23b62;
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
