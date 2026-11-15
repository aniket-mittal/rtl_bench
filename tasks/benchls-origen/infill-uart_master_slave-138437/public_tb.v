// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_138437 dut (
    .clk_master(clk),
    .in1(in_vec[45:38]),
    .in2(in_vec[37:30]),
    .in3(in_vec[29:22]),
    .data_in_master(in_vec[21:14]),
    .rst_master(in_vec[13:13]),
    .cs_master(in_vec[12:12]),
    .data_in_slave(in_vec[11:4]),
    .clk_slave(in_vec[3:3]),
    .rst_slave(in_vec[2:2]),
    .cs_slave(in_vec[1:1]),
    .req_slave(in_vec[0:0]),
    .data_out_master(out_vec[33:26]),
    .ready_master(out_vec[25:25]),
    .out1(out_vec[24:17]),
    .out2(out_vec[16:9]),
    .out3(out_vec[8:1]),
    .ack_slave(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h2e756750f5bc;
    stim[1] = 46'h3eb9682ab284;
    stim[2] = 46'h3f203d0b0603;
    stim[3] = 46'h0493b9c788bb;
    stim[4] = 46'h0de5ae106911;
    stim[5] = 46'h17c8cbcacfab;
    stim[6] = 46'h0046cfbc0f79;
    stim[7] = 46'h0f399a13e4b0;
    stim[8] = 46'h016a409242cb;
    stim[9] = 46'h20849e19a7a1;
    stim[10] = 46'h0bb5c5205900;
    stim[11] = 46'h2cb7757ecb42;
    stim[12] = 46'h16bd7ff3300a;
    stim[13] = 46'h32b21a914291;
    stim[14] = 46'h2af0903e65e0;
    stim[15] = 46'h12b2c707b5f8;
    stim[16] = 46'h291f05fa4c59;
    stim[17] = 46'h3a4edce2b319;
    stim[18] = 46'h3e7e452ef220;
    stim[19] = 46'h33e0d862ab3b;
    stim[20] = 46'h1185e306edd2;
    stim[21] = 46'h047d31d10c51;
    stim[22] = 46'h14f1e7b24a80;
    stim[23] = 46'h28b66902d19a;
    stim[24] = 46'h1c0174e13998;
    stim[25] = 46'h16325060dcf9;
    stim[26] = 46'h12712cc80880;
    stim[27] = 46'h2a60ef6020f9;
    stim[28] = 46'h14ddcbc3545b;
    stim[29] = 46'h0858f61ddb7a;
    stim[30] = 46'h1f3092db0862;
    stim[31] = 46'h3dcea9236512;
    stim[32] = 46'h0683e249436a;
    stim[33] = 46'h34b49dcbf5d0;
    stim[34] = 46'h37ab580a3a61;
    stim[35] = 46'h1eced8a52b3b;
    stim[36] = 46'h1713462f474b;
    stim[37] = 46'h10d866b07522;
    stim[38] = 46'h3e87a28bb4fb;
    stim[39] = 46'h279d23e34179;
    stim[40] = 46'h33042666b6d2;
    stim[41] = 46'h0f02f2ad5b23;
    stim[42] = 46'h1ea03df0596b;
    stim[43] = 46'h3344d8b91701;
    stim[44] = 46'h0f3ac698e582;
    stim[45] = 46'h0195dc8fb2a3;
    stim[46] = 46'h2d69ad93c0c0;
    stim[47] = 46'h29b34df75d79;
    stim[48] = 46'h06ed8f43d093;
    stim[49] = 46'h298a063d8d0b;
    stim[50] = 46'h23c776ba8ffb;
    stim[51] = 46'h0b821a768711;
    stim[52] = 46'h12890b67d1ab;
    stim[53] = 46'h2856ab540281;
    stim[54] = 46'h179298dba759;
    stim[55] = 46'h355841e3a530;
    stim[56] = 46'h297827bd6171;
    stim[57] = 46'h3a997147bbf9;
    stim[58] = 46'h38ebad3a779b;
    stim[59] = 46'h12517e766279;
    stim[60] = 46'h1daa88eecc9b;
    stim[61] = 46'h2128904a8f28;
    stim[62] = 46'h32aba9f43d1b;
    stim[63] = 46'h152e31afb020;
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
      expv[0] = 34'h000000000;
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
