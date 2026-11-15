// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08596 dut (
    .clk(clk),
    .rst_n(in_vec[47:47]),
    .read_a_enable(in_vec[46:46]),
    .read_a_select(in_vec[45:42]),
    .read_b_enable(in_vec[41:41]),
    .read_b_select(in_vec[40:37]),
    .write_enable(in_vec[36:36]),
    .write_select(in_vec[35:32]),
    .write_value(in_vec[31:0]),
    .read_a_value(out_vec[63:32]),
    .read_b_value(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'h12678ebd8d67;
    stim[1] = 48'h150ad980e58e;
    stim[2] = 48'hec5c3f77d319;
    stim[3] = 48'h8c5a848e035d;
    stim[4] = 48'h8e9ec99a24b8;
    stim[5] = 48'h81538e76df58;
    stim[6] = 48'hab29ab7699ca;
    stim[7] = 48'h20055ce6f32b;
    stim[8] = 48'hfcc23f5a8755;
    stim[9] = 48'ha8cfb7a67cda;
    stim[10] = 48'h82d182f9a543;
    stim[11] = 48'hed26a648a0f7;
    stim[12] = 48'hf7de29145460;
    stim[13] = 48'hf8b831a1ca10;
    stim[14] = 48'hc6a0f360067d;
    stim[15] = 48'hb7adb3076fd2;
    stim[16] = 48'hb4c7413fe28b;
    stim[17] = 48'hb3f73c9704df;
    stim[18] = 48'hceccac30bf09;
    stim[19] = 48'h9902d6054455;
    stim[20] = 48'hf41637c142fc;
    stim[21] = 48'hd79c1e8bb2b2;
    stim[22] = 48'hc6ffb5baefb9;
    stim[23] = 48'ha784fc8cb410;
    stim[24] = 48'h87b027f7e0e4;
    stim[25] = 48'haecfdf678cae;
    stim[26] = 48'he0fffafa374c;
    stim[27] = 48'ha619002487b6;
    stim[28] = 48'ha3e09b228a53;
    stim[29] = 48'hf4e86333f629;
    stim[30] = 48'h83560322d9c8;
    stim[31] = 48'h9675fcc16f54;
    stim[32] = 48'hf5536cf02af3;
    stim[33] = 48'h004e8b8eae58;
    stim[34] = 48'h9a04cfe01269;
    stim[35] = 48'hb094a0a0d16d;
    stim[36] = 48'ha6bbd4fbb083;
    stim[37] = 48'hd477e85f59b3;
    stim[38] = 48'h8e11dd097134;
    stim[39] = 48'he36a27e04d3e;
    stim[40] = 48'hae8e3f40cce3;
    stim[41] = 48'hf6052f3f5a88;
    stim[42] = 48'hbe6c2b858606;
    stim[43] = 48'hd30b1a9d8787;
    stim[44] = 48'hd20a59ae882c;
    stim[45] = 48'hf9282c23876a;
    stim[46] = 48'h81e5b1404874;
    stim[47] = 48'h924ce3c553b0;
    stim[48] = 48'hc2dcb576846c;
    stim[49] = 48'hb1e8b6cdf968;
    stim[50] = 48'hb5f5d3c8ed3d;
    stim[51] = 48'hd79b9b8c4e34;
    stim[52] = 48'ha561e00b3cda;
    stim[53] = 48'ha8021a1cf013;
    stim[54] = 48'h966da77e9598;
    stim[55] = 48'h8f79c8c5643f;
    stim[56] = 48'h8d72c66223e6;
    stim[57] = 48'hb640631e4962;
    stim[58] = 48'hb0e4ff6889de;
    stim[59] = 48'hb1e1c53da437;
    stim[60] = 48'h87fa8ed8eef9;
    stim[61] = 48'hcf590945c76f;
    stim[62] = 48'hdd8480b84021;
    stim[63] = 48'hfda8cb035cd0;
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
      expv[0] = 64'hxxxxxxxx00000000;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'h00000000xxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxx00000000;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'hxxxxxxxx00000000;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'h00000000xxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'hxxxxxxxx00000000;
      expv[11] = 64'h00000000xxxxxxxx;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h29145460xxxxxxxx;
      expv[14] = 64'h82f9a54300000000;
      expv[15] = 64'hxxxxxxxx00000000;
      expv[16] = 64'hxxxxxxxxxxxxxxxx;
      expv[17] = 64'hxxxxxxxx00000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'hxxxxxxxxxxxxxxxx;
      expv[20] = 64'h00000000xxxxxxxx;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h82f9a5433c9704df;
      expv[23] = 64'hxxxxxxxx1e8bb2b2;
      expv[24] = 64'hxxxxxxxx00000000;
      expv[25] = 64'hxxxxxxxx37c142fc;
      expv[26] = 64'h31a1ca10xxxxxxxx;
      expv[27] = 64'hxxxxxxxx00000000;
      expv[28] = 64'hxxxxxxxxfafa374c;
      expv[29] = 64'h00000000xxxxxxxx;
      expv[30] = 64'hxxxxxxxx00000000;
      expv[31] = 64'hxxxxxxxx00000000;
      expv[32] = 64'h00000000xxxxxxxx;
      expv[33] = 64'hxxxxxxxxxxxxxxxx;
      expv[34] = 64'hxxxxxxxx00000000;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'hxxxxxxxx00000000;
      expv[37] = 64'h00000000xxxxxxxx;
      expv[38] = 64'hxxxxxxxx00000000;
      expv[39] = 64'h00000000d4fbb083;
      expv[40] = 64'hxxxxxxxxa0a0d16d;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'hxxxxxxxx00000000;
      expv[43] = 64'ha0a0d16d00000000;
      expv[44] = 64'ha0a0d16d00000000;
      expv[45] = 64'h00000000xxxxxxxx;
      expv[46] = 64'hxxxxxxxxxxxxxxxx;
      expv[47] = 64'hxxxxxxxx00000000;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'hxxxxxxxxxxxxxxxx;
      expv[50] = 64'hxxxxxxxxxxxxxxxx;
      expv[51] = 64'hd3c8ed3db576846c;
      expv[52] = 64'hxxxxxxxxxxxxxxxx;
      expv[53] = 64'hxxxxxxxxxxxxxxxx;
      expv[54] = 64'hxxxxxxxx00000000;
      expv[55] = 64'hxxxxxxxx9b8c4e34;
      expv[56] = 64'hxxxxxxxxxxxxxxxx;
      expv[57] = 64'hxxxxxxxxc66223e6;
      expv[58] = 64'hxxxxxxxxxxxxxxxx;
      expv[59] = 64'hxxxxxxxxxxxxxxxx;
      expv[60] = 64'hxxxxxxxx00000000;
      expv[61] = 64'h000000008ed8eef9;
      expv[62] = 64'he85f59b3xxxxxxxx;
      expv[63] = 64'h00000000xxxxxxxx;
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
