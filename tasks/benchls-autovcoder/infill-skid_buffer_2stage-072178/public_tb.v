// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072178 dut (
    .sclk(clk),
    .reset(in_vec[10:10]),
    .s_data(in_vec[9:2]),
    .s_valid(in_vec[1:1]),
    .m_ready(in_vec[0:0]),
    .s_ready(out_vec[11:11]),
    .m_data(out_vec[10:3]),
    .m_valid(out_vec[2:2]),
    .num_data_valid(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h41f;
    stim[1] = 11'h681;
    stim[2] = 11'h372;
    stim[3] = 11'h28b;
    stim[4] = 11'h0ee;
    stim[5] = 11'h158;
    stim[6] = 11'h24b;
    stim[7] = 11'h0a5;
    stim[8] = 11'h2d6;
    stim[9] = 11'h1d3;
    stim[10] = 11'h200;
    stim[11] = 11'h35a;
    stim[12] = 11'h18f;
    stim[13] = 11'h091;
    stim[14] = 11'h076;
    stim[15] = 11'h389;
    stim[16] = 11'h224;
    stim[17] = 11'h267;
    stim[18] = 11'h180;
    stim[19] = 11'h210;
    stim[20] = 11'h3dd;
    stim[21] = 11'h19d;
    stim[22] = 11'h064;
    stim[23] = 11'h2fa;
    stim[24] = 11'h381;
    stim[25] = 11'h2c2;
    stim[26] = 11'h253;
    stim[27] = 11'h0ac;
    stim[28] = 11'h338;
    stim[29] = 11'h14e;
    stim[30] = 11'h056;
    stim[31] = 11'h3e7;
    stim[32] = 11'h2c8;
    stim[33] = 11'h14a;
    stim[34] = 11'h30e;
    stim[35] = 11'h0b2;
    stim[36] = 11'h098;
    stim[37] = 11'h392;
    stim[38] = 11'h13d;
    stim[39] = 11'h33a;
    stim[40] = 11'h30f;
    stim[41] = 11'h052;
    stim[42] = 11'h263;
    stim[43] = 11'h27e;
    stim[44] = 11'h1bd;
    stim[45] = 11'h150;
    stim[46] = 11'h026;
    stim[47] = 11'h190;
    stim[48] = 11'h395;
    stim[49] = 11'h039;
    stim[50] = 11'h3da;
    stim[51] = 11'h2dd;
    stim[52] = 11'h22c;
    stim[53] = 11'h0b1;
    stim[54] = 11'h358;
    stim[55] = 11'h26f;
    stim[56] = 11'h1e0;
    stim[57] = 11'h107;
    stim[58] = 11'h18b;
    stim[59] = 11'h188;
    stim[60] = 11'h32f;
    stim[61] = 11'h2e8;
    stim[62] = 11'h34f;
    stim[63] = 11'h107;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'hee0;
      expv[4] = 12'hd15;
      expv[5] = 12'h516;
      expv[6] = 12'h516;
      expv[7] = 12'h9dd;
      expv[8] = 12'h9d8;
      expv[9] = 12'hdad;
      expv[10] = 12'hba5;
      expv[11] = 12'hba5;
      expv[12] = 12'h3a6;
      expv[13] = 12'heb5;
      expv[14] = 12'heb0;
      expv[15] = 12'h8ed;
      expv[16] = 12'h8e8;
      expv[17] = 12'h8e8;
      expv[18] = 12'hccd;
      expv[19] = 12'hccd;
      expv[20] = 12'hccd;
      expv[21] = 12'hcc8;
      expv[22] = 12'hcc8;
      expv[23] = 12'hcc8;
      expv[24] = 12'hdf5;
      expv[25] = 12'hdf0;
      expv[26] = 12'hd85;
      expv[27] = 12'hca5;
      expv[28] = 12'hca5;
      expv[29] = 12'hca5;
      expv[30] = 12'h4a6;
      expv[31] = 12'h4a6;
      expv[32] = 12'ha9d;
      expv[33] = 12'ha9d;
      expv[34] = 12'h29e;
      expv[35] = 12'h29e;
      expv[36] = 12'h29e;
      expv[37] = 12'h29e;
      expv[38] = 12'h29e;
      expv[39] = 12'ha95;
      expv[40] = 12'h296;
      expv[41] = 12'he75;
      expv[42] = 12'h676;
      expv[43] = 12'h8a5;
      expv[44] = 12'h0a6;
      expv[45] = 12'hcfd;
      expv[46] = 12'hcfd;
      expv[47] = 12'h4fe;
      expv[48] = 12'h4fe;
      expv[49] = 12'h84d;
      expv[50] = 12'h848;
      expv[51] = 12'hfb5;
      expv[52] = 12'hfb0;
      expv[53] = 12'hfb0;
      expv[54] = 12'hfb0;
      expv[55] = 12'hfb0;
      expv[56] = 12'hcdd;
      expv[57] = 12'hcdd;
      expv[58] = 12'ha0d;
      expv[59] = 12'hb15;
      expv[60] = 12'hb15;
      expv[61] = 12'he5d;
      expv[62] = 12'he5d;
      expv[63] = 12'he9d;
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
