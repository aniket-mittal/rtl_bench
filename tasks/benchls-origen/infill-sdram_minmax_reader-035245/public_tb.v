// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 88;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_035245 dut (
    .clk(clk),
    .reset_n(in_vec[19:19]),
    .waitrequest(in_vec[18:18]),
    .readdatavalid(in_vec[17:17]),
    .readdata(in_vec[16:1]),
    .ready(in_vec[0:0]),
    .read_n(out_vec[87:87]),
    .write_n(out_vec[86:86]),
    .chipselect(out_vec[85:85]),
    .address(out_vec[84:53]),
    .byteenable(out_vec[52:51]),
    .writedata(out_vec[50:35]),
    .done(out_vec[34:34]),
    .max(out_vec[33:18]),
    .min(out_vec[17:2]),
    .state(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h6de21;
    stim[1] = 20'h33a9e;
    stim[2] = 20'he044d;
    stim[3] = 20'hc3331;
    stim[4] = 20'hea9a5;
    stim[5] = 20'hd22c2;
    stim[6] = 20'hac8ea;
    stim[7] = 20'hdcd62;
    stim[8] = 20'hb85e4;
    stim[9] = 20'he73b2;
    stim[10] = 20'ha98b5;
    stim[11] = 20'hc5d0b;
    stim[12] = 20'hc29e6;
    stim[13] = 20'hf6a7d;
    stim[14] = 20'hc7ae2;
    stim[15] = 20'h868a4;
    stim[16] = 20'hda7b0;
    stim[17] = 20'hf7861;
    stim[18] = 20'h861d6;
    stim[19] = 20'h803e0;
    stim[20] = 20'he31c7;
    stim[21] = 20'haf7aa;
    stim[22] = 20'h96dc0;
    stim[23] = 20'h92bcc;
    stim[24] = 20'h960ff;
    stim[25] = 20'hd14f6;
    stim[26] = 20'hb3795;
    stim[27] = 20'h8583c;
    stim[28] = 20'h82ebc;
    stim[29] = 20'hd430a;
    stim[30] = 20'haaae6;
    stim[31] = 20'haee2a;
    stim[32] = 20'hb1eed;
    stim[33] = 20'haa635;
    stim[34] = 20'h86aab;
    stim[35] = 20'h8431d;
    stim[36] = 20'h8f44c;
    stim[37] = 20'ha8bae;
    stim[38] = 20'he7aa1;
    stim[39] = 20'hde7a9;
    stim[40] = 20'h95284;
    stim[41] = 20'hcb7e1;
    stim[42] = 20'ha8475;
    stim[43] = 20'hb2f37;
    stim[44] = 20'hb5d32;
    stim[45] = 20'hb444c;
    stim[46] = 20'hff61e;
    stim[47] = 20'h92d98;
    stim[48] = 20'he867e;
    stim[49] = 20'ha0a62;
    stim[50] = 20'hb15da;
    stim[51] = 20'hcf811;
    stim[52] = 20'he3a14;
    stim[53] = 20'hb8f43;
    stim[54] = 20'hd781d;
    stim[55] = 20'he7905;
    stim[56] = 20'hdf355;
    stim[57] = 20'hf75f7;
    stim[58] = 20'h9db1a;
    stim[59] = 20'h83990;
    stim[60] = 20'h90b80;
    stim[61] = 20'h408a4;
    stim[62] = 20'hf0828;
    stim[63] = 20'hc0a66;
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
      expv[0] = 88'hc00000001800000003fffc;
      expv[1] = 88'hc00000001800000003fffc;
      expv[2] = 88'hc00000001800000003fffc;
      expv[3] = 88'h600000001800000003fffd;
      expv[4] = 88'h600000001800000003fffd;
      expv[5] = 88'h600000001800000003fffd;
      expv[6] = 88'h600000001800000003fffd;
      expv[7] = 88'h6000000038000191d591d5;
      expv[8] = 88'h6000000038000191d591d5;
      expv[9] = 88'h600000005800030bc991d5;
      expv[10] = 88'h600000005800030bc991d5;
      expv[11] = 88'h600000007800030bc93169;
      expv[12] = 88'h600000007800030bc93169;
      expv[13] = 88'h600000007800030bc93169;
      expv[14] = 88'h600000007800030bc93169;
      expv[15] = 88'h600000007800030bc93169;
      expv[16] = 88'h600000007800030bc93169;
      expv[17] = 88'h600000007800030bc93169;
      expv[18] = 88'h600000007800030bc93169;
      expv[19] = 88'h600000007800030bc93169;
      expv[20] = 88'h600000007800030bc93169;
      expv[21] = 88'h600000007800030bc93169;
      expv[22] = 88'h600000009800030bc93169;
      expv[23] = 88'h600000009800030bc93169;
      expv[24] = 88'h600000009800030bc93169;
      expv[25] = 88'h600000009800030bc93169;
      expv[26] = 88'h600000009800030bc93169;
      expv[27] = 88'h60000000b800030bc93169;
      expv[28] = 88'h60000000b800030bc93169;
      expv[29] = 88'h60000000b800030bc93169;
      expv[30] = 88'h60000000b800030bc93169;
      expv[31] = 88'h60000000d800030bc93169;
      expv[32] = 88'h60000000f800030bc93169;
      expv[33] = 88'h600000011800030bc93169;
      expv[34] = 88'h600000013800030bc93169;
      expv[35] = 88'h600000013800030bc93169;
      expv[36] = 88'h600000013800030bc93169;
      expv[37] = 88'h600000013800030bc93169;
      expv[38] = 88'ha00000015a62d30bc9175e;
      expv[39] = 88'ha00000015a62d30bc9175e;
      expv[40] = 88'ha00000015a62d30bc9175e;
      expv[41] = 88'ha00000017e17930bc9175e;
      expv[42] = 88'ha00000017e17930bc9175e;
      expv[43] = 88'hc00000017e17970bc9175f;
      expv[44] = 88'hc00000017e17970bc9175f;
      expv[45] = 88'hc00000017e17930bc9175c;
      expv[46] = 88'hc00000017e17930bc9175c;
      expv[47] = 88'hc00000017e17930bc9175c;
      expv[48] = 88'hc00000017e17930bc9175c;
      expv[49] = 88'hc00000017e17930bc9175c;
      expv[50] = 88'hc00000017e17930bc9175c;
      expv[51] = 88'hc00000017e17930bc9175c;
      expv[52] = 88'h600000001e17930bc9175d;
      expv[53] = 88'h600000001e17930bc9175d;
      expv[54] = 88'h600000003e17931e85175d;
      expv[55] = 88'h600000003e17931e85175d;
      expv[56] = 88'h600000003e17931e85175d;
      expv[57] = 88'h600000003e17931e85175d;
      expv[58] = 88'h600000003e17931e85175d;
      expv[59] = 88'h600000003e17931e85175d;
      expv[60] = 88'h600000003e17931e85175d;
      expv[61] = 88'hc00000001800000003fffc;
      expv[62] = 88'hc00000001800000003fffc;
      expv[63] = 88'hc00000001800000003fffc;
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
