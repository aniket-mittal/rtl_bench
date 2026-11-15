// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01939 dut (
    .x(in_vec[31:0]),
    .y(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h11568b0b;
    stim[1] = 32'hfb452a90;
    stim[2] = 32'h9798e871;
    stim[3] = 32'hb8bbeaa4;
    stim[4] = 32'hb0abad03;
    stim[5] = 32'h9329ef4e;
    stim[6] = 32'h083b9237;
    stim[7] = 32'h88578d29;
    stim[8] = 32'ha9b38952;
    stim[9] = 32'h6b46d495;
    stim[10] = 32'h36261fc9;
    stim[11] = 32'h66b6fdbf;
    stim[12] = 32'he81059a6;
    stim[13] = 32'h387ebc70;
    stim[14] = 32'hccb4b351;
    stim[15] = 32'h83b57547;
    stim[16] = 32'h6687c101;
    stim[17] = 32'hf598df82;
    stim[18] = 32'h0d265b0b;
    stim[19] = 32'h859acbb7;
    stim[20] = 32'h9b6809ed;
    stim[21] = 32'h2a4167e7;
    stim[22] = 32'hd822286a;
    stim[23] = 32'h02d8449f;
    stim[24] = 32'hb69e9717;
    stim[25] = 32'h4363e4f9;
    stim[26] = 32'h36ef8538;
    stim[27] = 32'ha06a005d;
    stim[28] = 32'h96013489;
    stim[29] = 32'hd56dfba9;
    stim[30] = 32'hf5765796;
    stim[31] = 32'hf1231e88;
    stim[32] = 32'he568798e;
    stim[33] = 32'h1343b072;
    stim[34] = 32'hbac80372;
    stim[35] = 32'h16d5ab96;
    stim[36] = 32'h1ea688d4;
    stim[37] = 32'h44ab13ca;
    stim[38] = 32'hf6ca32c6;
    stim[39] = 32'h7222cfe7;
    stim[40] = 32'h44a483ac;
    stim[41] = 32'he7a8cbae;
    stim[42] = 32'h54706695;
    stim[43] = 32'h444373f0;
    stim[44] = 32'h9f27fa39;
    stim[45] = 32'h587a08f2;
    stim[46] = 32'hc6dd04aa;
    stim[47] = 32'h686dbdf6;
    stim[48] = 32'h88a12a98;
    stim[49] = 32'hdc5c7c85;
    stim[50] = 32'h5b4b1885;
    stim[51] = 32'hddf83a18;
    stim[52] = 32'h29ecd158;
    stim[53] = 32'h071502d4;
    stim[54] = 32'hdb26fe41;
    stim[55] = 32'h196eff74;
    stim[56] = 32'h72bd3a7b;
    stim[57] = 32'he06f3f0b;
    stim[58] = 32'h22856543;
    stim[59] = 32'he8799cd8;
    stim[60] = 32'he26fba6b;
    stim[61] = 32'h5e2d9916;
    stim[62] = 32'hcf677e2a;
    stim[63] = 32'h230c086e;
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
      expv[0] = 32'hc6210433;
      expv[1] = 32'h7efcd360;
      expv[2] = 32'h45cb4085;
      expv[3] = 32'h94a1ad94;
      expv[4] = 32'h2a8360df;
      expv[5] = 32'h7903d8d0;
      expv[6] = 32'hbdfe7971;
      expv[7] = 32'h556d07d7;
      expv[8] = 32'h2edce56e;
      expv[9] = 32'he528babe;
      expv[10] = 32'h2bbf121a;
      expv[11] = 32'hefa07742;
      expv[12] = 32'h3655cd4b;
      expv[13] = 32'h176fac08;
      expv[14] = 32'h3b6e0e43;
      expv[15] = 32'h9f045ef4;
      expv[16] = 32'h4eaec1e4;
      expv[17] = 32'h220f90f0;
      expv[18] = 32'h827dd3c4;
      expv[19] = 32'hd7f4402d;
      expv[20] = 32'h89916f56;
      expv[21] = 32'hf036975b;
      expv[22] = 32'h7dffe06b;
      expv[23] = 32'h855c7bee;
      expv[24] = 32'h2f464feb;
      expv[25] = 32'hf881072c;
      expv[26] = 32'h9a6eb6e9;
      expv[27] = 32'hc2f6f5c6;
      expv[28] = 32'hc51edb73;
      expv[29] = 32'h1ffb72d0;
      expv[30] = 32'hd8b46582;
      expv[31] = 32'h44756d7e;
      expv[32] = 32'hd4cb0eb5;
      expv[33] = 32'h0981be4c;
      expv[34] = 32'h952a1c77;
      expv[35] = 32'h8fab8413;
      expv[36] = 32'hdb2a077b;
      expv[37] = 32'ha337c8b8;
      expv[38] = 32'h034e213b;
      expv[39] = 32'h288cbf27;
      expv[40] = 32'h9e45b4dd;
      expv[41] = 32'h47b3b433;
      expv[42] = 32'ha02cef77;
      expv[43] = 32'h835d3ff6;
      expv[44] = 32'h29ede1cd;
      expv[45] = 32'h39af888d;
      expv[46] = 32'he0f3dcd9;
      expv[47] = 32'hc35ff5b1;
      expv[48] = 32'hf2466d8d;
      expv[49] = 32'he2cbeab3;
      expv[50] = 32'hbe9a0914;
      expv[51] = 32'h07508230;
      expv[52] = 32'h33ff1b97;
      expv[53] = 32'h436e2801;
      expv[54] = 32'h1f3e61cb;
      expv[55] = 32'h4606a4cf;
      expv[56] = 32'hfb9d36bd;
      expv[57] = 32'hbcb8e33a;
      expv[58] = 32'hf72d41f1;
      expv[59] = 32'h3aaa475b;
      expv[60] = 32'h952d526e;
      expv[61] = 32'he95dce51;
      expv[62] = 32'hdf770f8c;
      expv[63] = 32'hfb93a2f7;
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
