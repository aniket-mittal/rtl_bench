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

  permute dut (
    .in(in_vec[31:0]),
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
    stim[0] = 32'h600e13f1;
    stim[1] = 32'h2613f04c;
    stim[2] = 32'h7e92ebcd;
    stim[3] = 32'h1e0e029d;
    stim[4] = 32'h1d3ea57e;
    stim[5] = 32'hfe063993;
    stim[6] = 32'hbb7690ac;
    stim[7] = 32'h806770ac;
    stim[8] = 32'hbd2c379b;
    stim[9] = 32'hf94ad4d6;
    stim[10] = 32'h6caa9a7f;
    stim[11] = 32'h6593d5dc;
    stim[12] = 32'h8e6782a4;
    stim[13] = 32'hd268b950;
    stim[14] = 32'hab046a73;
    stim[15] = 32'h4bf2155d;
    stim[16] = 32'h84798299;
    stim[17] = 32'hb518759c;
    stim[18] = 32'h0e343cdf;
    stim[19] = 32'h3b94871e;
    stim[20] = 32'hce60beb8;
    stim[21] = 32'h0b34ed6c;
    stim[22] = 32'ha8c12bd3;
    stim[23] = 32'he72469e0;
    stim[24] = 32'h9e3b29e9;
    stim[25] = 32'hd811d797;
    stim[26] = 32'h59a48c59;
    stim[27] = 32'h77f495d2;
    stim[28] = 32'h2eb00b56;
    stim[29] = 32'h48d7b1ea;
    stim[30] = 32'hdb148f76;
    stim[31] = 32'hba8c86df;
    stim[32] = 32'h64b171d2;
    stim[33] = 32'h3660d8d6;
    stim[34] = 32'hefc2f396;
    stim[35] = 32'h405ca058;
    stim[36] = 32'hdf8c7b87;
    stim[37] = 32'hc5626f03;
    stim[38] = 32'h6e739173;
    stim[39] = 32'h6920b2a2;
    stim[40] = 32'h41c2495f;
    stim[41] = 32'he04e0f25;
    stim[42] = 32'h7f8cede9;
    stim[43] = 32'h5e1e664a;
    stim[44] = 32'he99c5bc1;
    stim[45] = 32'h14497a3e;
    stim[46] = 32'h5b2612ac;
    stim[47] = 32'h27ec1b58;
    stim[48] = 32'h42a59d7f;
    stim[49] = 32'h3c54d799;
    stim[50] = 32'h48ea6d1b;
    stim[51] = 32'hd115b531;
    stim[52] = 32'h2f873c6a;
    stim[53] = 32'h6ad07363;
    stim[54] = 32'hbbff8645;
    stim[55] = 32'hf2c37afb;
    stim[56] = 32'h6a0accfa;
    stim[57] = 32'h01a44187;
    stim[58] = 32'h64abe977;
    stim[59] = 32'h76dd910b;
    stim[60] = 32'h709e4384;
    stim[61] = 32'h4c9a48e6;
    stim[62] = 32'hdd3b6e99;
    stim[63] = 32'hc7a0dc8d;
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
      expv[0] = 32'h2270be41;
      expv[1] = 32'hed5402b0;
      expv[2] = 32'h5d7cabb3;
      expv[3] = 32'h4a681873;
      expv[4] = 32'h0f5a74fe;
      expv[5] = 32'h72caba93;
      expv[6] = 32'h6dc95627;
      expv[7] = 32'ha8c514a5;
      expv[8] = 32'h2aaa7adf;
      expv[9] = 32'h23dfc26b;
      expv[10] = 32'h3b7a8f74;
      expv[11] = 32'haf54e339;
      expv[12] = 32'hc1e91435;
      expv[13] = 32'h7391a0c6;
      expv[14] = 32'h52be5e80;
      expv[15] = 32'h6e59e92c;
      expv[16] = 32'h8fa10855;
      expv[17] = 32'h2e8462fb;
      expv[18] = 32'h7e1a18bd;
      expv[19] = 32'h4f2a732a;
      expv[20] = 32'h7ba9849d;
      expv[21] = 32'h5d1c74ac;
      expv[22] = 32'h92bb2b81;
      expv[23] = 32'h5094f695;
      expv[24] = 32'hdcd82cd7;
      expv[25] = 32'ha7aea82b;
      expv[26] = 32'h1b18d90e;
      expv[27] = 32'h6713f31f;
      expv[28] = 32'h563a2334;
      expv[29] = 32'had5bb581;
      expv[30] = 32'h57baf42a;
      expv[31] = 32'h4bba1b6b;
      expv[32] = 32'ha616a395;
      expv[33] = 32'h73170237;
      expv[34] = 32'h63efe3b1;
      expv[35] = 32'h0f1190c0;
      expv[36] = 32'h70aef9f3;
      expv[37] = 32'h10e7e89c;
      expv[38] = 32'he75bae14;
      expv[39] = 32'h212ac685;
      expv[40] = 32'h1a57e920;
      expv[41] = 32'h10e1be68;
      expv[42] = 32'h591cffdb;
      expv[43] = 32'h4c7e90da;
      expv[44] = 32'h34bcfb41;
      expv[45] = 32'hba2704f2;
      expv[46] = 32'h6868d427;
      expv[47] = 32'h7a317354;
      expv[48] = 32'hfb12bd2c;
      expv[49] = 32'h2f2d3a1b;
      expv[50] = 32'h1a4fa9cc;
      expv[51] = 32'ha780fc8a;
      expv[52] = 32'hf85a5798;
      expv[53] = 32'h643faf80;
      expv[54] = 32'hc5f95b6e;
      expv[55] = 32'hfaf78f83;
      expv[56] = 32'h5b5e8649;
      expv[57] = 32'h00067925;
      expv[58] = 32'h9356aff4;
      expv[59] = 32'hed03bb52;
      expv[60] = 32'h0464b363;
      expv[61] = 32'h145e8571;
      expv[62] = 32'h9eecc8df;
      expv[63] = 32'h7984c93d;
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
