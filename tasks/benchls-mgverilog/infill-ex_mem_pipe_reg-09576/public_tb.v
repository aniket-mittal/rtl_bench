// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 81;
  localparam OW = 78;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09576 dut (
    .clock(clk),
    .reset(in_vec[80:80]),
    .debugEnable(in_vec[79:79]),
    .debugReset(in_vec[78:78]),
    .writeRegister(in_vec[77:73]),
    .writeData(in_vec[72:41]),
    .aluOut(in_vec[40:9]),
    .regWrite(in_vec[8:8]),
    .memToReg(in_vec[7:7]),
    .memWrite(in_vec[6:3]),
    .memReadWidth(in_vec[2:1]),
    .eop(in_vec[0:0]),
    .writeRegisterOut(out_vec[77:73]),
    .writeDataOut(out_vec[72:41]),
    .aluOutOut(out_vec[40:9]),
    .regWriteOut(out_vec[8:8]),
    .memToRegOut(out_vec[7:7]),
    .memWriteOut(out_vec[6:3]),
    .memReadWidthOut(out_vec[2:1]),
    .eopOut(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 81'h1d12514726fa769e176d8;
    stim[1] = 81'h18df5eb4fe93f14109939;
    stim[2] = 81'h09b5a19438c2703e1cab7;
    stim[3] = 81'h0145c0b47615a1816b590;
    stim[4] = 81'h060656cb7559b2241a5cb;
    stim[5] = 81'h0b891400191bfedcf5472;
    stim[6] = 81'h084aed7bd62761b152e3a;
    stim[7] = 81'h0c4547edb8fa4f801208a;
    stim[8] = 81'h0e6d8a58da990ea63aa1b;
    stim[9] = 81'h0a0833b11eaa4dad38357;
    stim[10] = 81'h08e898bdd1b47e802892e;
    stim[11] = 81'h09d636413edae0ed4bb9d;
    stim[12] = 81'h0461bb7e2d853d4144104;
    stim[13] = 81'h0ca463d51663a50526b84;
    stim[14] = 81'h09fcd1f2823c01a26276e;
    stim[15] = 81'h07166e1a391507e251eb0;
    stim[16] = 81'h0298df283786ddf4366c6;
    stim[17] = 81'h009ea3c566ccbe390e5ed;
    stim[18] = 81'h0059b513fb6e3884744a4;
    stim[19] = 81'h03122980cc9e7f1db82de;
    stim[20] = 81'h0998356510830291fc1de;
    stim[21] = 81'h0b0781f2c13b48047dc53;
    stim[22] = 81'h00b6117eb2e594f2dcabd;
    stim[23] = 81'h005eec2e1dcdf216e5f2e;
    stim[24] = 81'h0549d38656e099407febc;
    stim[25] = 81'h040f312e924c63fa1342a;
    stim[26] = 81'h0170662a38c92fa0a1df9;
    stim[27] = 81'h014d5bdc88f885b2d2134;
    stim[28] = 81'h0977f4167d05815fa741c;
    stim[29] = 81'h0f36bf6a4cae6615574eb;
    stim[30] = 81'h01d1b96d33fcfd5ae6cf6;
    stim[31] = 81'h0453c33afb2841d53d8bd;
    stim[32] = 81'h003bc4bf33886857e0afe;
    stim[33] = 81'h0055b332d14ce400a44cb;
    stim[34] = 81'h029143aca2c6f4eeb268b;
    stim[35] = 81'h07b7df584fa663eb870f0;
    stim[36] = 81'h04c12e1ddf9aa88018174;
    stim[37] = 81'h07e3f3e4854fd2971c651;
    stim[38] = 81'h0d9bad094d2aeed736475;
    stim[39] = 81'h0a4780311be6139267a67;
    stim[40] = 81'h04819453bef07ddfb7e68;
    stim[41] = 81'h000f10aef5e6e1e900ee7;
    stim[42] = 81'h0d474ed15974b46630b8f;
    stim[43] = 81'h0aad4002054f8d91d339e;
    stim[44] = 81'h0d9ba18965d6e52b442e7;
    stim[45] = 81'h037e908e86b114eb59d14;
    stim[46] = 81'h03d965f54fdf0b194e05c;
    stim[47] = 81'h0bbb854aa649fe06bdc9a;
    stim[48] = 81'h061e97d87b49f5b9b34d8;
    stim[49] = 81'h0ab8b100362cfe2846fbb;
    stim[50] = 81'h0d97e42f6e5aaa556592d;
    stim[51] = 81'h0bc6dd0930bce20e177e7;
    stim[52] = 81'h07d29af6beb2e671e4235;
    stim[53] = 81'h07c01220c13ee547591ae;
    stim[54] = 81'h0e034d2b0dc55dcbfaff2;
    stim[55] = 81'h0b4e2839189d978fad5d1;
    stim[56] = 81'h022217d24f7226d8e1ef4;
    stim[57] = 81'h0476ac1b9b9cd7ace9793;
    stim[58] = 81'h0a1c06ee07bfd8c9ae9b2;
    stim[59] = 81'h0faed03f6469a3c42cd9d;
    stim[60] = 81'h0f2760b75c3447698662f;
    stim[61] = 81'h013d78790610d6eaa22f1;
    stim[62] = 81'h0b30961d0648dd4e0815d;
    stim[63] = 81'h081720b26c9150e51d6f0;
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
      expv[0] = 78'h00000000000000000000;
      expv[1] = 78'h00000000000000000000;
      expv[2] = 78'h00000000000000000000;
      expv[3] = 78'h1b5a19438c2703e1cab7;
      expv[4] = 78'h1b5a19438c2703e1cab7;
      expv[5] = 78'h00000000000000000000;
      expv[6] = 78'h3891400191bfedcf5472;
      expv[7] = 78'h04aed7bd62761b152e3a;
      expv[8] = 78'h00000000000000000000;
      expv[9] = 78'h00000000000000000000;
      expv[10] = 78'h20833b11eaa4dad38357;
      expv[11] = 78'h0e898bdd1b47e802892e;
      expv[12] = 78'h1d636413edae0ed4bb9d;
      expv[13] = 78'h00000000000000000000;
      expv[14] = 78'h00000000000000000000;
      expv[15] = 78'h1fcd1f2823c01a26276e;
      expv[16] = 78'h00000000000000000000;
      expv[17] = 78'h00000000000000000000;
      expv[18] = 78'h00000000000000000000;
      expv[19] = 78'h00000000000000000000;
      expv[20] = 78'h00000000000000000000;
      expv[21] = 78'h198356510830291fc1de;
      expv[22] = 78'h30781f2c13b48047dc53;
      expv[23] = 78'h30781f2c13b48047dc53;
      expv[24] = 78'h30781f2c13b48047dc53;
      expv[25] = 78'h00000000000000000000;
      expv[26] = 78'h00000000000000000000;
      expv[27] = 78'h00000000000000000000;
      expv[28] = 78'h00000000000000000000;
      expv[29] = 78'h177f4167d05815fa741c;
      expv[30] = 78'h00000000000000000000;
      expv[31] = 78'h00000000000000000000;
      expv[32] = 78'h00000000000000000000;
      expv[33] = 78'h00000000000000000000;
      expv[34] = 78'h00000000000000000000;
      expv[35] = 78'h00000000000000000000;
      expv[36] = 78'h00000000000000000000;
      expv[37] = 78'h00000000000000000000;
      expv[38] = 78'h00000000000000000000;
      expv[39] = 78'h00000000000000000000;
      expv[40] = 78'h24780311be6139267a67;
      expv[41] = 78'h00000000000000000000;
      expv[42] = 78'h00000000000000000000;
      expv[43] = 78'h00000000000000000000;
      expv[44] = 78'h2ad4002054f8d91d339e;
      expv[45] = 78'h00000000000000000000;
      expv[46] = 78'h00000000000000000000;
      expv[47] = 78'h00000000000000000000;
      expv[48] = 78'h3bb854aa649fe06bdc9a;
      expv[49] = 78'h00000000000000000000;
      expv[50] = 78'h2b8b100362cfe2846fbb;
      expv[51] = 78'h00000000000000000000;
      expv[52] = 78'h3c6dd0930bce20e177e7;
      expv[53] = 78'h00000000000000000000;
      expv[54] = 78'h00000000000000000000;
      expv[55] = 78'h00000000000000000000;
      expv[56] = 78'h34e2839189d978fad5d1;
      expv[57] = 78'h34e2839189d978fad5d1;
      expv[58] = 78'h00000000000000000000;
      expv[59] = 78'h21c06ee07bfd8c9ae9b2;
      expv[60] = 78'h00000000000000000000;
      expv[61] = 78'h00000000000000000000;
      expv[62] = 78'h00000000000000000000;
      expv[63] = 78'h330961d0648dd4e0815d;
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
