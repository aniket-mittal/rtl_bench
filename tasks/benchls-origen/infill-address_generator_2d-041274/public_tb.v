// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_041274 dut (
    .clk(clk),
    .rst_n(in_vec[15:15]),
    .clr(in_vec[14:14]),
    .en_sw(in_vec[13:13]),
    .en_tb(in_vec[12:12]),
    .init_mvec(in_vec[11:0]),
    .addr_sw(out_vec[19:8]),
    .addr_tb(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h1cb5;
    stim[1] = 16'h3891;
    stim[2] = 16'heb60;
    stim[3] = 16'ha338;
    stim[4] = 16'ha990;
    stim[5] = 16'hd0c0;
    stim[6] = 16'h9bcc;
    stim[7] = 16'h57bc;
    stim[8] = 16'h735d;
    stim[9] = 16'hdd80;
    stim[10] = 16'ha87e;
    stim[11] = 16'hcfda;
    stim[12] = 16'hf459;
    stim[13] = 16'h8b42;
    stim[14] = 16'h94e5;
    stim[15] = 16'hc2ad;
    stim[16] = 16'hc33e;
    stim[17] = 16'ha7cd;
    stim[18] = 16'hac14;
    stim[19] = 16'hdaf9;
    stim[20] = 16'h8470;
    stim[21] = 16'ha61d;
    stim[22] = 16'hdf27;
    stim[23] = 16'h9b6f;
    stim[24] = 16'hba89;
    stim[25] = 16'hf8f7;
    stim[26] = 16'hd531;
    stim[27] = 16'ha250;
    stim[28] = 16'he8b8;
    stim[29] = 16'hbc43;
    stim[30] = 16'hf782;
    stim[31] = 16'h97fc;
    stim[32] = 16'h9145;
    stim[33] = 16'hde53;
    stim[34] = 16'hc5ff;
    stim[35] = 16'haaaf;
    stim[36] = 16'h879a;
    stim[37] = 16'h8226;
    stim[38] = 16'hc32e;
    stim[39] = 16'h831d;
    stim[40] = 16'hacdf;
    stim[41] = 16'hd868;
    stim[42] = 16'hbda9;
    stim[43] = 16'hc597;
    stim[44] = 16'hfe42;
    stim[45] = 16'hdf32;
    stim[46] = 16'hb918;
    stim[47] = 16'hd2fc;
    stim[48] = 16'h96dd;
    stim[49] = 16'h985b;
    stim[50] = 16'hc840;
    stim[51] = 16'h8f94;
    stim[52] = 16'hb1b8;
    stim[53] = 16'hf159;
    stim[54] = 16'h9176;
    stim[55] = 16'h87fc;
    stim[56] = 16'hf567;
    stim[57] = 16'hdffb;
    stim[58] = 16'ha3a9;
    stim[59] = 16'h9ed5;
    stim[60] = 16'hf027;
    stim[61] = 16'hbee4;
    stim[62] = 16'hdc2f;
    stim[63] = 16'haf1e;
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
      expv[0] = 20'h00000;
      expv[1] = 20'h00000;
      expv[2] = 20'h00000;
      expv[3] = 20'h00000;
      expv[4] = 20'h33800;
      expv[5] = 20'h33900;
      expv[6] = 20'h00000;
      expv[7] = 20'h00000;
      expv[8] = 20'h00000;
      expv[9] = 20'h00000;
      expv[10] = 20'h00000;
      expv[11] = 20'h87e00;
      expv[12] = 20'h00000;
      expv[13] = 20'h00000;
      expv[14] = 20'h00000;
      expv[15] = 20'h00001;
      expv[16] = 20'h00000;
      expv[17] = 20'h00000;
      expv[18] = 20'h7cd00;
      expv[19] = 20'h7ce00;
      expv[20] = 20'h00000;
      expv[21] = 20'h00000;
      expv[22] = 20'h61d00;
      expv[23] = 20'h00000;
      expv[24] = 20'h00001;
      expv[25] = 20'ha8902;
      expv[26] = 20'h00000;
      expv[27] = 20'h00000;
      expv[28] = 20'h25000;
      expv[29] = 20'h00000;
      expv[30] = 20'hc4301;
      expv[31] = 20'h00000;
      expv[32] = 20'h00001;
      expv[33] = 20'h00002;
      expv[34] = 20'h00000;
      expv[35] = 20'h00000;
      expv[36] = 20'haaf00;
      expv[37] = 20'haaf00;
      expv[38] = 20'haaf00;
      expv[39] = 20'h00000;
      expv[40] = 20'h00000;
      expv[41] = 20'hcdf00;
      expv[42] = 20'h00000;
      expv[43] = 20'hda901;
      expv[44] = 20'h00000;
      expv[45] = 20'h00000;
      expv[46] = 20'h00000;
      expv[47] = 20'h91801;
      expv[48] = 20'h00000;
      expv[49] = 20'h00001;
      expv[50] = 20'h00002;
      expv[51] = 20'h00000;
      expv[52] = 20'h00000;
      expv[53] = 20'h1b801;
      expv[54] = 20'h00000;
      expv[55] = 20'h00001;
      expv[56] = 20'h00001;
      expv[57] = 20'h00000;
      expv[58] = 20'h00000;
      expv[59] = 20'h3a900;
      expv[60] = 20'h3a901;
      expv[61] = 20'h00000;
      expv[62] = 20'hee401;
      expv[63] = 20'h00000;
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
