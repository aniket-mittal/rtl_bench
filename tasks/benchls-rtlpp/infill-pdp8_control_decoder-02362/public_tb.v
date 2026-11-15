// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02362 dut (
    .ck1(in_vec[14:14]),
    .ck2(in_vec[13:13]),
    .ck3(in_vec[12:12]),
    .ck4(in_vec[11:11]),
    .stb1(in_vec[10:10]),
    .stb2(in_vec[9:9]),
    .stb3(in_vec[8:8]),
    .doSkip(in_vec[7:7]),
    .opr1(in_vec[6:6]),
    .opr2(in_vec[5:5]),
    .opr3(in_vec[4:4]),
    .oprCLA(in_vec[3:3]),
    .oprMQA(in_vec[2:2]),
    .oprMQL(in_vec[1:1]),
    .oprSCA(in_vec[0:0]),
    .ac_ck(out_vec[9:9]),
    .cla(out_vec[8:8]),
    .done(out_vec[7:7]),
    .link_ck(out_vec[6:6]),
    .mq_ck(out_vec[5:5]),
    .mq2orbus(out_vec[4:4]),
    .pc_ck(out_vec[3:3]),
    .rot2ac(out_vec[2:2]),
    .mq_tmpLatch(out_vec[1:1]),
    .mq_tmpOE(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h5cca;
    stim[1] = 15'h72ca;
    stim[2] = 15'h027b;
    stim[3] = 15'h2866;
    stim[4] = 15'h26c1;
    stim[5] = 15'h7923;
    stim[6] = 15'h140c;
    stim[7] = 15'h6d3e;
    stim[8] = 15'h19a9;
    stim[9] = 15'h305b;
    stim[10] = 15'h415c;
    stim[11] = 15'h1982;
    stim[12] = 15'h4007;
    stim[13] = 15'h44f2;
    stim[14] = 15'h287a;
    stim[15] = 15'h06ea;
    stim[16] = 15'h5cac;
    stim[17] = 15'h782e;
    stim[18] = 15'h61fb;
    stim[19] = 15'h4a92;
    stim[20] = 15'h3a5c;
    stim[21] = 15'h10d6;
    stim[22] = 15'h756c;
    stim[23] = 15'h694f;
    stim[24] = 15'h28e6;
    stim[25] = 15'h25ae;
    stim[26] = 15'h12e4;
    stim[27] = 15'h5d80;
    stim[28] = 15'h2fe9;
    stim[29] = 15'h0eea;
    stim[30] = 15'h65a5;
    stim[31] = 15'h1cf8;
    stim[32] = 15'h1639;
    stim[33] = 15'h5724;
    stim[34] = 15'h7570;
    stim[35] = 15'h1c5a;
    stim[36] = 15'h6bd8;
    stim[37] = 15'h5714;
    stim[38] = 15'h1002;
    stim[39] = 15'h1ca4;
    stim[40] = 15'h64dd;
    stim[41] = 15'h61db;
    stim[42] = 15'h146c;
    stim[43] = 15'h3ee9;
    stim[44] = 15'h2cd2;
    stim[45] = 15'h79b6;
    stim[46] = 15'h653c;
    stim[47] = 15'h681b;
    stim[48] = 15'h5c25;
    stim[49] = 15'h5bee;
    stim[50] = 15'h2ca0;
    stim[51] = 15'h7a5b;
    stim[52] = 15'h0534;
    stim[53] = 15'h76dc;
    stim[54] = 15'h4fbe;
    stim[55] = 15'h32e9;
    stim[56] = 15'h4b08;
    stim[57] = 15'h0704;
    stim[58] = 15'h7c2c;
    stim[59] = 15'h7824;
    stim[60] = 15'h2fb8;
    stim[61] = 15'h5fbe;
    stim[62] = 15'h7133;
    stim[63] = 15'h1334;
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
      expv[0] = 10'h244;
      expv[1] = 10'h084;
      expv[2] = 10'h200;
      expv[3] = 10'h084;
      expv[4] = 10'h2c0;
      expv[5] = 10'h084;
      expv[6] = 10'h000;
      expv[7] = 10'h1b6;
      expv[8] = 10'h080;
      expv[9] = 10'h080;
      expv[10] = 10'h114;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h26c;
      expv[14] = 10'h084;
      expv[15] = 10'h248;
      expv[16] = 10'h08c;
      expv[17] = 10'h084;
      expv[18] = 10'h084;
      expv[19] = 10'h204;
      expv[20] = 10'h080;
      expv[21] = 10'h105;
      expv[22] = 10'h2c4;
      expv[23] = 10'h084;
      expv[24] = 10'h084;
      expv[25] = 10'h00c;
      expv[26] = 10'h280;
      expv[27] = 10'h000;
      expv[28] = 10'h2cc;
      expv[29] = 10'h248;
      expv[30] = 10'h00c;
      expv[31] = 10'h2c8;
      expv[32] = 10'h280;
      expv[33] = 10'h284;
      expv[34] = 10'h2c4;
      expv[35] = 10'h2c0;
      expv[36] = 10'h084;
      expv[37] = 10'h214;
      expv[38] = 10'h000;
      expv[39] = 10'h088;
      expv[40] = 10'h2c4;
      expv[41] = 10'h084;
      expv[42] = 10'h2c0;
      expv[43] = 10'h2cc;
      expv[44] = 10'h3e4;
      expv[45] = 10'h1b5;
      expv[46] = 10'h394;
      expv[47] = 10'h000;
      expv[48] = 10'h084;
      expv[49] = 10'h284;
      expv[50] = 10'h00c;
      expv[51] = 10'h084;
      expv[52] = 10'h200;
      expv[53] = 10'h3d4;
      expv[54] = 10'h2ae;
      expv[55] = 10'h284;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h084;
      expv[59] = 10'h084;
      expv[60] = 10'h28c;
      expv[61] = 10'h3af;
      expv[62] = 10'h084;
      expv[63] = 10'h280;
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
