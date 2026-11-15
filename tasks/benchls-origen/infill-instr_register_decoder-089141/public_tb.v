// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_089141 dut (
    .clk(clk),
    .instruction(in_vec[31:0]),
    .INaddr(out_vec[14:12]),
    .OUT1addr(out_vec[11:9]),
    .OUT2addr(out_vec[8:6]),
    .select(out_vec[5:3]),
    .out1mux(out_vec[2:2]),
    .out2mux(out_vec[1:1]),
    .immediatemux(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h6733b841;
    stim[1] = 32'h552272dc;
    stim[2] = 32'h06346289;
    stim[3] = 32'h49a88507;
    stim[4] = 32'hd5f469fb;
    stim[5] = 32'h23b34f0c;
    stim[6] = 32'h34e1a00c;
    stim[7] = 32'hdc5a380d;
    stim[8] = 32'hcc2f5b5f;
    stim[9] = 32'h1ae80a8d;
    stim[10] = 32'h7abee1bd;
    stim[11] = 32'h4af76c96;
    stim[12] = 32'hf3073dc0;
    stim[13] = 32'h7e493629;
    stim[14] = 32'h169f1c22;
    stim[15] = 32'h1569152d;
    stim[16] = 32'h8f0f5c66;
    stim[17] = 32'h8d57eeb6;
    stim[18] = 32'hde4c5da9;
    stim[19] = 32'hb42bbc60;
    stim[20] = 32'hfc715d93;
    stim[21] = 32'hb3e17df0;
    stim[22] = 32'h797b458f;
    stim[23] = 32'h180cc240;
    stim[24] = 32'hcf5dbc35;
    stim[25] = 32'h0e933f16;
    stim[26] = 32'h8f7a8e17;
    stim[27] = 32'h8aecd81e;
    stim[28] = 32'hc8867383;
    stim[29] = 32'h703aa8d8;
    stim[30] = 32'h4c1533b6;
    stim[31] = 32'h309e2aef;
    stim[32] = 32'hadf4fe91;
    stim[33] = 32'hb50757bf;
    stim[34] = 32'h8aea287d;
    stim[35] = 32'h09d52840;
    stim[36] = 32'h334149bb;
    stim[37] = 32'ha35a84af;
    stim[38] = 32'h70933331;
    stim[39] = 32'h46219d33;
    stim[40] = 32'h5222153b;
    stim[41] = 32'h6d06bca2;
    stim[42] = 32'hd54bfd0c;
    stim[43] = 32'hfdd01ec5;
    stim[44] = 32'h97c5d784;
    stim[45] = 32'h845a9044;
    stim[46] = 32'h29d4f997;
    stim[47] = 32'he55dcdbd;
    stim[48] = 32'hc1ff3725;
    stim[49] = 32'h30d10b99;
    stim[50] = 32'hbb315902;
    stim[51] = 32'hc372f6e0;
    stim[52] = 32'haba68cd7;
    stim[53] = 32'he92ed851;
    stim[54] = 32'h416cf2b7;
    stim[55] = 32'h1f6336f5;
    stim[56] = 32'hf679931a;
    stim[57] = 32'h5fb9ad22;
    stim[58] = 32'h2f8077b0;
    stim[59] = 32'hfee9e4f1;
    stim[60] = 32'h3cf25457;
    stim[61] = 32'h952a5b20;
    stim[62] = 32'hcd2ed42c;
    stim[63] = 32'hfeb5fc7a;
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
      expv[0] = 15'hxxxx;
      expv[1] = 15'h17c8;
      expv[2] = 15'h15a8;
      expv[3] = 15'h1908;
      expv[4] = 15'h5010;
      expv[5] = 15'h7968;
      expv[6] = 15'h5643;
      expv[7] = 15'h7328;
      expv[8] = 15'h25f8;
      expv[9] = 15'h1ed8;
      expv[10] = 15'h7070;
      expv[11] = 15'h5d30;
      expv[12] = 15'h7f50;
      expv[13] = 15'h0fe0;
      expv[14] = 15'h23b8;
      expv[15] = 15'h4ee8;
      expv[16] = 15'h32a8;
      expv[17] = 15'h0ed8;
      expv[18] = 15'h2f58;
      expv[19] = 15'h28f8;
      expv[20] = 15'h17e8;
      expv[21] = 15'h32f8;
      expv[22] = 15'h73e0;
      expv[23] = 15'h3630;
      expv[24] = 15'h0830;
      expv[25] = 15'h2bd8;
      expv[26] = 15'h47d8;
      expv[27] = 15'h3458;
      expv[28] = 15'h78d0;
      expv[29] = 15'h4d90;
      expv[30] = 15'h1560;
      expv[31] = 15'h0b98;
      expv[32] = 15'h4d60;
      expv[33] = 15'h79d8;
      expv[34] = 15'h0ea8;
      expv[35] = 15'h7550;
      expv[36] = 15'h6b50;
      expv[37] = 15'h2260;
      expv[38] = 15'h2400;
      expv[39] = 15'h47a0;
      expv[40] = 15'h12c8;
      expv[41] = 15'h14a0;
      expv[42] = 15'h0dd8;
      expv[43] = 15'h27e8;
      expv[44] = 15'h60f8;
      expv[45] = 15'h6aa8;
      expv[46] = 15'h2488;
      expv[47] = 15'h69d0;
      expv[48] = 15'h2a48;
      expv[49] = 15'h7f80;
      expv[50] = 15'h6260;
      expv[51] = 15'h12f0;
      expv[52] = 15'h3580;
      expv[53] = 15'h5c50;
      expv[54] = 15'h1cd0;
      expv[55] = 15'h3980;
      expv[56] = 15'h37b8;
      expv[57] = 15'h32a8;
      expv[58] = 15'h5378;
      expv[59] = 15'h4198;
      expv[60] = 15'h7338;
      expv[61] = 15'h74b8;
      expv[62] = 15'h14e8;
      expv[63] = 15'h1c98;
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
