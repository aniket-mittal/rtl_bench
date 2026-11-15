// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09817 dut (
    .clk(clk),
    .reset(in_vec[32:32]),
    .inp(in_vec[31:0]),
    .outp(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1c75c9753;
    stim[1] = 33'h12f6d6335;
    stim[2] = 33'h038518f55;
    stim[3] = 33'h06cbc185e;
    stim[4] = 33'h0a488396e;
    stim[5] = 33'h0f908177c;
    stim[6] = 33'h027962aa8;
    stim[7] = 33'h0a9566956;
    stim[8] = 33'h05df36e6a;
    stim[9] = 33'h08f437335;
    stim[10] = 33'h06cf83329;
    stim[11] = 33'h0bc265bdf;
    stim[12] = 33'h1cc6852fe;
    stim[13] = 33'h07fced23e;
    stim[14] = 33'h0fbf86d78;
    stim[15] = 33'h0c9c9d610;
    stim[16] = 33'h06b33798a;
    stim[17] = 33'h09d988a72;
    stim[18] = 33'h09d1640a0;
    stim[19] = 33'h05959277c;
    stim[20] = 33'h023e90afb;
    stim[21] = 33'h13eb79480;
    stim[22] = 33'h062721cda;
    stim[23] = 33'h02841d3fc;
    stim[24] = 33'h03de53306;
    stim[25] = 33'h0580c3707;
    stim[26] = 33'h0ac2b4659;
    stim[27] = 33'h06759e0e5;
    stim[28] = 33'h06f1d4046;
    stim[29] = 33'h04c005393;
    stim[30] = 33'h0d7ea0e87;
    stim[31] = 33'h0d6d3cd8c;
    stim[32] = 33'h05b06cff5;
    stim[33] = 33'h081479511;
    stim[34] = 33'h01dd60c09;
    stim[35] = 33'h09abad312;
    stim[36] = 33'h032e3acfd;
    stim[37] = 33'h0530a360f;
    stim[38] = 33'h0f357c398;
    stim[39] = 33'h0f1a4397d;
    stim[40] = 33'h07a444142;
    stim[41] = 33'h08170fb41;
    stim[42] = 33'h0e51f244b;
    stim[43] = 33'h0cbd87128;
    stim[44] = 33'h0a2f68b85;
    stim[45] = 33'h03b36567a;
    stim[46] = 33'h08533b65d;
    stim[47] = 33'h0d0588fa8;
    stim[48] = 33'h0603152ad;
    stim[49] = 33'h071241ea0;
    stim[50] = 33'h0f170602e;
    stim[51] = 33'h05ab2f928;
    stim[52] = 33'h068c61034;
    stim[53] = 33'h07e3971a2;
    stim[54] = 33'h1425d0f5c;
    stim[55] = 33'h0a6b3ae2f;
    stim[56] = 33'h054b84573;
    stim[57] = 33'h0871e1722;
    stim[58] = 33'h0518ebb5c;
    stim[59] = 33'h0dc62c284;
    stim[60] = 33'h0a4f15947;
    stim[61] = 33'h08f2415f4;
    stim[62] = 33'h0a1c66155;
    stim[63] = 33'h0a721889a;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'hd0610a66;
      expv[4] = 32'h6736ee10;
      expv[5] = 32'h917e2fec;
      expv[6] = 32'h53322218;
      expv[7] = 32'h9bb66f70;
      expv[8] = 32'hedd3abc4;
      expv[9] = 32'hf5c2f624;
      expv[10] = 32'hd5ed9e1a;
      expv[11] = 32'hb31be018;
      expv[12] = 32'h06529810;
      expv[13] = 32'h00000000;
      expv[14] = 32'h4eb5e818;
      expv[15] = 32'h4eebbe30;
      expv[16] = 32'he0c91ee0;
      expv[17] = 32'hb458a9cc;
      expv[18] = 32'h605ca404;
      expv[19] = 32'h9f632540;
      expv[20] = 32'h1551a4a8;
      expv[21] = 32'hcd74d16a;
      expv[22] = 32'h00000000;
      expv[23] = 32'had0cdbf8;
      expv[24] = 32'hac120638;
      expv[25] = 32'hba9115f4;
      expv[26] = 32'hc26417e6;
      expv[27] = 32'h9a333364;
      expv[28] = 32'h1d59cbd0;
      expv[29] = 32'h0d01ad90;
      expv[30] = 32'h0efb142e;
      expv[31] = 32'h69cef554;
      expv[32] = 32'hb425c230;
      expv[33] = 32'he672280e;
      expv[34] = 32'hed9d98d8;
      expv[35] = 32'h134556e0;
      expv[36] = 32'h188b80e0;
      expv[37] = 32'hf0fa369a;
      expv[38] = 32'ha5e64e18;
      expv[39] = 32'h5ba986e0;
      expv[40] = 32'h12e2e886;
      expv[41] = 32'h83606150;
      expv[42] = 32'h64809702;
      expv[43] = 32'h8449fa80;
      expv[44] = 32'he71b01e0;
      expv[45] = 32'h3b0ee3f6;
      expv[46] = 32'h54ac2cb0;
      expv[47] = 32'hf8e00a2a;
      expv[48] = 32'h8cf5c240;
      expv[49] = 32'h8b2bb546;
      expv[50] = 32'h66bd8d00;
      expv[51] = 32'h705a04b4;
      expv[52] = 32'hdc2dfd10;
      expv[53] = 32'h6fea8218;
      expv[54] = 32'hae22d18c;
      expv[55] = 32'h00000000;
      expv[56] = 32'h81dd6a1e;
      expv[57] = 32'ha6d6709c;
      expv[58] = 32'hcbb19338;
      expv[59] = 32'hbe2ea3b8;
      expv[60] = 32'hce23d158;
      expv[61] = 32'hf05b9e92;
      expv[62] = 32'hf05e19d0;
      expv[63] = 32'h069059de;
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
