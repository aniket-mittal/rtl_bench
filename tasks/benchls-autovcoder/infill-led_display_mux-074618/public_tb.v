// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 58;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_074618 dut (
    .Din_7seg1(in_vec[57:50]),
    .Din_7seg2(in_vec[49:42]),
    .ALUout_7seg0(in_vec[41:34]),
    .ALUout_7seg1(in_vec[33:26]),
    .ALUout_7seg2(in_vec[25:18]),
    .ALUout_7seg3(in_vec[17:10]),
    .MS_7seg(in_vec[9:2]),
    .sel(in_vec[1:0]),
    .LED0(out_vec[31:24]),
    .LED1(out_vec[23:16]),
    .LED2(out_vec[15:8]),
    .LED3(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 58'h131e63b2f406745;
    stim[1] = 58'h30b8b143d650836;
    stim[2] = 58'h04bc8221f0e7a5d;
    stim[3] = 58'h04d72c46a48c2b3;
    stim[4] = 58'h1fa21be503a87ff;
    stim[5] = 58'h0ea36412e7bc75a;
    stim[6] = 58'h3ba7e0fb70b2742;
    stim[7] = 58'h121f19212d68497;
    stim[8] = 58'h1c558e7f563aed1;
    stim[9] = 58'h3dab19efe3f2e0e;
    stim[10] = 58'h0db6f19def6bd72;
    stim[11] = 58'h165ec8702cd9bcd;
    stim[12] = 58'h3eb39f965f006e1;
    stim[13] = 58'h0aa9c465106d742;
    stim[14] = 58'h0eb6a1e984470f0;
    stim[15] = 58'h2fc55e78fe2098e;
    stim[16] = 58'h23058774a7c308e;
    stim[17] = 58'h03bd207d45f87be;
    stim[18] = 58'h26a48aa50fd674a;
    stim[19] = 58'h33b67f8932b98ef;
    stim[20] = 58'h345ab2098f45e30;
    stim[21] = 58'h379431a34180206;
    stim[22] = 58'h005daf95aeea735;
    stim[23] = 58'h020d9e99ed23690;
    stim[24] = 58'h0be1296de2159a5;
    stim[25] = 58'h2b449ab9d46a5f3;
    stim[26] = 58'h0b02fc9239ad3da;
    stim[27] = 58'h2c648c4d84c4dfd;
    stim[28] = 58'h00281e2ab8c6782;
    stim[29] = 58'h19627b4e1a20918;
    stim[30] = 58'h1968261638a8efd;
    stim[31] = 58'h1cbae4ecc1165ab;
    stim[32] = 58'h3f58cb93b73f5c4;
    stim[33] = 58'h0df238805cbb7c5;
    stim[34] = 58'h0b66761ef572c89;
    stim[35] = 58'h0a169fa35ba52e6;
    stim[36] = 58'h1c8b5ecb20d8842;
    stim[37] = 58'h2306d25dedc18b4;
    stim[38] = 58'h39ecef24c379a35;
    stim[39] = 58'h2b6013fe506ab6f;
    stim[40] = 58'h34d2e013df5ae28;
    stim[41] = 58'h16c78721274c17f;
    stim[42] = 58'h24e422850adec23;
    stim[43] = 58'h06072054765b5ed;
    stim[44] = 58'h3060c9f764cecfd;
    stim[45] = 58'h0f30a6797224909;
    stim[46] = 58'h18ded442925477a;
    stim[47] = 58'h37322580735fe9b;
    stim[48] = 58'h281d40d2cb0eb72;
    stim[49] = 58'h38805df68348002;
    stim[50] = 58'h10d68f4c632ab34;
    stim[51] = 58'h14906791fbd4e29;
    stim[52] = 58'h002e6e58f176790;
    stim[53] = 58'h0c43daa575bc6cb;
    stim[54] = 58'h20079837f983a07;
    stim[55] = 58'h0658e419cfff1b1;
    stim[56] = 58'h3b03ccdb325f2a9;
    stim[57] = 58'h2d4bf81cb2437e7;
    stim[58] = 58'h1d965a8458af454;
    stim[59] = 58'h2dc728cb4e21e65;
    stim[60] = 58'h13f62c16ea522d0;
    stim[61] = 58'h0d96ac12f2560b5;
    stim[62] = 58'h32741d1c8245c5b;
    stim[63] = 58'h0af3b744e36fc6a;
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
      expv[0] = 32'hd1000000;
      expv[1] = 32'hc50f5942;
      expv[2] = 32'h97000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h904b9ef1;
      expv[6] = 32'h83edc2c9;
      expv[7] = 32'h00000000;
      expv[8] = 32'hb4000000;
      expv[9] = 32'h67bf8fcb;
      expv[10] = 32'hc677bdaf;
      expv[11] = 32'hf3000000;
      expv[12] = 32'hb8000000;
      expv[13] = 32'h119441b5;
      expv[14] = 32'h3ada0000;
      expv[15] = 32'h79e3f882;
      expv[16] = 32'h1dd29f0c;
      expv[17] = 32'h81f517e1;
      expv[18] = 32'h2a943f59;
      expv[19] = 32'h00000000;
      expv[20] = 32'hd16a0000;
      expv[21] = 32'hc68d0600;
      expv[22] = 32'hcd000000;
      expv[23] = 32'h08360000;
      expv[24] = 32'h69000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'hf248e6b4;
      expv[27] = 32'h7f000000;
      expv[28] = 32'h78aae319;
      expv[29] = 32'h65890000;
      expv[30] = 32'hbf000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'hfd630000;
      expv[33] = 32'hf1000000;
      expv[34] = 32'h22000000;
      expv[35] = 32'h7e8d6e94;
      expv[36] = 32'h7b2c8362;
      expv[37] = 32'h8c1b0000;
      expv[38] = 32'h8d000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'hd34b0000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h7b000000;
      expv[44] = 32'h3f000000;
      expv[45] = 32'h42000000;
      expv[46] = 32'h510a4951;
      expv[47] = 32'h00000000;
      expv[48] = 32'h034b2c3a;
      expv[49] = 32'h77da0d20;
      expv[50] = 32'h435a0000;
      expv[51] = 32'h8a000000;
      expv[52] = 32'h00b90000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h6c000000;
      expv[56] = 32'haa000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h76590000;
      expv[59] = 32'h99000000;
      expv[60] = 32'h4fd80000;
      expv[61] = 32'h2d000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'hdd138dbf;
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
