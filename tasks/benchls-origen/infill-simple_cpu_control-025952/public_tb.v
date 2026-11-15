// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 38;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_025952 dut (
    .reset(in_vec[32:32]),
    .pc(in_vec[31:24]),
    .inst(in_vec[23:16]),
    .resreg(in_vec[15:8]),
    .val_i(in_vec[7:0]),
    .val1(out_vec[37:30]),
    .val2(out_vec[29:22]),
    .wmem(out_vec[21:21]),
    .wmemaddr(out_vec[20:16]),
    .wresreg(out_vec[15:15]),
    .wpc(out_vec[14:14]),
    .pc_o(out_vec[13:6]),
    .rmem(out_vec[5:5]),
    .rmemaddr(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1c974829c;
    stim[1] = 33'h1bfe0e92d;
    stim[2] = 33'h1c05d0dc8;
    stim[3] = 33'h0a8d86f70;
    stim[4] = 33'h0c5cbbbfb;
    stim[5] = 33'h09f219348;
    stim[6] = 33'h013d326fc;
    stim[7] = 33'h02b96dadc;
    stim[8] = 33'h09c0eab6c;
    stim[9] = 33'h0501ade5e;
    stim[10] = 33'h07b1b51de;
    stim[11] = 33'h03a12ecaf;
    stim[12] = 33'h01784c26d;
    stim[13] = 33'h024885a63;
    stim[14] = 33'h0dc95518e;
    stim[15] = 33'h069c4222e;
    stim[16] = 33'h05168551d;
    stim[17] = 33'h0ec418f1d;
    stim[18] = 33'h06dd1dd9f;
    stim[19] = 33'h00081c733;
    stim[20] = 33'h06fc124bb;
    stim[21] = 33'h05b218748;
    stim[22] = 33'h0c575b477;
    stim[23] = 33'h0903436a9;
    stim[24] = 33'h065b0db97;
    stim[25] = 33'h0d4596778;
    stim[26] = 33'h03195338e;
    stim[27] = 33'h0833463f5;
    stim[28] = 33'h0a5263b4a;
    stim[29] = 33'h07c72c656;
    stim[30] = 33'h0584cc6c3;
    stim[31] = 33'h0f5dc7b97;
    stim[32] = 33'h081311f9d;
    stim[33] = 33'h0f2dbe4c3;
    stim[34] = 33'h06eb3ad56;
    stim[35] = 33'h0cf89ee68;
    stim[36] = 33'h07fa9cac3;
    stim[37] = 33'h0224485eb;
    stim[38] = 33'h0fbf20dbc;
    stim[39] = 33'h06001896c;
    stim[40] = 33'h04fb6410e;
    stim[41] = 33'h0bc5eef5c;
    stim[42] = 33'h009869e60;
    stim[43] = 33'h00d26b40e;
    stim[44] = 33'h0d3c1f2fb;
    stim[45] = 33'h06755a769;
    stim[46] = 33'h0dc6566db;
    stim[47] = 33'h09360ee72;
    stim[48] = 33'h0459c008a;
    stim[49] = 33'h064a2e43b;
    stim[50] = 33'h0ec615798;
    stim[51] = 33'h093d1c799;
    stim[52] = 33'h0437ff30a;
    stim[53] = 33'h0fc374c78;
    stim[54] = 33'h0d96f9774;
    stim[55] = 33'h0c7b27bbe;
    stim[56] = 33'h0ccbc491e;
    stim[57] = 33'h0b13ec99c;
    stim[58] = 33'h043df2e44;
    stim[59] = 33'h002eb86fc;
    stim[60] = 33'h0ecc71095;
    stim[61] = 33'h01cbb901f;
    stim[62] = 33'h0d8e69c1e;
    stim[63] = 33'h016e3ef2a;
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
      expv[0] = 38'h0000000000;
      expv[1] = 38'h0000000000;
      expv[2] = 38'h0000000000;
      expv[3] = 38'h1bc0386a40;
      expv[4] = 38'h2ec02b7180;
      expv[5] = 38'h24c040e800;
      expv[6] = 38'h0980334500;
      expv[7] = 38'h36b733cb36;
      expv[8] = 38'h0000006740;
      expv[9] = 38'h378280d440;
      expv[10] = 38'h1442c0df00;
      expv[11] = 38'h3b0080cec0;
      expv[12] = 38'h309b40c624;
      expv[13] = 38'h1698c0c968;
      expv[14] = 38'h146380f775;
      expv[15] = 38'h0880245ab5;
      expv[16] = 38'h0000005480;
      expv[17] = 38'h0000007b40;
      expv[18] = 38'h3740315b80;
      expv[19] = 38'h31ccf1c061;
      expv[20] = 38'h0900215c21;
      expv[21] = 38'h21c040d700;
      expv[22] = 38'h0000007180;
      expv[23] = 38'h0000006440;
      expv[24] = 38'h0025c0d9b0;
      expv[25] = 38'h0000007540;
      expv[26] = 38'h0ce380ccb5;
      expv[27] = 38'h0000006100;
      expv[28] = 38'h0ec180e980;
      expv[29] = 38'h0000005f40;
      expv[30] = 38'h0000005640;
      expv[31] = 38'h1ec03c7d80;
      expv[32] = 38'h0000006080;
      expv[33] = 38'h39003b7cc0;
      expv[34] = 38'h0015bbdbf3;
      expv[35] = 38'h3b9a3bf429;
      expv[36] = 38'h0030fbe029;
      expv[37] = 38'h00000048c0;
      expv[38] = 38'h0000004480;
      expv[39] = 38'h0000005840;
      expv[40] = 38'h000380d436;
      expv[41] = 38'h0000006f40;
      expv[42] = 38'h279800c2a6;
      expv[43] = 38'h2d0180c380;
      expv[44] = 38'h3c80217500;
      expv[45] = 38'h0000005a00;
      expv[46] = 38'h0000007740;
      expv[47] = 38'h0000006500;
      expv[48] = 38'h002280d1bc;
      expv[49] = 38'h000ec0d962;
      expv[50] = 38'h0000007b40;
      expv[51] = 38'h31c0316500;
      expv[52] = 38'h0000005100;
      expv[53] = 38'h0000007f40;
      expv[54] = 38'h0000007680;
      expv[55] = 38'h002f80f232;
      expv[56] = 38'h000780f37c;
      expv[57] = 38'h0000006c80;
      expv[58] = 38'h0b803f5100;
      expv[59] = 38'h00003f42c0;
      expv[60] = 38'h0400277b40;
      expv[61] = 38'h0007e7c77b;
      expv[62] = 38'h00002741bb;
      expv[63] = 38'h00002740fb;
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
