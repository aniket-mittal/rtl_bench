// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  oks8_ior dut (
    .a_i(in_vec[15:8]),
    .b_i(in_vec[7:0]),
    .c_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h71a0;
    stim[1] = 16'hc604;
    stim[2] = 16'h0ccd;
    stim[3] = 16'hb3a4;
    stim[4] = 16'he3bf;
    stim[5] = 16'h1c54;
    stim[6] = 16'h0f28;
    stim[7] = 16'h6467;
    stim[8] = 16'hfa43;
    stim[9] = 16'h305f;
    stim[10] = 16'had52;
    stim[11] = 16'h3390;
    stim[12] = 16'h7e14;
    stim[13] = 16'hb6b7;
    stim[14] = 16'hb90e;
    stim[15] = 16'h858e;
    stim[16] = 16'h3de7;
    stim[17] = 16'h6c1f;
    stim[18] = 16'h1613;
    stim[19] = 16'hffb4;
    stim[20] = 16'he671;
    stim[21] = 16'h1262;
    stim[22] = 16'ha6b5;
    stim[23] = 16'h05be;
    stim[24] = 16'hc30a;
    stim[25] = 16'h854b;
    stim[26] = 16'hf69f;
    stim[27] = 16'h24f0;
    stim[28] = 16'hd5dc;
    stim[29] = 16'h3cf4;
    stim[30] = 16'h95d9;
    stim[31] = 16'h7892;
    stim[32] = 16'hd5fa;
    stim[33] = 16'h704e;
    stim[34] = 16'h247f;
    stim[35] = 16'h103b;
    stim[36] = 16'h4753;
    stim[37] = 16'ha61d;
    stim[38] = 16'h577b;
    stim[39] = 16'h018e;
    stim[40] = 16'hde92;
    stim[41] = 16'hc380;
    stim[42] = 16'h3556;
    stim[43] = 16'h3f51;
    stim[44] = 16'h1807;
    stim[45] = 16'hc77c;
    stim[46] = 16'h1098;
    stim[47] = 16'hc1e2;
    stim[48] = 16'hf6c4;
    stim[49] = 16'hc930;
    stim[50] = 16'hdedc;
    stim[51] = 16'h7ac8;
    stim[52] = 16'h1cf8;
    stim[53] = 16'h3d68;
    stim[54] = 16'hcab2;
    stim[55] = 16'h9f40;
    stim[56] = 16'hae2c;
    stim[57] = 16'h700f;
    stim[58] = 16'he336;
    stim[59] = 16'h230f;
    stim[60] = 16'h1db7;
    stim[61] = 16'h3d2b;
    stim[62] = 16'h0dbe;
    stim[63] = 16'h7396;
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
      expv[0] = 8'hf1;
      expv[1] = 8'hc6;
      expv[2] = 8'hcd;
      expv[3] = 8'hb7;
      expv[4] = 8'hff;
      expv[5] = 8'h5c;
      expv[6] = 8'h2f;
      expv[7] = 8'h67;
      expv[8] = 8'hfb;
      expv[9] = 8'h7f;
      expv[10] = 8'hff;
      expv[11] = 8'hb3;
      expv[12] = 8'h7e;
      expv[13] = 8'hb7;
      expv[14] = 8'hbf;
      expv[15] = 8'h8f;
      expv[16] = 8'hff;
      expv[17] = 8'h7f;
      expv[18] = 8'h17;
      expv[19] = 8'hff;
      expv[20] = 8'hf7;
      expv[21] = 8'h72;
      expv[22] = 8'hb7;
      expv[23] = 8'hbf;
      expv[24] = 8'hcb;
      expv[25] = 8'hcf;
      expv[26] = 8'hff;
      expv[27] = 8'hf4;
      expv[28] = 8'hdd;
      expv[29] = 8'hfc;
      expv[30] = 8'hdd;
      expv[31] = 8'hfa;
      expv[32] = 8'hff;
      expv[33] = 8'h7e;
      expv[34] = 8'h7f;
      expv[35] = 8'h3b;
      expv[36] = 8'h57;
      expv[37] = 8'hbf;
      expv[38] = 8'h7f;
      expv[39] = 8'h8f;
      expv[40] = 8'hde;
      expv[41] = 8'hc3;
      expv[42] = 8'h77;
      expv[43] = 8'h7f;
      expv[44] = 8'h1f;
      expv[45] = 8'hff;
      expv[46] = 8'h98;
      expv[47] = 8'he3;
      expv[48] = 8'hf6;
      expv[49] = 8'hf9;
      expv[50] = 8'hde;
      expv[51] = 8'hfa;
      expv[52] = 8'hfc;
      expv[53] = 8'h7d;
      expv[54] = 8'hfa;
      expv[55] = 8'hdf;
      expv[56] = 8'hae;
      expv[57] = 8'h7f;
      expv[58] = 8'hf7;
      expv[59] = 8'h2f;
      expv[60] = 8'hbf;
      expv[61] = 8'h3f;
      expv[62] = 8'hbf;
      expv[63] = 8'hf7;
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
