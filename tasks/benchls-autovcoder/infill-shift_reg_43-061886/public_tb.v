// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061886 dut (
    .clock(clk),
    .io_d(in_vec[42:0]),
    .io_q(out_vec[42:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h5fca5f25c90;
    stim[1] = 43'h5508f3be6c2;
    stim[2] = 43'h541b7e1ad57;
    stim[3] = 43'h14a0e6f889e;
    stim[4] = 43'h117c001848c;
    stim[5] = 43'h621edd21d1b;
    stim[6] = 43'h74acac71416;
    stim[7] = 43'h3a8a2318fe0;
    stim[8] = 43'h50cf67a1f09;
    stim[9] = 43'h798f9fb05de;
    stim[10] = 43'h1bd924e1a91;
    stim[11] = 43'h57e5c40fd4d;
    stim[12] = 43'h6939fb3eeec;
    stim[13] = 43'h268b77548aa;
    stim[14] = 43'h6965201a025;
    stim[15] = 43'h57477038e14;
    stim[16] = 43'h79dc00ed5a3;
    stim[17] = 43'h17edb8513fd;
    stim[18] = 43'h53598f48b4e;
    stim[19] = 43'h585a72e1551;
    stim[20] = 43'h13e59a8f5c2;
    stim[21] = 43'h00b073929f1;
    stim[22] = 43'h3c9c48bfbe8;
    stim[23] = 43'h7375986d03c;
    stim[24] = 43'h4d33f9893b2;
    stim[25] = 43'h5fa1dc1a764;
    stim[26] = 43'h09e219b93d4;
    stim[27] = 43'h68e97fcd2e9;
    stim[28] = 43'h3198d1f522c;
    stim[29] = 43'h0a16ab498f3;
    stim[30] = 43'h5efa9e0ad85;
    stim[31] = 43'h649e6c92bde;
    stim[32] = 43'h213fdf01853;
    stim[33] = 43'h544642158a3;
    stim[34] = 43'h40ede26815d;
    stim[35] = 43'h16879ec0651;
    stim[36] = 43'h11e2f9ceada;
    stim[37] = 43'h6499805592a;
    stim[38] = 43'h35d7999c8d6;
    stim[39] = 43'h28554906a95;
    stim[40] = 43'h47265a7616b;
    stim[41] = 43'h6bc78f8c9a1;
    stim[42] = 43'h2fc6f1989ae;
    stim[43] = 43'h5daff071be1;
    stim[44] = 43'h44888dc82f4;
    stim[45] = 43'h6f75286fd89;
    stim[46] = 43'h20ce9de5484;
    stim[47] = 43'h4ab37680f40;
    stim[48] = 43'h45815501293;
    stim[49] = 43'h3d0ff4a8c3e;
    stim[50] = 43'h4ea9860e70e;
    stim[51] = 43'h6285615d35d;
    stim[52] = 43'h07ba3aa2adb;
    stim[53] = 43'h0e67a6cddec;
    stim[54] = 43'h6c0d68d9cf6;
    stim[55] = 43'h04d4ee768d4;
    stim[56] = 43'h0cfaa5c88bd;
    stim[57] = 43'h2438a711031;
    stim[58] = 43'h58cd8177f47;
    stim[59] = 43'h11efdbc4573;
    stim[60] = 43'h15d8658afcc;
    stim[61] = 43'h3adf31370e8;
    stim[62] = 43'h3f020ebce2f;
    stim[63] = 43'h0efb1c4615b;
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
      expv[0] = 43'hxxxxxxxxxxx;
      expv[1] = 43'h5fca5f25c90;
      expv[2] = 43'h5508f3be6c2;
      expv[3] = 43'h541b7e1ad57;
      expv[4] = 43'h14a0e6f889e;
      expv[5] = 43'h117c001848c;
      expv[6] = 43'h621edd21d1b;
      expv[7] = 43'h74acac71416;
      expv[8] = 43'h3a8a2318fe0;
      expv[9] = 43'h50cf67a1f09;
      expv[10] = 43'h798f9fb05de;
      expv[11] = 43'h1bd924e1a91;
      expv[12] = 43'h57e5c40fd4d;
      expv[13] = 43'h6939fb3eeec;
      expv[14] = 43'h268b77548aa;
      expv[15] = 43'h6965201a025;
      expv[16] = 43'h57477038e14;
      expv[17] = 43'h79dc00ed5a3;
      expv[18] = 43'h17edb8513fd;
      expv[19] = 43'h53598f48b4e;
      expv[20] = 43'h585a72e1551;
      expv[21] = 43'h13e59a8f5c2;
      expv[22] = 43'h00b073929f1;
      expv[23] = 43'h3c9c48bfbe8;
      expv[24] = 43'h7375986d03c;
      expv[25] = 43'h4d33f9893b2;
      expv[26] = 43'h5fa1dc1a764;
      expv[27] = 43'h09e219b93d4;
      expv[28] = 43'h68e97fcd2e9;
      expv[29] = 43'h3198d1f522c;
      expv[30] = 43'h0a16ab498f3;
      expv[31] = 43'h5efa9e0ad85;
      expv[32] = 43'h649e6c92bde;
      expv[33] = 43'h213fdf01853;
      expv[34] = 43'h544642158a3;
      expv[35] = 43'h40ede26815d;
      expv[36] = 43'h16879ec0651;
      expv[37] = 43'h11e2f9ceada;
      expv[38] = 43'h6499805592a;
      expv[39] = 43'h35d7999c8d6;
      expv[40] = 43'h28554906a95;
      expv[41] = 43'h47265a7616b;
      expv[42] = 43'h6bc78f8c9a1;
      expv[43] = 43'h2fc6f1989ae;
      expv[44] = 43'h5daff071be1;
      expv[45] = 43'h44888dc82f4;
      expv[46] = 43'h6f75286fd89;
      expv[47] = 43'h20ce9de5484;
      expv[48] = 43'h4ab37680f40;
      expv[49] = 43'h45815501293;
      expv[50] = 43'h3d0ff4a8c3e;
      expv[51] = 43'h4ea9860e70e;
      expv[52] = 43'h6285615d35d;
      expv[53] = 43'h07ba3aa2adb;
      expv[54] = 43'h0e67a6cddec;
      expv[55] = 43'h6c0d68d9cf6;
      expv[56] = 43'h04d4ee768d4;
      expv[57] = 43'h0cfaa5c88bd;
      expv[58] = 43'h2438a711031;
      expv[59] = 43'h58cd8177f47;
      expv[60] = 43'h11efdbc4573;
      expv[61] = 43'h15d8658afcc;
      expv[62] = 43'h3adf31370e8;
      expv[63] = 43'h3f020ebce2f;
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
