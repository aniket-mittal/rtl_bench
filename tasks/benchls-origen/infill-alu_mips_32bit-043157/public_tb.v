// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_043157 dut (
    .src1(in_vec[72:41]),
    .src2(in_vec[40:9]),
    .ALUOp(in_vec[8:5]),
    .shamt(in_vec[4:0]),
    .ALU_result(out_vec[32:1]),
    .Zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h1d67f8b9f9b3ebc10bc;
    stim[1] = 73'h1021ed1fdd484f4c430;
    stim[2] = 73'h1d98ebb095ac4bd4ce3;
    stim[3] = 73'h1509f9983be1e822e7a;
    stim[4] = 73'h1b184e8a3d737c1b674;
    stim[5] = 73'h01bc22d12a17651d457;
    stim[6] = 73'h053b6ec89e48b261720;
    stim[7] = 73'h05d2101141df7e12dbd;
    stim[8] = 73'h0a9d8937440ebc50ced;
    stim[9] = 73'h0e73a21b68061f37955;
    stim[10] = 73'h1aa4510ab2e471e24fb;
    stim[11] = 73'h13e13063d655908e47c;
    stim[12] = 73'h043ee10553242eb0cbf;
    stim[13] = 73'h0c6040919d5ddf95f2e;
    stim[14] = 73'h100c14af2c4a804d024;
    stim[15] = 73'h1f35d7f4744d12a38e4;
    stim[16] = 73'h1c5e8d303c668f13e45;
    stim[17] = 73'h15e7ecb584e958d8a06;
    stim[18] = 73'h1561a5ef7fbab687df2;
    stim[19] = 73'h0fb5f5cb50ad0f801b6;
    stim[20] = 73'h0d2a85d96144adecf59;
    stim[21] = 73'h124c2f0b5aed5977d99;
    stim[22] = 73'h1899da9f730707a7eb3;
    stim[23] = 73'h1e13449723af3c46b1c;
    stim[24] = 73'h0f289fdcceff388e494;
    stim[25] = 73'h0075667c0ea5877fc29;
    stim[26] = 73'h12980883c422c9f30bd;
    stim[27] = 73'h10414d0c51a0b3784ed;
    stim[28] = 73'h1f2cb8f5690200b2c89;
    stim[29] = 73'h1fade26629162b66331;
    stim[30] = 73'h0ea97769c644f6c667e;
    stim[31] = 73'h09ea78d2056a60a0d7e;
    stim[32] = 73'h0d7ace10014e9ac2d65;
    stim[33] = 73'h112ec61039413a071fe;
    stim[34] = 73'h07702064bb3a83a6702;
    stim[35] = 73'h17d18145ec3d34ee30f;
    stim[36] = 73'h197f1017f0a2e175dc4;
    stim[37] = 73'h1b4e6fe840e4b4888c6;
    stim[38] = 73'h073771b3df695865598;
    stim[39] = 73'h16e29e50bbc277e9920;
    stim[40] = 73'h06e74ad6d7ae0269317;
    stim[41] = 73'h0bd2db5c3260ed21f05;
    stim[42] = 73'h165ffb2378bc3c0c071;
    stim[43] = 73'h1a9dd1e1cfbca620277;
    stim[44] = 73'h110f4de8c7a8d42a44e;
    stim[45] = 73'h1c54db78c6114a89fd9;
    stim[46] = 73'h1787f30e2edc395bab9;
    stim[47] = 73'h11d2d2de55711d68ac8;
    stim[48] = 73'h1725657f4cbbc1056bd;
    stim[49] = 73'h161e09b75dd2a9bb902;
    stim[50] = 73'h03b26767f6ff4ffdb60;
    stim[51] = 73'h0255fe159d9d6b1b0a8;
    stim[52] = 73'h0f84c7d5152a126d94d;
    stim[53] = 73'h15d044b457cdd4e6857;
    stim[54] = 73'h005b1c7a12fcf889d4d;
    stim[55] = 73'h0f8b872707088e6203c;
    stim[56] = 73'h034f6ba6e6023594a09;
    stim[57] = 73'h0119a70193d48ea88e5;
    stim[58] = 73'h0b2c484c1436211cb40;
    stim[59] = 73'h17896604244fd38e934;
    stim[60] = 73'h048574e2d4ed2a7ecf1;
    stim[61] = 73'h127b8ecd4d072e9cdf0;
    stim[62] = 73'h12eabf4fdd3aee3b042;
    stim[63] = 73'h0c3601715d62e23f605;
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
      expv[0] = 33'h020804060;
      expv[1] = 33'h12d99dd38;
      expv[2] = 33'h0cc75d840;
      expv[3] = 33'h1fe9f9bae;
      expv[4] = 33'h1f7b7e9b6;
      expv[5] = 33'h001420110;
      expv[6] = 33'h000000000;
      expv[7] = 33'hxxxxxxxxx;
      expv[8] = 33'h1126e8000;
      expv[9] = 33'h000000001;
      expv[10] = 33'h150000000;
      expv[11] = 33'h17f5b0efc;
      expv[12] = 33'h08c1104a2;
      expv[13] = 33'h000000000;
      expv[14] = 33'h03c194622;
      expv[15] = 33'h135d7f460;
      expv[16] = 33'h1c468d102;
      expv[17] = 33'h1ad1458e2;
      expv[18] = 33'hxxxxxxxxx;
      expv[19] = 33'hxxxxxxxxx;
      expv[20] = 33'h000000001;
      expv[21] = 33'hxxxxxxxxx;
      expv[22] = 33'h046020400;
      expv[23] = 33'h00000001e;
      expv[24] = 33'h01d7a7528;
      expv[25] = 33'h11cfdefc4;
      expv[26] = 33'h0945360c2;
      expv[27] = 33'h09a188000;
      expv[28] = 33'h162eb847a;
      expv[29] = 33'h000000000;
      expv[30] = 33'h0eedf7efe;
      expv[31] = 33'hxxxxxxxxx;
      expv[32] = 33'hxxxxxxxxx;
      expv[33] = 33'hxxxxxxxxx;
      expv[34] = 33'h01dc08192;
      expv[35] = 33'h00002fa30;
      expv[36] = 33'hxxxxxxxxx;
      expv[37] = 33'h000000002;
      expv[38] = 33'hxxxxxxxxx;
      expv[39] = 33'h000000000;
      expv[40] = 33'h0000000dc;
      expv[41] = 33'h005e96dae;
      expv[42] = 33'h1effff2f6;
      expv[43] = 33'h1fbdf7e1e;
      expv[44] = 33'h010844284;
      expv[45] = 33'hxxxxxxxxx;
      expv[46] = 33'h002004a04;
      expv[47] = 33'h000000002;
      expv[48] = 33'h00401a808;
      expv[49] = 33'h0587826dc;
      expv[50] = 33'hxxxxxxxxx;
      expv[51] = 33'h002200e06;
      expv[52] = 33'h000000001;
      expv[53] = 33'h15c044a40;
      expv[54] = 33'h000000001;
      expv[55] = 33'h0882f8c50;
      expv[56] = 33'h0951a13b8;
      expv[57] = 33'h0334e0300;
      expv[58] = 33'h000000001;
      expv[59] = 33'h000000000;
      expv[60] = 33'h09c580000;
      expv[61] = 33'hxxxxxxxxx;
      expv[62] = 33'h102aae0b0;
      expv[63] = 33'h0998e3b0a;
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
