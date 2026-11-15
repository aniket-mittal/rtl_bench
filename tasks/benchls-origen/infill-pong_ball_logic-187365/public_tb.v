// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_187365 dut (
    .clk(clk),
    .posbarraiy(in_vec[19:10]),
    .posbarrady(in_vec[9:0]),
    .posx(out_vec[23:14]),
    .posy(out_vec[13:4]),
    .vidasi(out_vec[3:3]),
    .vidasd(out_vec[2:2]),
    .pierdei(out_vec[1:1]),
    .pierded(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h47d64;
    stim[1] = 20'h7e8a9;
    stim[2] = 20'hae2d0;
    stim[3] = 20'h75b48;
    stim[4] = 20'h7599a;
    stim[5] = 20'h76c29;
    stim[6] = 20'hf4780;
    stim[7] = 20'hc2d3e;
    stim[8] = 20'h19a09;
    stim[9] = 20'hc3674;
    stim[10] = 20'hcd948;
    stim[11] = 20'h623ae;
    stim[12] = 20'heff34;
    stim[13] = 20'h33982;
    stim[14] = 20'hd34d3;
    stim[15] = 20'h47e57;
    stim[16] = 20'he3525;
    stim[17] = 20'h36a5b;
    stim[18] = 20'h77bba;
    stim[19] = 20'h96a48;
    stim[20] = 20'hefd35;
    stim[21] = 20'h97a74;
    stim[22] = 20'h3570e;
    stim[23] = 20'h7ffd3;
    stim[24] = 20'h19136;
    stim[25] = 20'h121f5;
    stim[26] = 20'h7cc6b;
    stim[27] = 20'h209e2;
    stim[28] = 20'h1ce23;
    stim[29] = 20'h524c5;
    stim[30] = 20'h9a5b6;
    stim[31] = 20'hd8315;
    stim[32] = 20'h7e6ca;
    stim[33] = 20'hd24ca;
    stim[34] = 20'h0692e;
    stim[35] = 20'h842af;
    stim[36] = 20'h83af5;
    stim[37] = 20'h1744d;
    stim[38] = 20'h7110b;
    stim[39] = 20'h13f72;
    stim[40] = 20'h9c966;
    stim[41] = 20'hb4e5c;
    stim[42] = 20'h49825;
    stim[43] = 20'h0750f;
    stim[44] = 20'h8b18f;
    stim[45] = 20'hde40f;
    stim[46] = 20'hdc407;
    stim[47] = 20'h6ff23;
    stim[48] = 20'hb3e25;
    stim[49] = 20'h49758;
    stim[50] = 20'h6b15f;
    stim[51] = 20'ha0e5a;
    stim[52] = 20'hb82e9;
    stim[53] = 20'h60e22;
    stim[54] = 20'hdd8b0;
    stim[55] = 20'ha5f0e;
    stim[56] = 20'h679a5;
    stim[57] = 20'hf236a;
    stim[58] = 20'h785ab;
    stim[59] = 20'h06892;
    stim[60] = 20'h588c6;
    stim[61] = 20'hf0135;
    stim[62] = 20'ha4ee6;
    stim[63] = 20'hb679a;
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
      expv[0] = 24'h460dcc;
      expv[1] = 24'h460dcc;
      expv[2] = 24'h460dcc;
      expv[3] = 24'h460dcc;
      expv[4] = 24'h460dcc;
      expv[5] = 24'h460dcc;
      expv[6] = 24'h460dcc;
      expv[7] = 24'h460dcc;
      expv[8] = 24'h460dcc;
      expv[9] = 24'h460dcc;
      expv[10] = 24'h460dcc;
      expv[11] = 24'h460dcc;
      expv[12] = 24'h460dcc;
      expv[13] = 24'h460dcc;
      expv[14] = 24'h460dcc;
      expv[15] = 24'h460dcc;
      expv[16] = 24'h460dcc;
      expv[17] = 24'h460dcc;
      expv[18] = 24'h460dcc;
      expv[19] = 24'h460dcc;
      expv[20] = 24'h460dcc;
      expv[21] = 24'h460dcc;
      expv[22] = 24'h460dcc;
      expv[23] = 24'h460dcc;
      expv[24] = 24'h460dcc;
      expv[25] = 24'h460dcc;
      expv[26] = 24'h460dcc;
      expv[27] = 24'h460dcc;
      expv[28] = 24'h460dcc;
      expv[29] = 24'h460dcc;
      expv[30] = 24'h460dcc;
      expv[31] = 24'h460dcc;
      expv[32] = 24'h460dcc;
      expv[33] = 24'h460dcc;
      expv[34] = 24'h460dcc;
      expv[35] = 24'h460dcc;
      expv[36] = 24'h460dcc;
      expv[37] = 24'h460dcc;
      expv[38] = 24'h460dcc;
      expv[39] = 24'h460dcc;
      expv[40] = 24'h460dcc;
      expv[41] = 24'h460dcc;
      expv[42] = 24'h460dcc;
      expv[43] = 24'h460dcc;
      expv[44] = 24'h460dcc;
      expv[45] = 24'h460dcc;
      expv[46] = 24'h460dcc;
      expv[47] = 24'h460dcc;
      expv[48] = 24'h460dcc;
      expv[49] = 24'h460dcc;
      expv[50] = 24'h460dcc;
      expv[51] = 24'h460dcc;
      expv[52] = 24'h460dcc;
      expv[53] = 24'h460dcc;
      expv[54] = 24'h460dcc;
      expv[55] = 24'h460dcc;
      expv[56] = 24'h460dcc;
      expv[57] = 24'h460dcc;
      expv[58] = 24'h460dcc;
      expv[59] = 24'h460dcc;
      expv[60] = 24'h460dcc;
      expv[61] = 24'h460dcc;
      expv[62] = 24'h460dcc;
      expv[63] = 24'h460dcc;
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
