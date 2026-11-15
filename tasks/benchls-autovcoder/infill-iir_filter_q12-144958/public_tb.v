// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_144958 dut (
    .clk(clk),
    .reset(in_vec[16:16]),
    .x_in(in_vec[15:0]),
    .y_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1a5b5;
    stim[1] = 17'h165eb;
    stim[2] = 17'h0d0d8;
    stim[3] = 17'h04d3d;
    stim[4] = 17'h0c5e4;
    stim[5] = 17'h0ec02;
    stim[6] = 17'h0a6d0;
    stim[7] = 17'h0296a;
    stim[8] = 17'h0aaa3;
    stim[9] = 17'h063b2;
    stim[10] = 17'h03efb;
    stim[11] = 17'h023c2;
    stim[12] = 17'h0d783;
    stim[13] = 17'h0567c;
    stim[14] = 17'h09156;
    stim[15] = 17'h092ea;
    stim[16] = 17'h0f711;
    stim[17] = 17'h0a42f;
    stim[18] = 17'h0da85;
    stim[19] = 17'h035ef;
    stim[20] = 17'h0480e;
    stim[21] = 17'h011aa;
    stim[22] = 17'h0df3d;
    stim[23] = 17'h02cf7;
    stim[24] = 17'h05a9c;
    stim[25] = 17'h01c65;
    stim[26] = 17'h0a63e;
    stim[27] = 17'h05867;
    stim[28] = 17'h096ec;
    stim[29] = 17'h0a77b;
    stim[30] = 17'h0f70a;
    stim[31] = 17'h0ec1c;
    stim[32] = 17'h034c3;
    stim[33] = 17'h07c73;
    stim[34] = 17'h06167;
    stim[35] = 17'h014b9;
    stim[36] = 17'h02678;
    stim[37] = 17'h08773;
    stim[38] = 17'h041ac;
    stim[39] = 17'h0054c;
    stim[40] = 17'h0db4e;
    stim[41] = 17'h0a95b;
    stim[42] = 17'h1141c;
    stim[43] = 17'h003f4;
    stim[44] = 17'h00ef0;
    stim[45] = 17'h0d89f;
    stim[46] = 17'h08164;
    stim[47] = 17'h01dce;
    stim[48] = 17'h012c0;
    stim[49] = 17'h0d6fc;
    stim[50] = 17'h03ad1;
    stim[51] = 17'h0a477;
    stim[52] = 17'h047bd;
    stim[53] = 17'h08447;
    stim[54] = 17'h03bed;
    stim[55] = 17'h05a76;
    stim[56] = 17'h0a905;
    stim[57] = 17'h01adf;
    stim[58] = 17'h0a110;
    stim[59] = 17'h0f4ce;
    stim[60] = 17'h054d9;
    stim[61] = 17'h04f11;
    stim[62] = 17'h09c78;
    stim[63] = 17'h053a2;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0007;
      expv[6] = 16'h0000;
      expv[7] = 16'h0007;
      expv[8] = 16'h0006;
      expv[9] = 16'hfffb;
      expv[10] = 16'hfffa;
      expv[11] = 16'hfff8;
      expv[12] = 16'hffff;
      expv[13] = 16'hfffd;
      expv[14] = 16'h0005;
      expv[15] = 16'h0001;
      expv[16] = 16'h0003;
      expv[17] = 16'hfffa;
      expv[18] = 16'h0005;
      expv[19] = 16'h0003;
      expv[20] = 16'h0000;
      expv[21] = 16'hfff8;
      expv[22] = 16'h0002;
      expv[23] = 16'hfffb;
      expv[24] = 16'h0005;
      expv[25] = 16'h0004;
      expv[26] = 16'h0004;
      expv[27] = 16'h0004;
      expv[28] = 16'hfff9;
      expv[29] = 16'hfff9;
      expv[30] = 16'h0001;
      expv[31] = 16'h0006;
      expv[32] = 16'hfff8;
      expv[33] = 16'hffff;
      expv[34] = 16'hfffd;
      expv[35] = 16'h0002;
      expv[36] = 16'h0006;
      expv[37] = 16'h0001;
      expv[38] = 16'h0007;
      expv[39] = 16'hfffb;
      expv[40] = 16'h0007;
      expv[41] = 16'hfffc;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'hfff8;
      expv[47] = 16'h0001;
      expv[48] = 16'h0007;
      expv[49] = 16'h0002;
      expv[50] = 16'hffff;
      expv[51] = 16'hfff8;
      expv[52] = 16'h0005;
      expv[53] = 16'h0007;
      expv[54] = 16'hfff8;
      expv[55] = 16'hffff;
      expv[56] = 16'h0005;
      expv[57] = 16'h0004;
      expv[58] = 16'hfffa;
      expv[59] = 16'hfffe;
      expv[60] = 16'h0002;
      expv[61] = 16'hfffa;
      expv[62] = 16'hffff;
      expv[63] = 16'h0007;
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
