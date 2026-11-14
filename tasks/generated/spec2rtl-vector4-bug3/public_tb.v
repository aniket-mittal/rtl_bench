// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[7:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h83;
    stim[1] = 8'h64;
    stim[2] = 8'hf8;
    stim[3] = 8'h1b;
    stim[4] = 8'hb3;
    stim[5] = 8'hc5;
    stim[6] = 8'he9;
    stim[7] = 8'h66;
    stim[8] = 8'h04;
    stim[9] = 8'h6e;
    stim[10] = 8'hba;
    stim[11] = 8'he3;
    stim[12] = 8'hc4;
    stim[13] = 8'h2a;
    stim[14] = 8'h21;
    stim[15] = 8'h19;
    stim[16] = 8'hec;
    stim[17] = 8'h8d;
    stim[18] = 8'h82;
    stim[19] = 8'h67;
    stim[20] = 8'h99;
    stim[21] = 8'h86;
    stim[22] = 8'h45;
    stim[23] = 8'h5c;
    stim[24] = 8'h61;
    stim[25] = 8'hdc;
    stim[26] = 8'hac;
    stim[27] = 8'h35;
    stim[28] = 8'ha8;
    stim[29] = 8'h1e;
    stim[30] = 8'h3f;
    stim[31] = 8'hee;
    stim[32] = 8'h71;
    stim[33] = 8'h9f;
    stim[34] = 8'h4e;
    stim[35] = 8'h07;
    stim[36] = 8'h42;
    stim[37] = 8'h4f;
    stim[38] = 8'h66;
    stim[39] = 8'hbc;
    stim[40] = 8'h15;
    stim[41] = 8'h65;
    stim[42] = 8'h5a;
    stim[43] = 8'haa;
    stim[44] = 8'h9f;
    stim[45] = 8'hfd;
    stim[46] = 8'h81;
    stim[47] = 8'h14;
    stim[48] = 8'h3e;
    stim[49] = 8'hdb;
    stim[50] = 8'h87;
    stim[51] = 8'hf9;
    stim[52] = 8'h6f;
    stim[53] = 8'h75;
    stim[54] = 8'hdc;
    stim[55] = 8'h51;
    stim[56] = 8'hab;
    stim[57] = 8'hff;
    stim[58] = 8'h3c;
    stim[59] = 8'h7a;
    stim[60] = 8'hb0;
    stim[61] = 8'h04;
    stim[62] = 8'hb4;
    stim[63] = 8'h26;
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
      expv[0] = 32'h00000083;
      expv[1] = 32'hffffff64;
      expv[2] = 32'hfffffff8;
      expv[3] = 32'h0000001b;
      expv[4] = 32'h000000b3;
      expv[5] = 32'hffffffc5;
      expv[6] = 32'hffffffe9;
      expv[7] = 32'hffffff66;
      expv[8] = 32'h00000004;
      expv[9] = 32'hffffff6e;
      expv[10] = 32'h000000ba;
      expv[11] = 32'hffffffe3;
      expv[12] = 32'hffffffc4;
      expv[13] = 32'h0000002a;
      expv[14] = 32'h00000021;
      expv[15] = 32'h00000019;
      expv[16] = 32'hffffffec;
      expv[17] = 32'h0000008d;
      expv[18] = 32'h00000082;
      expv[19] = 32'hffffff67;
      expv[20] = 32'h00000099;
      expv[21] = 32'h00000086;
      expv[22] = 32'hffffff45;
      expv[23] = 32'hffffff5c;
      expv[24] = 32'hffffff61;
      expv[25] = 32'hffffffdc;
      expv[26] = 32'h000000ac;
      expv[27] = 32'h00000035;
      expv[28] = 32'h000000a8;
      expv[29] = 32'h0000001e;
      expv[30] = 32'h0000003f;
      expv[31] = 32'hffffffee;
      expv[32] = 32'hffffff71;
      expv[33] = 32'h0000009f;
      expv[34] = 32'hffffff4e;
      expv[35] = 32'h00000007;
      expv[36] = 32'hffffff42;
      expv[37] = 32'hffffff4f;
      expv[38] = 32'hffffff66;
      expv[39] = 32'h000000bc;
      expv[40] = 32'h00000015;
      expv[41] = 32'hffffff65;
      expv[42] = 32'hffffff5a;
      expv[43] = 32'h000000aa;
      expv[44] = 32'h0000009f;
      expv[45] = 32'hfffffffd;
      expv[46] = 32'h00000081;
      expv[47] = 32'h00000014;
      expv[48] = 32'h0000003e;
      expv[49] = 32'hffffffdb;
      expv[50] = 32'h00000087;
      expv[51] = 32'hfffffff9;
      expv[52] = 32'hffffff6f;
      expv[53] = 32'hffffff75;
      expv[54] = 32'hffffffdc;
      expv[55] = 32'hffffff51;
      expv[56] = 32'h000000ab;
      expv[57] = 32'hffffffff;
      expv[58] = 32'h0000003c;
      expv[59] = 32'hffffff7a;
      expv[60] = 32'h000000b0;
      expv[61] = 32'h00000004;
      expv[62] = 32'h000000b4;
      expv[63] = 32'h00000026;
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
