// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03404 dut (
    .clk(clk),
    .r0(in_vec[47:40]),
    .g0(in_vec[39:32]),
    .b0(in_vec[31:24]),
    .r1(in_vec[23:16]),
    .g1(in_vec[15:8]),
    .b1(in_vec[7:0]),
    .rgb0(out_vec[20:18]),
    .rgb1(out_vec[17:15]),
    .addrx(out_vec[14:7]),
    .addry(out_vec[6:2]),
    .latch(out_vec[1:1]),
    .blank(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'hfd41b96b1f18;
    stim[1] = 48'h904e072d041a;
    stim[2] = 48'ha0c008046176;
    stim[3] = 48'ha04ab42ced56;
    stim[4] = 48'hbbab72ebb33d;
    stim[5] = 48'hd0ea6b76d17f;
    stim[6] = 48'h2a3b055cda8e;
    stim[7] = 48'h704ef56f3027;
    stim[8] = 48'h120d55f3ea8a;
    stim[9] = 48'hc9130327af5b;
    stim[10] = 48'h072fc1c586f5;
    stim[11] = 48'hd75dbb1edf77;
    stim[12] = 48'h15f63da3ae7a;
    stim[13] = 48'ha562818fd86e;
    stim[14] = 48'h5222d1d5a8c7;
    stim[15] = 48'h5c198dc3270a;
    stim[16] = 48'hfb27b7e39542;
    stim[17] = 48'h82df0f5dfb11;
    stim[18] = 48'h204fa946581f;
    stim[19] = 48'h0a63975af5a3;
    stim[20] = 48'ha7401ee5b8f3;
    stim[21] = 48'h6b6ea8893522;
    stim[22] = 48'hc866d47e7732;
    stim[23] = 48'h2dec8733c3bb;
    stim[24] = 48'h08cc349e9fb7;
    stim[25] = 48'hda76a082635a;
    stim[26] = 48'h6ef035c02d48;
    stim[27] = 48'h54081ae861b5;
    stim[28] = 48'h9334116e593e;
    stim[29] = 48'hdd2e3c3f95be;
    stim[30] = 48'h9b7824a69bbc;
    stim[31] = 48'h1df2085fb80f;
    stim[32] = 48'h4a58a9f6b011;
    stim[33] = 48'h09bf76e55a77;
    stim[34] = 48'had46ebae4abe;
    stim[35] = 48'h5f23e36e80c8;
    stim[36] = 48'hdc01ec983c1f;
    stim[37] = 48'h36094f9003e6;
    stim[38] = 48'hb7904edf1b89;
    stim[39] = 48'h82f3fb1d9220;
    stim[40] = 48'h581ff950dbc4;
    stim[41] = 48'h70cc76b3e0a3;
    stim[42] = 48'h4bb655e21aa7;
    stim[43] = 48'hdcf16909ed1e;
    stim[44] = 48'h9b276014d71f;
    stim[45] = 48'h3a4e09dba45d;
    stim[46] = 48'ha7cc1e3c758c;
    stim[47] = 48'hb0c247eccab5;
    stim[48] = 48'hb29586efb07b;
    stim[49] = 48'h1bdbbf9ef6b4;
    stim[50] = 48'h9abd96cdb995;
    stim[51] = 48'hb5cd2bee01f4;
    stim[52] = 48'h092cab9d4af4;
    stim[53] = 48'h8644b6577f5d;
    stim[54] = 48'hcd9084d9bb59;
    stim[55] = 48'hb34880cc6b71;
    stim[56] = 48'h67217f3ef9e6;
    stim[57] = 48'h250763fade2d;
    stim[58] = 48'h011875f10a34;
    stim[59] = 48'h69387cf9d17d;
    stim[60] = 48'hff31d07dfdd3;
    stim[61] = 48'h41de4f017733;
    stim[62] = 48'h29824d0135a1;
    stim[63] = 48'h9c8f90e51a57;
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
      expv[0] = 21'h1fff00;
      expv[1] = 21'h1fff80;
      expv[2] = 21'h1f8000;
      expv[3] = 21'h1f8080;
      expv[4] = 21'h1f8100;
      expv[5] = 21'h1f8180;
      expv[6] = 21'h1f8200;
      expv[7] = 21'h1f8280;
      expv[8] = 21'h1f8300;
      expv[9] = 21'h1f8380;
      expv[10] = 21'h1f8400;
      expv[11] = 21'h1f8480;
      expv[12] = 21'h1f8500;
      expv[13] = 21'h1f8580;
      expv[14] = 21'h1f8600;
      expv[15] = 21'h1f8680;
      expv[16] = 21'h1f8700;
      expv[17] = 21'h1f8780;
      expv[18] = 21'h1f8800;
      expv[19] = 21'h1f8880;
      expv[20] = 21'h1f8900;
      expv[21] = 21'h1f8980;
      expv[22] = 21'h1f8a00;
      expv[23] = 21'h1f8a80;
      expv[24] = 21'h1f8b00;
      expv[25] = 21'h1f8b80;
      expv[26] = 21'h1f8c00;
      expv[27] = 21'h1f8c80;
      expv[28] = 21'h1f8d00;
      expv[29] = 21'h1f8d80;
      expv[30] = 21'h1f8e00;
      expv[31] = 21'h1f8e80;
      expv[32] = 21'h1f8f00;
      expv[33] = 21'h1f8f80;
      expv[34] = 21'h1f9000;
      expv[35] = 21'h1f9080;
      expv[36] = 21'h1f9100;
      expv[37] = 21'h1f9180;
      expv[38] = 21'h1f9200;
      expv[39] = 21'h1f9280;
      expv[40] = 21'h1f9300;
      expv[41] = 21'h1f9380;
      expv[42] = 21'h1f9400;
      expv[43] = 21'h1f9480;
      expv[44] = 21'h1f9500;
      expv[45] = 21'h1f9580;
      expv[46] = 21'h1f9600;
      expv[47] = 21'h1f9680;
      expv[48] = 21'h1f9700;
      expv[49] = 21'h1f9780;
      expv[50] = 21'h1f9800;
      expv[51] = 21'h1f9880;
      expv[52] = 21'h1f9900;
      expv[53] = 21'h1f9980;
      expv[54] = 21'h1f9a00;
      expv[55] = 21'h1f9a80;
      expv[56] = 21'h1f9b00;
      expv[57] = 21'h1f9b80;
      expv[58] = 21'h1f9c00;
      expv[59] = 21'h1f9c80;
      expv[60] = 21'h1f9d00;
      expv[61] = 21'h1f9d80;
      expv[62] = 21'h1f9e00;
      expv[63] = 21'h1f9e80;
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
