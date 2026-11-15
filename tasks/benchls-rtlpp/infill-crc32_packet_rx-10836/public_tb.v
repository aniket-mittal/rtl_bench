// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 81;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10836 dut (
    .clk(clk),
    .reset(in_vec[80:80]),
    .address(in_vec[79:77]),
    .write(in_vec[76:76]),
    .read(in_vec[75:75]),
    .writedata(in_vec[74:43]),
    .rx_data(in_vec[42:11]),
    .rx_dval(in_vec[10:10]),
    .rx_sop(in_vec[9:9]),
    .rx_eop(in_vec[8:8]),
    .rx_mod(in_vec[7:6]),
    .rx_err(in_vec[5:0]),
    .readdata(out_vec[32:1]),
    .rx_rdy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 81'h182e8a2cae911f970ea93;
    stim[1] = 81'h1bbced4ed5aa1f7cfd1ae;
    stim[2] = 81'h08a4521aca8d9b921b21f;
    stim[3] = 81'h0428128a724684dc4b904;
    stim[4] = 81'h03eacf34735eeb22c82c3;
    stim[5] = 81'h069cf6c7901fd3cefd735;
    stim[6] = 81'h020ab94f3504fbf5af8df;
    stim[7] = 81'h0cbacd4c575fb72a47601;
    stim[8] = 81'h090e80ac163989728f3ee;
    stim[9] = 81'h0a0b4ebf53f3bb6838b9b;
    stim[10] = 81'h0b1dbdf6896df3b64586a;
    stim[11] = 81'h0f13b0e1c4a82db99ad50;
    stim[12] = 81'h05e4dbbc828fe268022de;
    stim[13] = 81'h012c8baa39e9d33aa5ce3;
    stim[14] = 81'h07667f778520e8a04ed6c;
    stim[15] = 81'h0614057ca68150af5c5ef;
    stim[16] = 81'h02d7e13c2294e0140fb01;
    stim[17] = 81'h087f8c134b5dcd9460686;
    stim[18] = 81'h06b729a0a1f27620bb0f8;
    stim[19] = 81'h09ca65bf2eaa3cba6f283;
    stim[20] = 81'h0c0e6e14608ea6e7062ad;
    stim[21] = 81'h1924b7baad5aa2967b0c1;
    stim[22] = 81'h09e1146f242ba54e9055e;
    stim[23] = 81'h08aff75c6d3add62e1aff;
    stim[24] = 81'h07e0ebc73416c8994e99a;
    stim[25] = 81'h0a9d32222523b5b9ed9f9;
    stim[26] = 81'h083cb3cae7101b354d8aa;
    stim[27] = 81'h0c26e7b3f9ae6d8e54a8b;
    stim[28] = 81'h0cae9d061fff4e8eda72d;
    stim[29] = 81'h061911c824cc5269ae753;
    stim[30] = 81'h069f1ba6a9388520709c3;
    stim[31] = 81'h07b421ac67b4fe51c2028;
    stim[32] = 81'h0ab32e0cd997228233306;
    stim[33] = 81'h0ef8c2e08fbb6d7928332;
    stim[34] = 81'h0635079075bbf2a403540;
    stim[35] = 81'h0e849126771a516237026;
    stim[36] = 81'h07b7899f59cbc71d8002f;
    stim[37] = 81'h0a14f2c3bdaa44a9a1d12;
    stim[38] = 81'h07279d15ecfb7e5d74b1c;
    stim[39] = 81'h06d486648660677c4e8ab;
    stim[40] = 81'h05d4467add26d42a247cb;
    stim[41] = 81'h0d78d68d0008f15ab25cc;
    stim[42] = 81'h03fa6b4447f2119c8bd90;
    stim[43] = 81'h0107beea58a8346c86d8f;
    stim[44] = 81'h05d5dc1dec168d4bb3a77;
    stim[45] = 81'h046d542201fc86827678a;
    stim[46] = 81'h0b6b6f404f528a1f8e444;
    stim[47] = 81'h05df0d979136cd3f5fc05;
    stim[48] = 81'h0a40b899b65d97e23e52a;
    stim[49] = 81'h014b1d7253b97411dcca3;
    stim[50] = 81'h04bfaa7732624584f8307;
    stim[51] = 81'h03e81bcb579ab9ff92d04;
    stim[52] = 81'h0a99ddb1d42d0fd61bd54;
    stim[53] = 81'h0f92f971785c0e25bd7dd;
    stim[54] = 81'h00b6eaafc7161b8f6b28e;
    stim[55] = 81'h09c8493b927b6706ee132;
    stim[56] = 81'h008e6cb6b2e60fdfea00a;
    stim[57] = 81'h042b265522f594be7f972;
    stim[58] = 81'h029763bf870b25b4f29a6;
    stim[59] = 81'h000507ec01074be404bfc;
    stim[60] = 81'h010452ddac5c2bcaef956;
    stim[61] = 81'h05cb427690eb90d58c4d2;
    stim[62] = 81'h01b9a6b03efe2c063ef16;
    stim[63] = 81'h0594ffa687aa264db7569;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000001;
      expv[4] = 33'h000000001;
      expv[5] = 33'h000000001;
      expv[6] = 33'h000000001;
      expv[7] = 33'h000000001;
      expv[8] = 33'h000000001;
      expv[9] = 33'h000000001;
      expv[10] = 33'h000000001;
      expv[11] = 33'h000000001;
      expv[12] = 33'h00000000b;
      expv[13] = 33'h000000001;
      expv[14] = 33'h000000001;
      expv[15] = 33'h000000001;
      expv[16] = 33'h000000001;
      expv[17] = 33'h000000001;
      expv[18] = 33'h000000019;
      expv[19] = 33'h000000001;
      expv[20] = 33'h000000001;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000001;
      expv[24] = 33'h000000007;
      expv[25] = 33'h000000005;
      expv[26] = 33'h000000001;
      expv[27] = 33'h000000001;
      expv[28] = 33'h000000001;
      expv[29] = 33'h000000001;
      expv[30] = 33'h000000015;
      expv[31] = 33'h000000015;
      expv[32] = 33'h000000013;
      expv[33] = 33'h0000000c1;
      expv[34] = 33'h000000001;
      expv[35] = 33'h000000001;
      expv[36] = 33'h00000001b;
      expv[37] = 33'h000000001;
      expv[38] = 33'h000000001;
      expv[39] = 33'h000000023;
      expv[40] = 33'h000000017;
      expv[41] = 33'h000000001;
      expv[42] = 33'h000000001;
      expv[43] = 33'h000000001;
      expv[44] = 33'h00000001f;
      expv[45] = 33'h000000001;
      expv[46] = 33'h000000001;
      expv[47] = 33'h000000021;
      expv[48] = 33'h000000001;
      expv[49] = 33'h000000001;
      expv[50] = 33'h000000023;
      expv[51] = 33'h000000001;
      expv[52] = 33'h00000003b;
      expv[53] = 33'h000000281;
      expv[54] = 33'h12c75c94f;
      expv[55] = 33'h000000001;
      expv[56] = 33'h12c75c94f;
      expv[57] = 33'h000000001;
      expv[58] = 33'h000000001;
      expv[59] = 33'h000000001;
      expv[60] = 33'h000000001;
      expv[61] = 33'h000000035;
      expv[62] = 33'h0114b76b1;
      expv[63] = 33'h000000037;
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
