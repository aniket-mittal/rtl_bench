// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 38;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_222717 dut (
    .clk(clk),
    .reset(in_vec[66:66]),
    .mi_access(in_vec[65:65]),
    .mi_write(in_vec[64:64]),
    .mi_addr(in_vec[63:44]),
    .mi_data_in(in_vec[43:12]),
    .erx_rdfifo_access(in_vec[11:11]),
    .erx_rdfifo_wait(in_vec[10:10]),
    .erx_wrfifo_access(in_vec[9:9]),
    .erx_wrfifo_wait(in_vec[8:8]),
    .erx_wbfifo_access(in_vec[7:7]),
    .erx_wbfifo_wait(in_vec[6:6]),
    .etx_rdfifo_access(in_vec[5:5]),
    .etx_rdfifo_wait(in_vec[4:4]),
    .etx_wrfifo_access(in_vec[3:3]),
    .etx_wrfifo_wait(in_vec[2:2]),
    .etx_wbfifo_access(in_vec[1:1]),
    .etx_wbfifo_wait(in_vec[0:0]),
    .mi_data_out(out_vec[37:6]),
    .emon_zero_flag(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h7534b52682fb78a1f;
    stim[1] = 67'h5a44eb3159864f5f9;
    stim[2] = 67'h06907ab02a9b2f05a;
    stim[3] = 67'h1cdddc02a8b5e6ebf;
    stim[4] = 67'h3ff5c1e80c3480719;
    stim[5] = 67'h3b9a3dce7a0219364;
    stim[6] = 67'h0a7cd09f904c9a4a3;
    stim[7] = 67'h3b9b13b45e5b6c7c7;
    stim[8] = 67'h0b4f0374525be4f52;
    stim[9] = 67'h5bfb3b8bfe3b6fe71;
    stim[10] = 67'h2ea654e44b2003b71;
    stim[11] = 67'h2ffd49e3fa42c5eac;
    stim[12] = 67'h10b445d721fe6cc37;
    stim[13] = 67'h74932eee5fe9e1212;
    stim[14] = 67'h027a5fe23407f5dd4;
    stim[15] = 67'h2f5f41600576f496b;
    stim[16] = 67'h2dccd085f9f34724b;
    stim[17] = 67'h2f23019a62977b6e1;
    stim[18] = 67'h26b38629838ebe31b;
    stim[19] = 67'h20fc1d08796270b98;
    stim[20] = 67'h39050de11f470813a;
    stim[21] = 67'h2118ce675e3ed6601;
    stim[22] = 67'h0641b869933cfd33f;
    stim[23] = 67'h0613753675aeb845c;
    stim[24] = 67'h29fe11a32db179b4c;
    stim[25] = 67'h0c1cd3968bd63c9d7;
    stim[26] = 67'h3dfede851151ea973;
    stim[27] = 67'h2d77e878e02b8ecdb;
    stim[28] = 67'h09c173733ee1addbe;
    stim[29] = 67'h24eaee739651e7806;
    stim[30] = 67'h11ceee4d438376f13;
    stim[31] = 67'h239e970eb959784eb;
    stim[32] = 67'h09108f2506cccea64;
    stim[33] = 67'h0af59d4c3ea6868c7;
    stim[34] = 67'h2944769985ce73c7f;
    stim[35] = 67'h01bb9a69a30a0f56e;
    stim[36] = 67'h19a0eb71c89f05db6;
    stim[37] = 67'h2927e533903ba0115;
    stim[38] = 67'h14f4cf7f11e1d7fba;
    stim[39] = 67'h1ca3af733329cb7c9;
    stim[40] = 67'h0cb1989c9ddac4032;
    stim[41] = 67'h10fe7a7e2146bc015;
    stim[42] = 67'h163632471a6e891c1;
    stim[43] = 67'h01d554bb7a362488e;
    stim[44] = 67'h235e831fc2b9b4175;
    stim[45] = 67'h2385135dd68b52643;
    stim[46] = 67'h1b36ac81ce8a1670e;
    stim[47] = 67'h29f990e2479d5f87c;
    stim[48] = 67'h34966d2424c905223;
    stim[49] = 67'h18f90035a0f2c2966;
    stim[50] = 67'h2a5c469728c3570e4;
    stim[51] = 67'h1503f7c7a87255b9f;
    stim[52] = 67'h06ab1f88956f58592;
    stim[53] = 67'h3e84e8a70f5bde9e9;
    stim[54] = 67'h3dd259fb1ddc0ccb2;
    stim[55] = 67'h1f5c82443473fad4d;
    stim[56] = 67'h1ee4224df510c6350;
    stim[57] = 67'h32c222b284ee732ed;
    stim[58] = 67'h13e940ebdfb9835ed;
    stim[59] = 67'h3cba01b3028f8ee72;
    stim[60] = 67'h3fecaf4d34b8727ac;
    stim[61] = 67'h03057d8414aeab3ed;
    stim[62] = 67'h2fa5f6c208643bdb7;
    stim[63] = 67'h32ffc97c1412f66a2;
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
      expv[0] = 38'hxxxxxxxxxx;
      expv[1] = 38'h00000000xx;
      expv[2] = 38'h00000000xx;
      expv[3] = 38'h0000000000;
      expv[4] = 38'h0000000000;
      expv[5] = 38'h0000000039;
      expv[6] = 38'h0000000002;
      expv[7] = 38'h0000000002;
      expv[8] = 38'h0000000020;
      expv[9] = 38'h0000000026;
      expv[10] = 38'h0000000026;
      expv[11] = 38'hxxxxxxxxx0;
      expv[12] = 38'hxxxxxxxxxa;
      expv[13] = 38'hxxxxxxxxx1;
      expv[14] = 38'h0000000011;
      expv[15] = 38'h0000000000;
      expv[16] = 38'h3a030d2005;
      expv[17] = 38'hxxxxxxxxx0;
      expv[18] = 38'h3a030d2020;
      expv[19] = 38'hxxxxxxxxx4;
      expv[20] = 38'hxxxxxxxxx2;
      expv[21] = 38'hxxxxxxxxx2;
      expv[22] = 38'hxxxxxxxxx8;
      expv[23] = 38'hxxxxxxxxx0;
      expv[24] = 38'hxxxxxxxxxa;
      expv[25] = 38'hxxxxxxxxx0;
      expv[26] = 38'hxxxxxxxxx2;
      expv[27] = 38'hxxxxxxxxx4;
      expv[28] = 38'hxxxxxxxxx8;
      expv[29] = 38'hxxxxxxxxx5;
      expv[30] = 38'hxxxxxxxxx9;
      expv[31] = 38'hxxxxxxxxx0;
      expv[32] = 38'hxxxxxxxxx3;
      expv[33] = 38'hxxxxxxxxx4;
      expv[34] = 38'hxxxxxxxxx0;
      expv[35] = 38'hxxxxxxxxx4;
      expv[36] = 38'hxxxxxxxxx9;
      expv[37] = 38'hxxxxxxxxx0;
      expv[38] = 38'hxxxxxxxxx9;
      expv[39] = 38'hxxxxxxxxx0;
      expv[40] = 38'hxxxxxxxxxb;
      expv[41] = 38'hxxxxxxxxx6;
      expv[42] = 38'hxxxxxxxxx8;
      expv[43] = 38'hxxxxxxxxx0;
      expv[44] = 38'hxxxxxxxxx4;
      expv[45] = 38'hxxxxxxxxx0;
      expv[46] = 38'h2d1796db08;
      expv[47] = 38'h2d1796db20;
      expv[48] = 38'hxxxxxxxxx2;
      expv[49] = 38'hxxxxxxxxx8;
      expv[50] = 38'hxxxxxxxxx0;
      expv[51] = 38'hxxxxxxxxx0;
      expv[52] = 38'hxxxxxxxxx4;
      expv[53] = 38'hxxxxxxxxx2;
      expv[54] = 38'hxxxxxxxxx0;
      expv[55] = 38'hxxxxxxxxx4;
      expv[56] = 38'hxxxxxxxxx9;
      expv[57] = 38'hxxxxxxxxx1;
      expv[58] = 38'hxxxxxxxxx2;
      expv[59] = 38'hxxxxxxxxx4;
      expv[60] = 38'hxxxxxxxxx4;
      expv[61] = 38'hxxxxxxxxx9;
      expv[62] = 38'hxxxxxxxxx2;
      expv[63] = 38'hxxxxxxxxx6;
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
