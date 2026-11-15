// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 75;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00988 dut (
    .clk(clk),
    .reset(in_vec[74:74]),
    .sample_clk_en(in_vec[73:73]),
    .op_num(in_vec[72:69]),
    .phase_acc(in_vec[68:47]),
    .phase_acc_17(in_vec[46:25]),
    .phase_acc_13(in_vec[24:3]),
    .op_type(in_vec[2:0]),
    .rhythm_phase(out_vec[21:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 75'h797db77ad3e96a6369d;
    stim[1] = 75'h4903779de80e1d95ec4;
    stim[2] = 75'h3bab0fb0543582fb70f;
    stim[3] = 75'h05905cbd748f13e7448;
    stim[4] = 75'h0db6b7a1a19b26db6e0;
    stim[5] = 75'h23e9c4ce198da72cc04;
    stim[6] = 75'h34638221c5a1d7666ea;
    stim[7] = 75'h1434fbd435bb29dd4b4;
    stim[8] = 75'h2b10459f3eaf10d2172;
    stim[9] = 75'h0d1d7aced611668cf56;
    stim[10] = 75'h2098ceb776ed5a9979c;
    stim[11] = 75'h385f89a85e2130776fe;
    stim[12] = 75'h06b87ea4dad2c284f02;
    stim[13] = 75'h3500ae9a05ff2b74fb2;
    stim[14] = 75'h10ce8e1aee51516d40e;
    stim[15] = 75'h37bf8542c2f251951d7;
    stim[16] = 75'h17d061ac1bc5dc667e0;
    stim[17] = 75'h37070a35025dbd82d87;
    stim[18] = 75'h243748f38a24d6ca1f9;
    stim[19] = 75'h134be89646f8fcde7c6;
    stim[20] = 75'h1ae7d350e4355757ccf;
    stim[21] = 75'h1edee56b1140b8a5f44;
    stim[22] = 75'h3738b2200ad7d92f6eb;
    stim[23] = 75'h39bee8e245d4c9d2a27;
    stim[24] = 75'h37318ac3e2d1c92be8f;
    stim[25] = 75'h0edd369a6547b022a51;
    stim[26] = 75'h28ae18a3280fef986f2;
    stim[27] = 75'h275cf087703fb27f636;
    stim[28] = 75'h16cacca51752c2a7250;
    stim[29] = 75'h092bcedcba4eb07ab65;
    stim[30] = 75'h03c9de2f7cbe5c26b7d;
    stim[31] = 75'h18234efcecc8eda3be9;
    stim[32] = 75'h2045e3ad4c67aadcc10;
    stim[33] = 75'h4156ca02a4533a6b82a;
    stim[34] = 75'h1358b4f84165a1e3cca;
    stim[35] = 75'h0e3797192a0c9e4124c;
    stim[36] = 75'h1efc54581d68906f809;
    stim[37] = 75'h0f5c3810d135abef2d2;
    stim[38] = 75'h2783e4766f9cca35f15;
    stim[39] = 75'h2a518c9dae0a155cff2;
    stim[40] = 75'h38e57439f687a7dbf13;
    stim[41] = 75'h054c9de843f406292ca;
    stim[42] = 75'h3ef7f3bb7a570e124d4;
    stim[43] = 75'h2f46675f93c516cb4c4;
    stim[44] = 75'h3ad976541c74b76635b;
    stim[45] = 75'h0a314c4c0a158788969;
    stim[46] = 75'h168af6eb55132aef518;
    stim[47] = 75'h16e5891ad19f23ef5dc;
    stim[48] = 75'h28e59eff2dbd3ba02e0;
    stim[49] = 75'h28d31fd6b298f87e19a;
    stim[50] = 75'h006eb1a14de7ab725fe;
    stim[51] = 75'h2f7dbbc42dd51150c23;
    stim[52] = 75'h33ee53e6b0c9af5c193;
    stim[53] = 75'h0045608d4d0e2176905;
    stim[54] = 75'h2b65ceaca445282c8a9;
    stim[55] = 75'h1588d1c109e5da06ac6;
    stim[56] = 75'h0c738de817a5f7f6973;
    stim[57] = 75'h1dce04f48346016f1c9;
    stim[58] = 75'h1f7b31ddfd6275e01dd;
    stim[59] = 75'h2ba1c6c1203c1454d73;
    stim[60] = 75'h3f05d039ca506f7a84b;
    stim[61] = 75'h222f153c04cba1cb28d;
    stim[62] = 75'h1d53a2ed8de31c210e1;
    stim[63] = 75'h1de0c4013e01893680a;
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
      expv[0] = 22'h2fb6ef;
      expv[1] = 22'h206ef3;
      expv[2] = 22'h3561f6;
      expv[3] = 22'h08d000;
      expv[4] = 22'h034000;
      expv[5] = 22'h3d3899;
      expv[6] = 22'h0c0000;
      expv[7] = 22'h069f7a;
      expv[8] = 22'h0c0000;
      expv[9] = 22'h23af59;
      expv[10] = 22'h1319d6;
      expv[11] = 22'h0bf135;
      expv[12] = 22'h0c0000;
      expv[13] = 22'h0c0000;
      expv[14] = 22'h19d1c3;
      expv[15] = 22'h37f0a8;
      expv[16] = 22'h08d000;
      expv[17] = 22'h20e146;
      expv[18] = 22'h0c0000;
      expv[19] = 22'h297d12;
      expv[20] = 22'h1cfa6a;
      expv[21] = 22'h1bdcad;
      expv[22] = 22'h271644;
      expv[23] = 22'h37dd1c;
      expv[24] = 22'h263158;
      expv[25] = 22'h000000;
      expv[26] = 22'h0c0000;
      expv[27] = 22'h2b9e10;
      expv[28] = 22'h08d000;
      expv[29] = 22'h2579db;
      expv[30] = 22'h393bc5;
      expv[31] = 22'h0c0000;
      expv[32] = 22'h08d000;
      expv[33] = 22'h0c0000;
      expv[34] = 22'h0c0000;
      expv[35] = 22'h06f2e3;
      expv[36] = 22'h0c0000;
      expv[37] = 22'h0c0000;
      expv[38] = 22'h307c8e;
      expv[39] = 22'h0c0000;
      expv[40] = 22'h1cae87;
      expv[41] = 22'h0c0000;
      expv[42] = 22'h1efe77;
      expv[43] = 22'h28cceb;
      expv[44] = 22'h1b2eca;
      expv[45] = 22'h0c0000;
      expv[46] = 22'h08d000;
      expv[47] = 22'h1cb123;
      expv[48] = 22'h08d000;
      expv[49] = 22'h0c0000;
      expv[50] = 22'h0dd634;
      expv[51] = 22'h2fb778;
      expv[52] = 22'h3dca7c;
      expv[53] = 22'h08ac11;
      expv[54] = 22'h0c0000;
      expv[55] = 22'h311a38;
      expv[56] = 22'h0e71bd;
      expv[57] = 22'h000000;
      expv[58] = 22'h2f663b;
      expv[59] = 22'h3438d8;
      expv[60] = 22'h20ba07;
      expv[61] = 22'h05e2a7;
      expv[62] = 22'h000000;
      expv[63] = 22'h0c0000;
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
