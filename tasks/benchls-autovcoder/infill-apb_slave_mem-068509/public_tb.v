// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 76;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_068509 dut (
    .apb_clk(clk),
    .apb_reset(in_vec[75:75]),
    .apb_addr(in_vec[74:67]),
    .apb_write(in_vec[66:66]),
    .apb_en(in_vec[65:65]),
    .apb_wdata(in_vec[64:33]),
    .apb_selx(in_vec[32:32]),
    .wait_cycle(in_vec[31:0]),
    .apb_rdata(out_vec[33:2]),
    .apb_ready(out_vec[1:1]),
    .apb_slverr(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 76'hd371f744f4f77bf3d02;
    stim[1] = 76'h955ae48639ebecc718a;
    stim[2] = 76'h67b756f0143347ed463;
    stim[3] = 76'h291ca30ec264b19ea27;
    stim[4] = 76'h6c96b89d0e59b51c60a;
    stim[5] = 76'h4643859e577e7c5bf25;
    stim[6] = 76'h731b94c51728266ceb9;
    stim[7] = 76'h64f08d896202bb2148e;
    stim[8] = 76'h67b1801f1968e888992;
    stim[9] = 76'h0446e40884ce2744acc;
    stim[10] = 76'h0271f01f3b4a6844128;
    stim[11] = 76'h6158b64d37e93313ca1;
    stim[12] = 76'h10ebf2aca2b7174ea6b;
    stim[13] = 76'h318716b8b62528141ae;
    stim[14] = 76'h186007e25aff79f4a12;
    stim[15] = 76'h0a21359f5b8622ed61f;
    stim[16] = 76'h680b09a99e6ad27c982;
    stim[17] = 76'h20b565ac7e2d89078e4;
    stim[18] = 76'h0574fd0ebb183f4a476;
    stim[19] = 76'h2d0ec7f7a977b6a18ce;
    stim[20] = 76'h383c023fe8c5f65683e;
    stim[21] = 76'h090db028dfd032d8916;
    stim[22] = 76'h1cdc332155b9d59021a;
    stim[23] = 76'h5c78b7ec877dd5d48be;
    stim[24] = 76'h016cdf3308136ef9429;
    stim[25] = 76'h4c68902f22ea2e9b642;
    stim[26] = 76'h500a08df7e69a7b58fa;
    stim[27] = 76'h4be50c4ccadbc46ca27;
    stim[28] = 76'h28f8dc5410939edac0e;
    stim[29] = 76'h9527784ce9b23d1a464;
    stim[30] = 76'h2abf136652d2037a8d9;
    stim[31] = 76'h0edd9b871dc9920c4c3;
    stim[32] = 76'h1b75bc7f677678b26e9;
    stim[33] = 76'h0bafe5b86cddfb2cdbb;
    stim[34] = 76'h2fce0c491f70dab2a6a;
    stim[35] = 76'h2f1c44312f76833bcdf;
    stim[36] = 76'h44abf0677e0945dfdb7;
    stim[37] = 76'h42f5c2ed2f17c4e0c51;
    stim[38] = 76'h5482d867a486e9456bc;
    stim[39] = 76'h032183a89a33775b957;
    stim[40] = 76'h60d0e917d5e203b5652;
    stim[41] = 76'h52f539f23be174908ab;
    stim[42] = 76'h6ea6212e27ee54e9f57;
    stim[43] = 76'h060d297a5a27aac1a85;
    stim[44] = 76'h2b9bc23017bf8f2719e;
    stim[45] = 76'h5b1b5e189c325413e07;
    stim[46] = 76'h658730282fcb4f7cfaa;
    stim[47] = 76'h3860d21cef9ee1566c2;
    stim[48] = 76'h56a93e151cda75bc4c2;
    stim[49] = 76'h46f73163a6bc96c89bc;
    stim[50] = 76'h3c624ba966a432e3a8a;
    stim[51] = 76'h05513b585c85dd4f327;
    stim[52] = 76'h4afcedad005409b5471;
    stim[53] = 76'h580d55746bbbf0c5fd3;
    stim[54] = 76'h2e7cf4db585b1af586d;
    stim[55] = 76'h133849fbef512fb6736;
    stim[56] = 76'h3c7d8879cd3f664165c;
    stim[57] = 76'h01c2f85aeab4f0d1567;
    stim[58] = 76'h08317ac5bf34304a84d;
    stim[59] = 76'h4f7dede1ef4de5c030f;
    stim[60] = 76'h58c0717c3e744f2a18d;
    stim[61] = 76'h4a765d2049a8eac5387;
    stim[62] = 76'h7f8c78a8a8aeccc206a;
    stim[63] = 76'h7cc3f07f9a0998e658a;
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
      expv[0] = 34'h00000000x;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h000000000;
      expv[6] = 34'h000000000;
      expv[7] = 34'h000000000;
      expv[8] = 34'h000000000;
      expv[9] = 34'h000000000;
      expv[10] = 34'h000000000;
      expv[11] = 34'h000000000;
      expv[12] = 34'h000000000;
      expv[13] = 34'h000000000;
      expv[14] = 34'h000000000;
      expv[15] = 34'h000000000;
      expv[16] = 34'h000000000;
      expv[17] = 34'h000000000;
      expv[18] = 34'h000000000;
      expv[19] = 34'h000000000;
      expv[20] = 34'h000000000;
      expv[21] = 34'h000000000;
      expv[22] = 34'h000000000;
      expv[23] = 34'h000000000;
      expv[24] = 34'h000000000;
      expv[25] = 34'h000000000;
      expv[26] = 34'h000000000;
      expv[27] = 34'h000000000;
      expv[28] = 34'h000000000;
      expv[29] = 34'h000000000;
      expv[30] = 34'h000000000;
      expv[31] = 34'h000000000;
      expv[32] = 34'h000000000;
      expv[33] = 34'h000000000;
      expv[34] = 34'h000000000;
      expv[35] = 34'h000000000;
      expv[36] = 34'h000000000;
      expv[37] = 34'h000000000;
      expv[38] = 34'h000000000;
      expv[39] = 34'h000000000;
      expv[40] = 34'h000000000;
      expv[41] = 34'h000000000;
      expv[42] = 34'h000000000;
      expv[43] = 34'h000000000;
      expv[44] = 34'h000000000;
      expv[45] = 34'h000000000;
      expv[46] = 34'h000000000;
      expv[47] = 34'h000000000;
      expv[48] = 34'h000000000;
      expv[49] = 34'h000000000;
      expv[50] = 34'h000000000;
      expv[51] = 34'h000000000;
      expv[52] = 34'h000000000;
      expv[53] = 34'h000000000;
      expv[54] = 34'h000000000;
      expv[55] = 34'h000000000;
      expv[56] = 34'h000000000;
      expv[57] = 34'h000000000;
      expv[58] = 34'h000000000;
      expv[59] = 34'h000000000;
      expv[60] = 34'h000000000;
      expv[61] = 34'h000000000;
      expv[62] = 34'h000000000;
      expv[63] = 34'h000000000;
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
