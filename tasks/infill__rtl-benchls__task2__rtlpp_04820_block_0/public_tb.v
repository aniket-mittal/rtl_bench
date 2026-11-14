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

  rtlpp_04820 dut (
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
    stim[0] = 17'h041a5;
    stim[1] = 17'h14874;
    stim[2] = 17'h12010;
    stim[3] = 17'h191ef;
    stim[4] = 17'h1452c;
    stim[5] = 17'h1bae6;
    stim[6] = 17'h04102;
    stim[7] = 17'h19b1d;
    stim[8] = 17'h05cb1;
    stim[9] = 17'h095c8;
    stim[10] = 17'h1455e;
    stim[11] = 17'h060cc;
    stim[12] = 17'h0d24b;
    stim[13] = 17'h10dcb;
    stim[14] = 17'h0c1b1;
    stim[15] = 17'h06fe2;
    stim[16] = 17'h1e14e;
    stim[17] = 17'h1ee6c;
    stim[18] = 17'h0d321;
    stim[19] = 17'h0f3fd;
    stim[20] = 17'h139f7;
    stim[21] = 17'h1d9db;
    stim[22] = 17'h1cfda;
    stim[23] = 17'h1cd74;
    stim[24] = 17'h0eff9;
    stim[25] = 17'h051d5;
    stim[26] = 17'h0d0da;
    stim[27] = 17'h05248;
    stim[28] = 17'h0513b;
    stim[29] = 17'h147e2;
    stim[30] = 17'h0486e;
    stim[31] = 17'h030a1;
    stim[32] = 17'h08b15;
    stim[33] = 17'h123e0;
    stim[34] = 17'h0a676;
    stim[35] = 17'h1658f;
    stim[36] = 17'h038a3;
    stim[37] = 17'h0abc5;
    stim[38] = 17'h1c855;
    stim[39] = 17'h0d146;
    stim[40] = 17'h15f1a;
    stim[41] = 17'h08e18;
    stim[42] = 17'h0bf2b;
    stim[43] = 17'h044d9;
    stim[44] = 17'h0f506;
    stim[45] = 17'h1636c;
    stim[46] = 17'h14ad0;
    stim[47] = 17'h093c8;
    stim[48] = 17'h03152;
    stim[49] = 17'h1c08a;
    stim[50] = 17'h02ade;
    stim[51] = 17'h1473f;
    stim[52] = 17'h05178;
    stim[53] = 17'h0f1ec;
    stim[54] = 17'h11aef;
    stim[55] = 17'h118d6;
    stim[56] = 17'h06ab7;
    stim[57] = 17'h1d27c;
    stim[58] = 17'h03dac;
    stim[59] = 17'h1076a;
    stim[60] = 17'h02245;
    stim[61] = 17'h0d50d;
    stim[62] = 17'h0a911;
    stim[63] = 17'h1a52c;
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
      expv[8] = 8'he6;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'h10;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'h4e;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'h1d;
      expv[22] = 8'h1d;
      expv[23] = 8'hxx;
      expv[24] = 8'hdb;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hcb;
      expv[28] = 8'h10;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hcb;
      expv[33] = 8'he6;
      expv[34] = 8'hf7;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hxx;
      expv[38] = 8'he6;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'hxx;
      expv[42] = 8'h6c;
      expv[43] = 8'hxx;
      expv[44] = 8'he2;
      expv[45] = 8'h1a;
      expv[46] = 8'hf7;
      expv[47] = 8'hxx;
      expv[48] = 8'hf7;
      expv[49] = 8'hxx;
      expv[50] = 8'hcb;
      expv[51] = 8'hxx;
      expv[52] = 8'hxx;
      expv[53] = 8'hxx;
      expv[54] = 8'hxx;
      expv[55] = 8'hxx;
      expv[56] = 8'hxx;
      expv[57] = 8'hxx;
      expv[58] = 8'he0;
      expv[59] = 8'h7c;
      expv[60] = 8'hxx;
      expv[61] = 8'he0;
      expv[62] = 8'h1a;
      expv[63] = 8'h1d;
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
