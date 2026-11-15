// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_084660 dut (
    .clock(clk),
    .reset(in_vec[19:19]),
    .io_operation_0(in_vec[18:16]),
    .io_inputs_0(in_vec[15:0]),
    .io_outputs_0(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hf5185;
    stim[1] = 20'hc2ebc;
    stim[2] = 20'h05d4a;
    stim[3] = 20'h10565;
    stim[4] = 20'h10f92;
    stim[5] = 20'h54af9;
    stim[6] = 20'h434b2;
    stim[7] = 20'h1bcea;
    stim[8] = 20'he2779;
    stim[9] = 20'h298d1;
    stim[10] = 20'h0e8c3;
    stim[11] = 20'h7311a;
    stim[12] = 20'h4566d;
    stim[13] = 20'h7a032;
    stim[14] = 20'h09d5b;
    stim[15] = 20'h4cec0;
    stim[16] = 20'h7dc79;
    stim[17] = 20'h3327a;
    stim[18] = 20'h45535;
    stim[19] = 20'h13855;
    stim[20] = 20'hff491;
    stim[21] = 20'h06741;
    stim[22] = 20'h413ec;
    stim[23] = 20'h3bcfb;
    stim[24] = 20'h20e2e;
    stim[25] = 20'h61b5d;
    stim[26] = 20'h4428a;
    stim[27] = 20'h2ad20;
    stim[28] = 20'h7f402;
    stim[29] = 20'h7b622;
    stim[30] = 20'h40e64;
    stim[31] = 20'h4839c;
    stim[32] = 20'h69f3d;
    stim[33] = 20'h0d226;
    stim[34] = 20'h9e44f;
    stim[35] = 20'h2e4ba;
    stim[36] = 20'h2cc06;
    stim[37] = 20'h703ce;
    stim[38] = 20'h6af81;
    stim[39] = 20'h31436;
    stim[40] = 20'h77353;
    stim[41] = 20'h285bb;
    stim[42] = 20'h1b00f;
    stim[43] = 20'h7cdd1;
    stim[44] = 20'h66a76;
    stim[45] = 20'h1b3a5;
    stim[46] = 20'h71c6c;
    stim[47] = 20'h68353;
    stim[48] = 20'h423b1;
    stim[49] = 20'h10be2;
    stim[50] = 20'h13fb6;
    stim[51] = 20'h0d208;
    stim[52] = 20'h50b30;
    stim[53] = 20'h38377;
    stim[54] = 20'ha0f65;
    stim[55] = 20'h2c87f;
    stim[56] = 20'h06710;
    stim[57] = 20'h1e797;
    stim[58] = 20'h3e2c7;
    stim[59] = 20'h03550;
    stim[60] = 20'h35b26;
    stim[61] = 20'h3e4a6;
    stim[62] = 20'h2c4bf;
    stim[63] = 20'h39d82;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h5d4a;
      expv[8] = 16'h0aca;
      expv[9] = 16'h1f24;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h79d4;
      expv[13] = 16'h0000;
      expv[14] = 16'hdaa1;
      expv[15] = 16'he8c3;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h9d5b;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0001;
      expv[23] = 16'h0000;
      expv[24] = 16'h70aa;
      expv[25] = 16'h0000;
      expv[26] = 16'h6741;
      expv[27] = 16'h0000;
      expv[28] = 16'h0001;
      expv[29] = 16'h1044;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h4400;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'hd226;
      expv[39] = 16'hc89e;
      expv[40] = 16'hd724;
      expv[41] = 16'h9024;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0001;
      expv[45] = 16'h0000;
      expv[46] = 16'hd699;
      expv[47] = 16'h601e;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h674a;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h17c4;
      expv[55] = 16'h7f6c;
      expv[56] = 16'hd208;
      expv[57] = 16'h0000;
      expv[58] = 16'h0001;
      expv[59] = 16'hfdd9;
      expv[60] = 16'haf01;
      expv[61] = 16'h6710;
      expv[62] = 16'hcf2e;
      expv[63] = 16'h0001;
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
