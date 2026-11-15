// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_065818 dut (
    .clk(clk),
    .quadrant(in_vec[12:10]),
    .radius(in_vec[9:0]),
    .red(out_vec[11:8]),
    .green(out_vec[7:4]),
    .blue(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h05d7;
    stim[1] = 13'h0676;
    stim[2] = 13'h0543;
    stim[3] = 13'h17a0;
    stim[4] = 13'h07e9;
    stim[5] = 13'h0eef;
    stim[6] = 13'h0892;
    stim[7] = 13'h16ce;
    stim[8] = 13'h0dc6;
    stim[9] = 13'h0c22;
    stim[10] = 13'h06eb;
    stim[11] = 13'h0981;
    stim[12] = 13'h0acd;
    stim[13] = 13'h125c;
    stim[14] = 13'h1a4f;
    stim[15] = 13'h1669;
    stim[16] = 13'h1ec7;
    stim[17] = 13'h09c4;
    stim[18] = 13'h1fd0;
    stim[19] = 13'h0622;
    stim[20] = 13'h0ddc;
    stim[21] = 13'h03b3;
    stim[22] = 13'h106a;
    stim[23] = 13'h0464;
    stim[24] = 13'h047d;
    stim[25] = 13'h0188;
    stim[26] = 13'h0536;
    stim[27] = 13'h07f6;
    stim[28] = 13'h19d4;
    stim[29] = 13'h0974;
    stim[30] = 13'h1274;
    stim[31] = 13'h0a93;
    stim[32] = 13'h0af4;
    stim[33] = 13'h1b9a;
    stim[34] = 13'h1ac9;
    stim[35] = 13'h1b46;
    stim[36] = 13'h002f;
    stim[37] = 13'h1e0d;
    stim[38] = 13'h04e4;
    stim[39] = 13'h1ddc;
    stim[40] = 13'h1787;
    stim[41] = 13'h14b2;
    stim[42] = 13'h05c2;
    stim[43] = 13'h1027;
    stim[44] = 13'h177a;
    stim[45] = 13'h0e6d;
    stim[46] = 13'h0561;
    stim[47] = 13'h0dbd;
    stim[48] = 13'h0e9d;
    stim[49] = 13'h022a;
    stim[50] = 13'h0729;
    stim[51] = 13'h0248;
    stim[52] = 13'h1c7c;
    stim[53] = 13'h1c5a;
    stim[54] = 13'h10da;
    stim[55] = 13'h1538;
    stim[56] = 13'h1d42;
    stim[57] = 13'h0668;
    stim[58] = 13'h0c43;
    stim[59] = 13'h15c8;
    stim[60] = 13'h1581;
    stim[61] = 13'h0a4f;
    stim[62] = 13'h0f55;
    stim[63] = 13'h07a6;
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
      expv[1] = 12'haa0;
      expv[2] = 12'hee0;
      expv[3] = 12'h880;
      expv[4] = 12'hd0d;
      expv[5] = 12'hdd0;
      expv[6] = 12'h077;
      expv[7] = 12'h040;
      expv[8] = 12'h606;
      expv[9] = 12'h033;
      expv[10] = 12'h011;
      expv[11] = 12'hdd0;
      expv[12] = 12'h000;
      expv[13] = 12'h030;
      expv[14] = 12'h00c;
      expv[15] = 12'h000;
      expv[16] = 12'h303;
      expv[17] = 12'h000;
      expv[18] = 12'h010;
      expv[19] = 12'h000;
      expv[20] = 12'h440;
      expv[21] = 12'h0ee;
      expv[22] = 12'hb00;
      expv[23] = 12'h00a;
      expv[24] = 12'hcc0;
      expv[25] = 12'hff0;
      expv[26] = 12'h800;
      expv[27] = 12'h660;
      expv[28] = 12'hee0;
      expv[29] = 12'h000;
      expv[30] = 12'h0d0;
      expv[31] = 12'h004;
      expv[32] = 12'h040;
      expv[33] = 12'h0d0;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h200;
      expv[38] = 12'h000;
      expv[39] = 12'hcc0;
      expv[40] = 12'h000;
      expv[41] = 12'hc0c;
      expv[42] = 12'h505;
      expv[43] = 12'h880;
      expv[44] = 12'h007;
      expv[45] = 12'hb0b;
      expv[46] = 12'h066;
      expv[47] = 12'hcc0;
      expv[48] = 12'h0ee;
      expv[49] = 12'h0ee;
      expv[50] = 12'h200;
      expv[51] = 12'h550;
      expv[52] = 12'h400;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h00a;
      expv[56] = 12'h909;
      expv[57] = 12'h000;
      expv[58] = 12'hdd0;
      expv[59] = 12'h011;
      expv[60] = 12'he0e;
      expv[61] = 12'hc0c;
      expv[62] = 12'h030;
      expv[63] = 12'h0aa;
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
