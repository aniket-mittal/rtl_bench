// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00794 dut (
    .clk(clk),
    .rst_n(in_vec[19:19]),
    .eop(in_vec[18:18]),
    .char_in(in_vec[17:10]),
    .enable(in_vec[9:9]),
    .char_in_vld(in_vec[8:8]),
    .stream_id(in_vec[7:2]),
    .new_stream_id(in_vec[1:1]),
    .load_state(in_vec[0:0]),
    .count(out_vec[16:1]),
    .fired(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h45edd;
    stim[1] = 20'h149ee;
    stim[2] = 20'h9b038;
    stim[3] = 20'he30c9;
    stim[4] = 20'hcf56b;
    stim[5] = 20'h9492c;
    stim[6] = 20'hd49ac;
    stim[7] = 20'hffe4f;
    stim[8] = 20'hd1ba9;
    stim[9] = 20'h0b9ac;
    stim[10] = 20'h8d178;
    stim[11] = 20'hca8af;
    stim[12] = 20'hcd961;
    stim[13] = 20'hedf91;
    stim[14] = 20'hf1c7e;
    stim[15] = 20'hcb2fe;
    stim[16] = 20'hb5d79;
    stim[17] = 20'hf9dec;
    stim[18] = 20'h9c46a;
    stim[19] = 20'he7bac;
    stim[20] = 20'he44ac;
    stim[21] = 20'hdebf9;
    stim[22] = 20'hd8a79;
    stim[23] = 20'h89a7f;
    stim[24] = 20'hb7998;
    stim[25] = 20'ha44af;
    stim[26] = 20'h9f870;
    stim[27] = 20'h82e6e;
    stim[28] = 20'ha52cb;
    stim[29] = 20'h95257;
    stim[30] = 20'hac0ab;
    stim[31] = 20'hc323a;
    stim[32] = 20'he1912;
    stim[33] = 20'h98069;
    stim[34] = 20'hb0d28;
    stim[35] = 20'hf33fb;
    stim[36] = 20'hb0b95;
    stim[37] = 20'hd94a2;
    stim[38] = 20'hb44eb;
    stim[39] = 20'hda66e;
    stim[40] = 20'hfcfe9;
    stim[41] = 20'he883f;
    stim[42] = 20'hcc036;
    stim[43] = 20'hf6d93;
    stim[44] = 20'h89cb0;
    stim[45] = 20'hb00f4;
    stim[46] = 20'h87e41;
    stim[47] = 20'hcbbc8;
    stim[48] = 20'hdfa59;
    stim[49] = 20'he8c92;
    stim[50] = 20'ha9e9c;
    stim[51] = 20'ha795e;
    stim[52] = 20'hb86af;
    stim[53] = 20'hc9e70;
    stim[54] = 20'hf58e9;
    stim[55] = 20'hb1b1e;
    stim[56] = 20'hac730;
    stim[57] = 20'hfd49c;
    stim[58] = 20'hd9c27;
    stim[59] = 20'h8841a;
    stim[60] = 20'haaf87;
    stim[61] = 20'h96613;
    stim[62] = 20'ha482e;
    stim[63] = 20'h2e72d;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
