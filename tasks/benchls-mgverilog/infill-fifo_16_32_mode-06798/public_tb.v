// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06798 dut (
    .clk(clk),
    .rst(in_vec[37:37]),
    .en(in_vec[36:36]),
    .mode(in_vec[35:34]),
    .din(in_vec[33:2]),
    .we(in_vec[1:1]),
    .re(in_vec[0:0]),
    .dout(out_vec[23:4]),
    .status(out_vec[3:2]),
    .full(out_vec[1:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h2a0ae1e04a;
    stim[1] = 38'h2a36a3443c;
    stim[2] = 38'h14a87e498c;
    stim[3] = 38'h040619042d;
    stim[4] = 38'h10664348b3;
    stim[5] = 38'h0a8fd9c585;
    stim[6] = 38'h06dade2535;
    stim[7] = 38'h13bd569c52;
    stim[8] = 38'h12b2ec3ab7;
    stim[9] = 38'h1ab708f9d5;
    stim[10] = 38'h1b0d4dcd8a;
    stim[11] = 38'h08fd051aea;
    stim[12] = 38'h18e4bf2206;
    stim[13] = 38'h124abf31a1;
    stim[14] = 38'h15ec375da4;
    stim[15] = 38'h107ac25976;
    stim[16] = 38'h0c30379c1d;
    stim[17] = 38'h1900019f24;
    stim[18] = 38'h05b5d612ac;
    stim[19] = 38'h15b18b27f4;
    stim[20] = 38'h232025726e;
    stim[21] = 38'h0c54106b50;
    stim[22] = 38'h0856080934;
    stim[23] = 38'h1160da067f;
    stim[24] = 38'h181e93318a;
    stim[25] = 38'h07d3832df3;
    stim[26] = 38'h0cf76c6af3;
    stim[27] = 38'h0cabff00ac;
    stim[28] = 38'h125dce6339;
    stim[29] = 38'h005005fe80;
    stim[30] = 38'h11ef882b11;
    stim[31] = 38'h1e362745f8;
    stim[32] = 38'h00ee05d01d;
    stim[33] = 38'h010868ddec;
    stim[34] = 38'h0fe81643a0;
    stim[35] = 38'h074200d133;
    stim[36] = 38'h12b8680265;
    stim[37] = 38'h15de0510e8;
    stim[38] = 38'h155644b777;
    stim[39] = 38'h1deface02c;
    stim[40] = 38'h03d663b8ba;
    stim[41] = 38'h17ebf23cd0;
    stim[42] = 38'h0b45cf909d;
    stim[43] = 38'h0b90e98b2b;
    stim[44] = 38'h06abd7b0c3;
    stim[45] = 38'h1c22923cb4;
    stim[46] = 38'h19cd6a72f0;
    stim[47] = 38'h0fce9c9a32;
    stim[48] = 38'h1cbc2c8ce8;
    stim[49] = 38'h1d8bbb91eb;
    stim[50] = 38'h12e99fbc4a;
    stim[51] = 38'h0040f7db80;
    stim[52] = 38'h06ecae4aa9;
    stim[53] = 38'h0a44f6bfc9;
    stim[54] = 38'h00522dddc7;
    stim[55] = 38'h0c5c12a54b;
    stim[56] = 38'h1d338cb7e6;
    stim[57] = 38'h089b57126e;
    stim[58] = 38'h0c4178bc45;
    stim[59] = 38'h167ed4877d;
    stim[60] = 38'h0e7ec46556;
    stim[61] = 38'h1c75ae9917;
    stim[62] = 38'h12b0237918;
    stim[63] = 38'h00188e0530;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'h00000x;
      expv[2] = 24'h00000d;
      expv[3] = 24'h00000d;
      expv[4] = 24'h00000d;
      expv[5] = 24'hxxxx0d;
      expv[6] = 24'h000001;
      expv[7] = 24'h00000d;
      expv[8] = 24'h00000d;
      expv[9] = 24'ha71400;
      expv[10] = 24'h5a7144;
      expv[11] = 24'h5a7141;
      expv[12] = 24'h000004;
      expv[13] = 24'h00000d;
      expv[14] = 24'hc88100;
      expv[15] = 24'hc88101;
      expv[16] = 24'hc88100;
      expv[17] = 24'h000004;
      expv[18] = 24'h00000d;
      expv[19] = 24'h00000d;
      expv[20] = 24'h00000d;
      expv[21] = 24'h00000d;
      expv[22] = 24'h00000d;
      expv[23] = 24'h00000d;
      expv[24] = 24'h5c9b0d;
      expv[25] = 24'h5c9b01;
      expv[26] = 24'h000004;
      expv[27] = 24'h00000d;
      expv[28] = 24'h00000d;
      expv[29] = 24'h1abc0d;
      expv[30] = 24'h00000c;
      expv[31] = 24'h1abc0d;
      expv[32] = 24'h1abc0c;
      expv[33] = 24'h00000c;
      expv[34] = 24'h00000d;
      expv[35] = 24'h00000d;
      expv[36] = 24'h00000d;
      expv[37] = 24'h344c0d;
      expv[38] = 24'h344c0c;
      expv[39] = 24'h0d130c;
      expv[40] = 24'h0d130c;
      expv[41] = 24'h00000c;
      expv[42] = 24'h00000d;
      expv[43] = 24'h00000d;
      expv[44] = 24'h00000d;
      expv[45] = 24'h00000d;
      expv[46] = 24'h00000d;
      expv[47] = 24'h00000d;
      expv[48] = 24'h00000d;
      expv[49] = 24'h00000d;
      expv[50] = 24'h00000d;
      expv[51] = 24'h00000d;
      expv[52] = 24'h000000;
      expv[53] = 24'h00000d;
      expv[54] = 24'h00000d;
      expv[55] = 24'h00000d;
      expv[56] = 24'h00000d;
      expv[57] = 24'h00000d;
      expv[58] = 24'h000000;
      expv[59] = 24'h00000d;
      expv[60] = 24'hcb7e4d;
      expv[61] = 24'h000008;
      expv[62] = 24'h00000d;
      expv[63] = 24'h00000d;
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
