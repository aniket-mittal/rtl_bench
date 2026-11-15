// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04831 dut (
    .clk(clk),
    .we(in_vec[16:16]),
    .a(in_vec[15:12]),
    .dpra(in_vec[11:8]),
    .di(in_vec[7:0]),
    .dpo(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h093c2;
    stim[1] = 17'h04e54;
    stim[2] = 17'h00c0d;
    stim[3] = 17'h044b1;
    stim[4] = 17'h0227b;
    stim[5] = 17'h1936f;
    stim[6] = 17'h0a4a1;
    stim[7] = 17'h14b2a;
    stim[8] = 17'h1e487;
    stim[9] = 17'h1232f;
    stim[10] = 17'h08195;
    stim[11] = 17'h101bb;
    stim[12] = 17'h01ad2;
    stim[13] = 17'h136c2;
    stim[14] = 17'h0652e;
    stim[15] = 17'h08e99;
    stim[16] = 17'h110f5;
    stim[17] = 17'h00378;
    stim[18] = 17'h06917;
    stim[19] = 17'h19abd;
    stim[20] = 17'h0de42;
    stim[21] = 17'h04db4;
    stim[22] = 17'h0bc8e;
    stim[23] = 17'h0fe5a;
    stim[24] = 17'h049ed;
    stim[25] = 17'h0641b;
    stim[26] = 17'h125cf;
    stim[27] = 17'h05370;
    stim[28] = 17'h1edd4;
    stim[29] = 17'h0e3f4;
    stim[30] = 17'h11113;
    stim[31] = 17'h01ccc;
    stim[32] = 17'h1f213;
    stim[33] = 17'h0cf7c;
    stim[34] = 17'h1dd2d;
    stim[35] = 17'h00d17;
    stim[36] = 17'h08c0d;
    stim[37] = 17'h05928;
    stim[38] = 17'h1cca5;
    stim[39] = 17'h14beb;
    stim[40] = 17'h16034;
    stim[41] = 17'h16ef4;
    stim[42] = 17'h15b20;
    stim[43] = 17'h04cfb;
    stim[44] = 17'h182f6;
    stim[45] = 17'h0cb29;
    stim[46] = 17'h0de01;
    stim[47] = 17'h16b4d;
    stim[48] = 17'h02f4e;
    stim[49] = 17'h0688d;
    stim[50] = 17'h10c58;
    stim[51] = 17'h1b0cf;
    stim[52] = 17'h059e8;
    stim[53] = 17'h1dc5f;
    stim[54] = 17'h18c1e;
    stim[55] = 17'h10b25;
    stim[56] = 17'h16323;
    stim[57] = 17'h076d4;
    stim[58] = 17'h099b7;
    stim[59] = 17'h1df1c;
    stim[60] = 17'h0d506;
    stim[61] = 17'h031ca;
    stim[62] = 17'h1d115;
    stim[63] = 17'h1e829;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'h2a;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'h87;
      expv[17] = 8'hbb;
      expv[18] = 8'hc2;
      expv[19] = 8'h6f;
      expv[20] = 8'hxx;
      expv[21] = 8'h87;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'h87;
      expv[25] = 8'hbd;
      expv[26] = 8'h2a;
      expv[27] = 8'hxx;
      expv[28] = 8'hc2;
      expv[29] = 8'hxx;
      expv[30] = 8'hc2;
      expv[31] = 8'hf5;
      expv[32] = 8'hxx;
      expv[33] = 8'hcf;
      expv[34] = 8'h13;
      expv[35] = 8'hxx;
      expv[36] = 8'h2d;
      expv[37] = 8'hxx;
      expv[38] = 8'hbd;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'hbb;
      expv[42] = 8'hd4;
      expv[43] = 8'hxx;
      expv[44] = 8'ha5;
      expv[45] = 8'hcf;
      expv[46] = 8'hxx;
      expv[47] = 8'hd4;
      expv[48] = 8'hxx;
      expv[49] = 8'h13;
      expv[50] = 8'hf6;
      expv[51] = 8'ha5;
      expv[52] = 8'h58;
      expv[53] = 8'hbd;
      expv[54] = 8'ha5;
      expv[55] = 8'ha5;
      expv[56] = 8'hcf;
      expv[57] = 8'hc2;
      expv[58] = 8'h23;
      expv[59] = 8'hbd;
      expv[60] = 8'h13;
      expv[61] = 8'h20;
      expv[62] = 8'h13;
      expv[63] = 8'h13;
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
