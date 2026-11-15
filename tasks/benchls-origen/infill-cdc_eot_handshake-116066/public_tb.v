// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_116066 dut (
    .sys_clk_i(clk),
    .phy_clk_i(in_vec[11:11]),
    .rst_ni(in_vec[10:10]),
    .proc_id_sys_i(in_vec[9:6]),
    .proc_id_phy_i(in_vec[5:2]),
    .running_trans_sys_i(in_vec[1:1]),
    .running_trans_phy_i(in_vec[0:0]),
    .evt_eot_o(out_vec[1:1]),
    .busy_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h236;
    stim[1] = 12'h3e1;
    stim[2] = 12'h60e;
    stim[3] = 12'h574;
    stim[4] = 12'h4ba;
    stim[5] = 12'hfa0;
    stim[6] = 12'h4cb;
    stim[7] = 12'hc09;
    stim[8] = 12'hf60;
    stim[9] = 12'he52;
    stim[10] = 12'h634;
    stim[11] = 12'h4f5;
    stim[12] = 12'hf3c;
    stim[13] = 12'hd4c;
    stim[14] = 12'h670;
    stim[15] = 12'hcb9;
    stim[16] = 12'h771;
    stim[17] = 12'hcd0;
    stim[18] = 12'heb8;
    stim[19] = 12'h68c;
    stim[20] = 12'h7dc;
    stim[21] = 12'h5b2;
    stim[22] = 12'hfb7;
    stim[23] = 12'hf7e;
    stim[24] = 12'hf57;
    stim[25] = 12'h4d3;
    stim[26] = 12'h6f0;
    stim[27] = 12'hfaa;
    stim[28] = 12'h504;
    stim[29] = 12'hed6;
    stim[30] = 12'hca9;
    stim[31] = 12'h44d;
    stim[32] = 12'hdd3;
    stim[33] = 12'hc9d;
    stim[34] = 12'h598;
    stim[35] = 12'hc54;
    stim[36] = 12'h50c;
    stim[37] = 12'h414;
    stim[38] = 12'h7a1;
    stim[39] = 12'h530;
    stim[40] = 12'hec2;
    stim[41] = 12'hc5e;
    stim[42] = 12'h439;
    stim[43] = 12'hf1d;
    stim[44] = 12'h53f;
    stim[45] = 12'hed6;
    stim[46] = 12'h695;
    stim[47] = 12'h680;
    stim[48] = 12'hdee;
    stim[49] = 12'h44b;
    stim[50] = 12'hcf1;
    stim[51] = 12'h58e;
    stim[52] = 12'h594;
    stim[53] = 12'h44c;
    stim[54] = 12'hfc4;
    stim[55] = 12'hd45;
    stim[56] = 12'h22c;
    stim[57] = 12'h739;
    stim[58] = 12'hd99;
    stim[59] = 12'hf9d;
    stim[60] = 12'hf1a;
    stim[61] = 12'h6c4;
    stim[62] = 12'heb3;
    stim[63] = 12'h548;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h1;
      expv[3] = 2'h1;
      expv[4] = 2'h1;
      expv[5] = 2'h1;
      expv[6] = 2'h1;
      expv[7] = 2'h1;
      expv[8] = 2'h1;
      expv[9] = 2'h1;
      expv[10] = 2'h1;
      expv[11] = 2'h1;
      expv[12] = 2'h1;
      expv[13] = 2'h1;
      expv[14] = 2'h1;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h2;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h1;
      expv[22] = 2'h1;
      expv[23] = 2'h1;
      expv[24] = 2'h1;
      expv[25] = 2'h1;
      expv[26] = 2'h1;
      expv[27] = 2'h1;
      expv[28] = 2'h1;
      expv[29] = 2'h3;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h1;
      expv[33] = 2'h1;
      expv[34] = 2'h1;
      expv[35] = 2'h1;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h1;
      expv[39] = 2'h1;
      expv[40] = 2'h1;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h1;
      expv[44] = 2'h1;
      expv[45] = 2'h1;
      expv[46] = 2'h1;
      expv[47] = 2'h1;
      expv[48] = 2'h1;
      expv[49] = 2'h1;
      expv[50] = 2'h1;
      expv[51] = 2'h3;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h1;
      expv[61] = 2'h1;
      expv[62] = 2'h1;
      expv[63] = 2'h1;
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
