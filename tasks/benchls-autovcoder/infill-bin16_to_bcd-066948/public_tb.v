// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_066948 dut (
    .clk(clk),
    .rst(in_vec[16:16]),
    .hex_in(in_vec[15:0]),
    .dec_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1d02c;
    stim[1] = 17'h10827;
    stim[2] = 17'h06e7a;
    stim[3] = 17'h03bff;
    stim[4] = 17'h003c6;
    stim[5] = 17'h0d7e2;
    stim[6] = 17'h0e3da;
    stim[7] = 17'h0b83c;
    stim[8] = 17'h01c5b;
    stim[9] = 17'h0723c;
    stim[10] = 17'h0814b;
    stim[11] = 17'h06b9b;
    stim[12] = 17'h068ad;
    stim[13] = 17'h00f47;
    stim[14] = 17'h09872;
    stim[15] = 17'h07d00;
    stim[16] = 17'h0b305;
    stim[17] = 17'h04125;
    stim[18] = 17'h0cb05;
    stim[19] = 17'h0483a;
    stim[20] = 17'h04811;
    stim[21] = 17'h00d01;
    stim[22] = 17'h0d65e;
    stim[23] = 17'h0cfe3;
    stim[24] = 17'h08c29;
    stim[25] = 17'h0ea18;
    stim[26] = 17'h0c3d6;
    stim[27] = 17'h0cc78;
    stim[28] = 17'h0a4ea;
    stim[29] = 17'h01c6f;
    stim[30] = 17'h0151d;
    stim[31] = 17'h16f6d;
    stim[32] = 17'h00c52;
    stim[33] = 17'h19470;
    stim[34] = 17'h039d4;
    stim[35] = 17'h0ccbb;
    stim[36] = 17'h05305;
    stim[37] = 17'h03314;
    stim[38] = 17'h0c889;
    stim[39] = 17'h084af;
    stim[40] = 17'h002b0;
    stim[41] = 17'h0d5c3;
    stim[42] = 17'h0fa32;
    stim[43] = 17'h075fe;
    stim[44] = 17'h0a63f;
    stim[45] = 17'h01676;
    stim[46] = 17'h089f1;
    stim[47] = 17'h0f975;
    stim[48] = 17'h08cdc;
    stim[49] = 17'h00193;
    stim[50] = 17'h025b5;
    stim[51] = 17'h0ae08;
    stim[52] = 17'h088d2;
    stim[53] = 17'h0a4f3;
    stim[54] = 17'h0ccfe;
    stim[55] = 17'h04e72;
    stim[56] = 17'h0deef;
    stim[57] = 17'h0b3d8;
    stim[58] = 17'h02267;
    stim[59] = 17'h0105e;
    stim[60] = 17'h06f4d;
    stim[61] = 17'h02bc6;
    stim[62] = 17'h0d4e6;
    stim[63] = 17'h07dd3;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000001;
      expv[37] = 32'h00000002;
      expv[38] = 32'h00000008;
      expv[39] = 32'h00000011;
      expv[40] = 32'h00000023;
      expv[41] = 32'h0000004a;
      expv[42] = 32'h000000c8;
      expv[43] = 32'h000001c0;
      expv[44] = 32'h000003b1;
      expv[45] = 32'h00000a93;
      expv[46] = 32'h0000182a;
      expv[47] = 32'h00003084;
      expv[48] = 32'h0000910c;
      expv[49] = 32'h0001221b;
      expv[50] = 32'h00024437;
      expv[51] = 32'h00024437;
      expv[52] = 32'h00024437;
      expv[53] = 32'h00024437;
      expv[54] = 32'h00024437;
      expv[55] = 32'h00024437;
      expv[56] = 32'h00024437;
      expv[57] = 32'h00024437;
      expv[58] = 32'h00024437;
      expv[59] = 32'h00024437;
      expv[60] = 32'h00024437;
      expv[61] = 32'h00024437;
      expv[62] = 32'h00024437;
      expv[63] = 32'h00024437;
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
