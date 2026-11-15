// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_161307 dut (
    .opcode(in_vec[11:6]),
    .func(in_vec[5:0]),
    .RegDest(out_vec[9:9]),
    .Branch(out_vec[8:8]),
    .MemRead(out_vec[7:7]),
    .MemtoReg(out_vec[6:6]),
    .MemWrite(out_vec[5:5]),
    .ALUSrc(out_vec[4:4]),
    .RegWrite(out_vec[3:3]),
    .aluc(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h57b;
    stim[1] = 12'h3af;
    stim[2] = 12'h302;
    stim[3] = 12'hcdc;
    stim[4] = 12'h4ae;
    stim[5] = 12'hbb7;
    stim[6] = 12'h784;
    stim[7] = 12'he84;
    stim[8] = 12'h8a3;
    stim[9] = 12'he35;
    stim[10] = 12'hde2;
    stim[11] = 12'h25c;
    stim[12] = 12'h703;
    stim[13] = 12'h2ab;
    stim[14] = 12'he0a;
    stim[15] = 12'h499;
    stim[16] = 12'h44b;
    stim[17] = 12'h9fe;
    stim[18] = 12'h5b5;
    stim[19] = 12'hb10;
    stim[20] = 12'h810;
    stim[21] = 12'hb76;
    stim[22] = 12'hd12;
    stim[23] = 12'h03a;
    stim[24] = 12'h40b;
    stim[25] = 12'h0f5;
    stim[26] = 12'h4f5;
    stim[27] = 12'h032;
    stim[28] = 12'h95c;
    stim[29] = 12'h688;
    stim[30] = 12'h4c2;
    stim[31] = 12'h1dd;
    stim[32] = 12'h4bb;
    stim[33] = 12'h638;
    stim[34] = 12'h2c2;
    stim[35] = 12'h753;
    stim[36] = 12'h946;
    stim[37] = 12'ha68;
    stim[38] = 12'hdeb;
    stim[39] = 12'he79;
    stim[40] = 12'hadf;
    stim[41] = 12'h2f0;
    stim[42] = 12'hd2e;
    stim[43] = 12'hf70;
    stim[44] = 12'hac4;
    stim[45] = 12'hed2;
    stim[46] = 12'hdac;
    stim[47] = 12'hf75;
    stim[48] = 12'hc92;
    stim[49] = 12'hfb4;
    stim[50] = 12'he77;
    stim[51] = 12'hc06;
    stim[52] = 12'h717;
    stim[53] = 12'h5be;
    stim[54] = 12'hcaa;
    stim[55] = 12'h393;
    stim[56] = 12'hd24;
    stim[57] = 12'ha60;
    stim[58] = 12'h4d2;
    stim[59] = 12'hb32;
    stim[60] = 12'h5b5;
    stim[61] = 12'h7d3;
    stim[62] = 12'h919;
    stim[63] = 12'hd97;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h01a;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h030;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h030;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
