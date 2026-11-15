// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  pipeline_add_msb dut (
    .clk(clk),
    .rst(in_vec[40:40]),
    .a(in_vec[39:20]),
    .b(in_vec[19:0]),
    .o(out_vec[20:1]),
    .msb(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h1e94f3710be;
    stim[1] = 41'h1f9f5ca9337;
    stim[2] = 41'h03743ad7d13;
    stim[3] = 41'h0e6cc41ef07;
    stim[4] = 41'h022e458d12f;
    stim[5] = 41'h05e0e1c5c49;
    stim[6] = 41'h0fd04a65151;
    stim[7] = 41'h08f7451b199;
    stim[8] = 41'h074fc0f8c3e;
    stim[9] = 41'h08c3ade442c;
    stim[10] = 41'h084f02b0f1c;
    stim[11] = 41'h0301b73949f;
    stim[12] = 41'h0c407839513;
    stim[13] = 41'h03f56c979fe;
    stim[14] = 41'h0e8b0272aab;
    stim[15] = 41'h0e65478bb16;
    stim[16] = 41'h0d96f4e739c;
    stim[17] = 41'h0364eef7eb3;
    stim[18] = 41'h0bb866d5c61;
    stim[19] = 41'h0d936e3487a;
    stim[20] = 41'h040e66dbf91;
    stim[21] = 41'h035683f5ce5;
    stim[22] = 41'h0e6fa979976;
    stim[23] = 41'h092a4838451;
    stim[24] = 41'h037e530b21e;
    stim[25] = 41'h0f47d0176be;
    stim[26] = 41'h07d1533fe0b;
    stim[27] = 41'h0489db93319;
    stim[28] = 41'h0f477aefdb2;
    stim[29] = 41'h0280ca6a3f0;
    stim[30] = 41'h0bb13fe1f46;
    stim[31] = 41'h014f401b807;
    stim[32] = 41'h06ad9c0e0b9;
    stim[33] = 41'h0a8cf596a6d;
    stim[34] = 41'h0035894c5a2;
    stim[35] = 41'h03f40f603c2;
    stim[36] = 41'h03ba898bb12;
    stim[37] = 41'h0462ac8faf5;
    stim[38] = 41'h0c92c5f728b;
    stim[39] = 41'h0262f9521b9;
    stim[40] = 41'h099ea68e200;
    stim[41] = 41'h0bccaa2ff0f;
    stim[42] = 41'h0c175f07d99;
    stim[43] = 41'h0fd4d9e647c;
    stim[44] = 41'h0226c6bbb62;
    stim[45] = 41'h0595e0a0a27;
    stim[46] = 41'h084b4260182;
    stim[47] = 41'h07185dc23a8;
    stim[48] = 41'h036ef81f6ec;
    stim[49] = 41'h0b5e64bc060;
    stim[50] = 41'h0eb7a1dbea9;
    stim[51] = 41'h0f5e35e1f39;
    stim[52] = 41'h05bcff4896d;
    stim[53] = 41'h08b51add5fa;
    stim[54] = 41'h0ec5bd2ee02;
    stim[55] = 41'h0d56286ba95;
    stim[56] = 41'h05b47c154b6;
    stim[57] = 41'h0b91226dc9f;
    stim[58] = 41'h02e5181d47e;
    stim[59] = 41'h06913b62e75;
    stim[60] = 41'h05400736de5;
    stim[61] = 41'h0baab1abc17;
    stim[62] = 41'h0a4f72619e4;
    stim[63] = 41'h06130060ead;
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
      expv[0] = 21'h000000;
      expv[1] = 21'h000000;
      expv[2] = 21'h000000;
      expv[3] = 21'h000000;
      expv[4] = 21'h01e29a;
      expv[5] = 21'h00b797;
      expv[6] = 21'h15fee8;
      expv[7] = 21'h047a54;
      expv[8] = 21'h0c4337;
      expv[9] = 21'h1551bc;
      expv[10] = 21'h0db7fc;
      expv[11] = 21'h0e0fb2;
      expv[12] = 21'h06bc3c;
      expv[13] = 21'h0d2cad;
      expv[14] = 21'h1fab17;
      expv[15] = 21'h1aded4;
      expv[16] = 21'h0b6b5a;
      expv[17] = 21'h0e40bb;
      expv[18] = 21'h181520;
      expv[19] = 21'h05c743;
      expv[20] = 21'h12298e;
      expv[21] = 21'h01b7d0;
      expv[22] = 21'h039bee;
      expv[23] = 21'h0566d0;
      expv[24] = 21'h0c123f;
      expv[25] = 21'h195d32;
      expv[26] = 21'h0860e2;
      expv[27] = 21'h017d1d;
      expv[28] = 21'h179ebd;
      expv[29] = 21'h1b79e9;
      expv[30] = 21'h1c8a59;
      expv[31] = 21'h124975;
      expv[32] = 21'h13a10a;
      expv[33] = 21'h060e8e;
      expv[34] = 21'h0f1caa;
      expv[35] = 21'h07eec4;
      expv[36] = 21'h09f657;
      expv[37] = 21'h13efa3;
      expv[38] = 21'h18eb37;
      expv[39] = 21'h1abb43;
      expv[40] = 21'h180aa0;
      expv[41] = 21'h0f0964;
      expv[42] = 21'h05014d;
      expv[43] = 21'h1d9773;
      expv[44] = 21'h1929f1;
      expv[45] = 21'h1c72ab;
      expv[46] = 21'h1bc451;
      expv[47] = 21'h1f400f;
      expv[48] = 21'h1c9988;
      expv[49] = 21'h06780a;
      expv[50] = 21'h0acbc8;
      expv[51] = 21'h0e3d89;
      expv[52] = 21'h18ec95;
      expv[53] = 21'h1afadd;
      expv[54] = 21'h148cd8;
      expv[55] = 21'h0d1628;
      expv[56] = 21'h03677e;
      expv[57] = 21'h08217a;
      expv[58] = 21'h0e1264;
      expv[59] = 21'h04db82;
      expv[60] = 21'h09732d;
      expv[61] = 21'h197f61;
      expv[62] = 21'h115bd8;
      expv[63] = 21'h0ccd90;
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
