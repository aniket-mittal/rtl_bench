// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087667 dut (
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .p(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h22ce;
    stim[1] = 16'hedf6;
    stim[2] = 16'ha134;
    stim[3] = 16'h9427;
    stim[4] = 16'h52c9;
    stim[5] = 16'h10b0;
    stim[6] = 16'hc6b1;
    stim[7] = 16'h307e;
    stim[8] = 16'h215f;
    stim[9] = 16'hd87d;
    stim[10] = 16'h8d52;
    stim[11] = 16'hadce;
    stim[12] = 16'h5582;
    stim[13] = 16'h9d66;
    stim[14] = 16'he714;
    stim[15] = 16'h3945;
    stim[16] = 16'h7da1;
    stim[17] = 16'hd4cf;
    stim[18] = 16'hb8e4;
    stim[19] = 16'h8243;
    stim[20] = 16'h9289;
    stim[21] = 16'h0f2b;
    stim[22] = 16'he653;
    stim[23] = 16'hf255;
    stim[24] = 16'hebdd;
    stim[25] = 16'h6bc3;
    stim[26] = 16'h7ac2;
    stim[27] = 16'hfe2b;
    stim[28] = 16'hebe6;
    stim[29] = 16'hd0e1;
    stim[30] = 16'h7c0a;
    stim[31] = 16'h1c2b;
    stim[32] = 16'heb97;
    stim[33] = 16'h9abb;
    stim[34] = 16'hfb7d;
    stim[35] = 16'h7a46;
    stim[36] = 16'h737b;
    stim[37] = 16'h333a;
    stim[38] = 16'h807e;
    stim[39] = 16'h9121;
    stim[40] = 16'hbb6d;
    stim[41] = 16'h284f;
    stim[42] = 16'h8077;
    stim[43] = 16'hc902;
    stim[44] = 16'hd49e;
    stim[45] = 16'h0271;
    stim[46] = 16'h5ea2;
    stim[47] = 16'hf170;
    stim[48] = 16'had03;
    stim[49] = 16'hcf98;
    stim[50] = 16'h91fc;
    stim[51] = 16'h7ba0;
    stim[52] = 16'h8f32;
    stim[53] = 16'hb44c;
    stim[54] = 16'h9857;
    stim[55] = 16'h7ada;
    stim[56] = 16'h9910;
    stim[57] = 16'h5c5a;
    stim[58] = 16'hdb89;
    stim[59] = 16'h5401;
    stim[60] = 16'he127;
    stim[61] = 16'h9dff;
    stim[62] = 16'h0190;
    stim[63] = 16'ha615;
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
      expv[0] = 16'h1b5c;
      expv[1] = 16'he3be;
      expv[2] = 16'h20b4;
      expv[3] = 16'h168c;
      expv[4] = 16'h4062;
      expv[5] = 16'h0b00;
      expv[6] = 16'h88e6;
      expv[7] = 16'h17a0;
      expv[8] = 16'h0c3f;
      expv[9] = 16'h6978;
      expv[10] = 16'h2d2a;
      expv[11] = 16'h8b36;
      expv[12] = 16'h2b2a;
      expv[13] = 16'h3e8e;
      expv[14] = 16'h120c;
      expv[15] = 16'h0f5d;
      expv[16] = 16'h4e9d;
      expv[17] = 16'hab6c;
      expv[18] = 16'ha3e0;
      expv[19] = 16'h2206;
      expv[20] = 16'h4e22;
      expv[21] = 16'h0285;
      expv[22] = 16'h4a92;
      expv[23] = 16'h505a;
      expv[24] = 16'hcadf;
      expv[25] = 16'h5181;
      expv[26] = 16'h5c74;
      expv[27] = 16'h2aaa;
      expv[28] = 16'hd322;
      expv[29] = 16'hb6d0;
      expv[30] = 16'h04d8;
      expv[31] = 16'h04b4;
      expv[32] = 16'h8a9d;
      expv[33] = 16'h707e;
      expv[34] = 16'h7a8f;
      expv[35] = 16'h215c;
      expv[36] = 16'h3741;
      expv[37] = 16'h0b8e;
      expv[38] = 16'h3f00;
      expv[39] = 16'h12b1;
      expv[40] = 16'h4f9f;
      expv[41] = 16'h0c58;
      expv[42] = 16'h3b80;
      expv[43] = 16'h0192;
      expv[44] = 16'h82d8;
      expv[45] = 16'h00e2;
      expv[46] = 16'h3b7c;
      expv[47] = 16'h6970;
      expv[48] = 16'h0207;
      expv[49] = 16'h7ae8;
      expv[50] = 16'h8ebc;
      expv[51] = 16'h4ce0;
      expv[52] = 16'h1bee;
      expv[53] = 16'h3570;
      expv[54] = 16'h33a8;
      expv[55] = 16'h67e4;
      expv[56] = 16'h0990;
      expv[57] = 16'h2058;
      expv[58] = 16'h7533;
      expv[59] = 16'h0054;
      expv[60] = 16'h2247;
      expv[61] = 16'h9c63;
      expv[62] = 16'h0090;
      expv[63] = 16'h0d9e;
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
