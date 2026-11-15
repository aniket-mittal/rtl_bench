// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  DataWidthConvert dut (
    .i(in_vec[31:0]),
    .o(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h777bb041;
    stim[1] = 32'hf959c5cf;
    stim[2] = 32'hcbb7dd3c;
    stim[3] = 32'hcf2862e2;
    stim[4] = 32'h5016e915;
    stim[5] = 32'h51262a78;
    stim[6] = 32'h5acdb4ce;
    stim[7] = 32'h5051ea94;
    stim[8] = 32'hf90a2996;
    stim[9] = 32'h3cd310e5;
    stim[10] = 32'h6bea50db;
    stim[11] = 32'hdf5ad87a;
    stim[12] = 32'hb1e0f069;
    stim[13] = 32'hd1934cb6;
    stim[14] = 32'h05409ede;
    stim[15] = 32'he9e8159a;
    stim[16] = 32'h6225a501;
    stim[17] = 32'h30cde3ae;
    stim[18] = 32'h279be26c;
    stim[19] = 32'hbb679092;
    stim[20] = 32'h85c32d42;
    stim[21] = 32'hf8236814;
    stim[22] = 32'h22fe8aa2;
    stim[23] = 32'h23a713df;
    stim[24] = 32'hd64c1a35;
    stim[25] = 32'h81db1c4b;
    stim[26] = 32'hc070945b;
    stim[27] = 32'h6937aa88;
    stim[28] = 32'hd2f67d3c;
    stim[29] = 32'h47dd5d38;
    stim[30] = 32'hdcb32111;
    stim[31] = 32'h489d6800;
    stim[32] = 32'hded8d87a;
    stim[33] = 32'h3aae9222;
    stim[34] = 32'hc5e3be00;
    stim[35] = 32'h49b41870;
    stim[36] = 32'h6dc300cd;
    stim[37] = 32'hd62fc7e7;
    stim[38] = 32'h7e5d1851;
    stim[39] = 32'h1bff68ca;
    stim[40] = 32'hcf2add81;
    stim[41] = 32'h1a245518;
    stim[42] = 32'hbb983913;
    stim[43] = 32'hf267d225;
    stim[44] = 32'had3ae80e;
    stim[45] = 32'h56070221;
    stim[46] = 32'hb12e5143;
    stim[47] = 32'h2485b3b1;
    stim[48] = 32'h9f29e6a7;
    stim[49] = 32'h9bce57d1;
    stim[50] = 32'h656bd38c;
    stim[51] = 32'hdd221574;
    stim[52] = 32'h715f09c4;
    stim[53] = 32'hb69070b1;
    stim[54] = 32'he7315312;
    stim[55] = 32'h64462b7a;
    stim[56] = 32'hbe35a96d;
    stim[57] = 32'hff75700e;
    stim[58] = 32'hedae3640;
    stim[59] = 32'h5255d4b1;
    stim[60] = 32'h87c17113;
    stim[61] = 32'h9c034a03;
    stim[62] = 32'hddeda3d6;
    stim[63] = 32'h71e3ac93;
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
      expv[0] = 4'h1;
      expv[1] = 4'hf;
      expv[2] = 4'hc;
      expv[3] = 4'h2;
      expv[4] = 4'h5;
      expv[5] = 4'h8;
      expv[6] = 4'he;
      expv[7] = 4'h4;
      expv[8] = 4'h6;
      expv[9] = 4'h5;
      expv[10] = 4'hb;
      expv[11] = 4'ha;
      expv[12] = 4'h9;
      expv[13] = 4'h6;
      expv[14] = 4'he;
      expv[15] = 4'ha;
      expv[16] = 4'h1;
      expv[17] = 4'he;
      expv[18] = 4'hc;
      expv[19] = 4'h2;
      expv[20] = 4'h2;
      expv[21] = 4'h4;
      expv[22] = 4'h2;
      expv[23] = 4'hf;
      expv[24] = 4'h5;
      expv[25] = 4'hb;
      expv[26] = 4'hb;
      expv[27] = 4'h8;
      expv[28] = 4'hc;
      expv[29] = 4'h8;
      expv[30] = 4'h1;
      expv[31] = 4'h0;
      expv[32] = 4'ha;
      expv[33] = 4'h2;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'hd;
      expv[37] = 4'h7;
      expv[38] = 4'h1;
      expv[39] = 4'ha;
      expv[40] = 4'h1;
      expv[41] = 4'h8;
      expv[42] = 4'h3;
      expv[43] = 4'h5;
      expv[44] = 4'he;
      expv[45] = 4'h1;
      expv[46] = 4'h3;
      expv[47] = 4'h1;
      expv[48] = 4'h7;
      expv[49] = 4'h1;
      expv[50] = 4'hc;
      expv[51] = 4'h4;
      expv[52] = 4'h4;
      expv[53] = 4'h1;
      expv[54] = 4'h2;
      expv[55] = 4'ha;
      expv[56] = 4'hd;
      expv[57] = 4'he;
      expv[58] = 4'h0;
      expv[59] = 4'h1;
      expv[60] = 4'h3;
      expv[61] = 4'h3;
      expv[62] = 4'h6;
      expv[63] = 4'h3;
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
