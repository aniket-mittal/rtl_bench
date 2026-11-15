// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_140626 dut (
    .wr_clk(clk),
    .rst(in_vec[35:35]),
    .rd_clk(in_vec[34:34]),
    .din(in_vec[33:2]),
    .wr_en(in_vec[1:1]),
    .rd_en(in_vec[0:0]),
    .dout(out_vec[51:20]),
    .full(out_vec[19:19]),
    .empty(out_vec[18:18]),
    .rd_data_count(out_vec[17:9]),
    .wr_data_count(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'ha3755a27a;
    stim[1] = 36'hd5bf4fd0e;
    stim[2] = 36'h43bd27cad;
    stim[3] = 36'h3e27a7755;
    stim[4] = 36'h36adf85c1;
    stim[5] = 36'h52c34c050;
    stim[6] = 36'h411cdd769;
    stim[7] = 36'h38798f3dc;
    stim[8] = 36'h1191c7717;
    stim[9] = 36'h067302ade;
    stim[10] = 36'h330f1e8cb;
    stim[11] = 36'h2fb375035;
    stim[12] = 36'h788eeb002;
    stim[13] = 36'h03baee8b2;
    stim[14] = 36'h793034887;
    stim[15] = 36'h2889d3b47;
    stim[16] = 36'h7b282e81d;
    stim[17] = 36'h233af67d5;
    stim[18] = 36'h124f798e0;
    stim[19] = 36'h6fc2f6898;
    stim[20] = 36'h04961bf36;
    stim[21] = 36'h7eff48179;
    stim[22] = 36'h5449b7f59;
    stim[23] = 36'h6fe4d58f2;
    stim[24] = 36'h7eb6586ac;
    stim[25] = 36'h149dbd157;
    stim[26] = 36'h550026d0b;
    stim[27] = 36'h19cf1f8f9;
    stim[28] = 36'h5004a25c9;
    stim[29] = 36'h7c2763aea;
    stim[30] = 36'h45673dd25;
    stim[31] = 36'h5e6f63eab;
    stim[32] = 36'h223e47fa2;
    stim[33] = 36'h6d5dbe082;
    stim[34] = 36'h325071e3e;
    stim[35] = 36'h2783349b8;
    stim[36] = 36'h5a933a325;
    stim[37] = 36'h242ccf0d3;
    stim[38] = 36'h6a567d1d8;
    stim[39] = 36'h145a762b7;
    stim[40] = 36'h2c417c6f4;
    stim[41] = 36'h0025c7e15;
    stim[42] = 36'h7661d7cf6;
    stim[43] = 36'h2c5f26b53;
    stim[44] = 36'h52d721978;
    stim[45] = 36'h270863560;
    stim[46] = 36'h59bbeb4a9;
    stim[47] = 36'h69ecef35f;
    stim[48] = 36'h184035523;
    stim[49] = 36'h090b28045;
    stim[50] = 36'h504c23e3e;
    stim[51] = 36'h7c81b26ba;
    stim[52] = 36'h0a481c88c;
    stim[53] = 36'h315483e86;
    stim[54] = 36'h317373c81;
    stim[55] = 36'h76dfd3a85;
    stim[56] = 36'hfeb8fd3d3;
    stim[57] = 36'h6230bebe4;
    stim[58] = 36'h49e30f46a;
    stim[59] = 36'h153ff9557;
    stim[60] = 36'h1c03a5fca;
    stim[61] = 36'h77bdd0a09;
    stim[62] = 36'h4f3e0b757;
    stim[63] = 36'h5dfa2205e;
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
      expv[0] = 52'h0000000040000;
      expv[1] = 52'h0000000040000;
      expv[2] = 52'h0000000040000;
      expv[3] = 52'h0000000040000;
      expv[4] = 52'h0000000040000;
      expv[5] = 52'h0000000040000;
      expv[6] = 52'h0000000040000;
      expv[7] = 52'h0000000040000;
      expv[8] = 52'h0000000040000;
      expv[9] = 52'h0000000040000;
      expv[10] = 52'h0000000040000;
      expv[11] = 52'h0000000040001;
      expv[12] = 52'h0000000040003;
      expv[13] = 52'h0000000040002;
      expv[14] = 52'h0000000040002;
      expv[15] = 52'h0000000040003;
      expv[16] = 52'h0000000000007;
      expv[17] = 52'h0000000000008;
      expv[18] = 52'h0000000000004;
      expv[19] = 52'h0000000000404;
      expv[20] = 52'h0000000000404;
      expv[21] = 52'h46471dc500e04;
      expv[22] = 52'h46471dc500e04;
      expv[23] = 52'h46471dc500e0c;
      expv[24] = 52'h46471dc500e0c;
      expv[25] = 52'h46471dc500e0d;
      expv[26] = 52'h19cc0ab70080c;
      expv[27] = 52'h19cc0ab70080d;
      expv[28] = 52'hcc3c7a320060e;
      expv[29] = 52'hcc3c7a320060d;
      expv[30] = 52'hcc3c7a320060b;
      expv[31] = 52'hcc3c7a320060c;
      expv[32] = 52'hcc3c7a3200608;
      expv[33] = 52'hcc3c7a3201209;
      expv[34] = 52'hcc3c7a3201209;
      expv[35] = 52'hcc3c7a320120a;
      expv[36] = 52'he23bac0001a06;
      expv[37] = 52'he23bac0001a16;
      expv[38] = 52'he23bac0001816;
      expv[39] = 52'he23bac0001817;
      expv[40] = 52'he23bac0001813;
      expv[41] = 52'he23bac0001814;
      expv[42] = 52'he23bac0000615;
      expv[43] = 52'he23bac0000615;
      expv[44] = 52'he23bac0002415;
      expv[45] = 52'he23bac0002416;
      expv[46] = 52'h0eebba2c02618;
      expv[47] = 52'h0eebba2c02618;
      expv[48] = 52'h0eebba2c02618;
      expv[49] = 52'h0eebba2c02619;
      expv[50] = 52'h0eebba2c02a18;
      expv[51] = 52'h0eebba2c02a16;
      expv[52] = 52'h0eebba2c02a16;
      expv[53] = 52'h0eebba2c02a17;
      expv[54] = 52'h0eebba2c02a0d;
      expv[55] = 52'he4c0d22102e0e;
      expv[56] = 52'h0000000040000;
      expv[57] = 52'h0000000040000;
      expv[58] = 52'h0000000040000;
      expv[59] = 52'h0000000040000;
      expv[60] = 52'h0000000040001;
      expv[61] = 52'h0000000040001;
      expv[62] = 52'h0000000040002;
      expv[63] = 52'h0000000040002;
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
