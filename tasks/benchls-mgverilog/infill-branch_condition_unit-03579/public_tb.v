// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03579 dut (
    .I_dataA(in_vec[67:36]),
    .I_dataB(in_vec[35:4]),
    .I_branchOp(in_vec[3:1]),
    .I_Cin(in_vec[0:0]),
    .O_doBranch(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'he5b8cc1e9e31fd14e;
    stim[1] = 68'h9e754f058dfd83c2d;
    stim[2] = 68'h207c63ce068a4bd4a;
    stim[3] = 68'ha3f2cfc0681e76323;
    stim[4] = 68'hb15c55d6e73f71578;
    stim[5] = 68'h030f4ca8e06852b52;
    stim[6] = 68'h1bbf050dafb2bde25;
    stim[7] = 68'h9868d86799d4da59c;
    stim[8] = 68'hddb2c031e1280f4b6;
    stim[9] = 68'h2efabf19d48c33779;
    stim[10] = 68'h2f10e004c004fa5c2;
    stim[11] = 68'h01f0a649fe36c145a;
    stim[12] = 68'h78bca4be80105999d;
    stim[13] = 68'hc2df176e642620cdb;
    stim[14] = 68'h0d7ed16ffc8838228;
    stim[15] = 68'h331c15085a4ecf191;
    stim[16] = 68'h61cbff16a37c083d5;
    stim[17] = 68'h9de9708054121b0bf;
    stim[18] = 68'h310a144374bfaa70e;
    stim[19] = 68'h7ea214a1e1c63fb73;
    stim[20] = 68'haa7e0b2c3a417afbc;
    stim[21] = 68'h2e792243ac35c6d78;
    stim[22] = 68'ha1c5f0c9fbab74a68;
    stim[23] = 68'h35409bf69fb2d5f04;
    stim[24] = 68'h1d89309ac5f55ae68;
    stim[25] = 68'h806fece18ddd4e15e;
    stim[26] = 68'h88bebec7c17170148;
    stim[27] = 68'haf5f3ed79afa253b6;
    stim[28] = 68'h6f4ab06bcf6180ef0;
    stim[29] = 68'h63e1f6d0e56523983;
    stim[30] = 68'h2b6ee0dc0e12ec408;
    stim[31] = 68'h80b7e64e403b13492;
    stim[32] = 68'h9592c3ba5774df5a3;
    stim[33] = 68'h6ecc3ef8fbfde590b;
    stim[34] = 68'had9934aa24b715aa8;
    stim[35] = 68'h6b26c84cb09447e4d;
    stim[36] = 68'hc40b0c1472a8c2ad1;
    stim[37] = 68'hc10e7dacdf2160217;
    stim[38] = 68'h5573ed5fd24a03f97;
    stim[39] = 68'ha632521203044dbc1;
    stim[40] = 68'h11071d07168e19699;
    stim[41] = 68'h4f303967b293b8acd;
    stim[42] = 68'h2f9ba7e3145fb8d2c;
    stim[43] = 68'ha48c7cd9264a743d3;
    stim[44] = 68'he4dd136a21730084b;
    stim[45] = 68'hf2ab97dcbd93c51e4;
    stim[46] = 68'hcab69bb9ddcc0aee7;
    stim[47] = 68'h91da8448c6366903b;
    stim[48] = 68'h2814e157ec55f138f;
    stim[49] = 68'h20dfeab92f548a797;
    stim[50] = 68'h8425b4003a084f163;
    stim[51] = 68'h3f415f2a51c2dbabe;
    stim[52] = 68'heddc6894713f39c21;
    stim[53] = 68'h48b88aca63a8677de;
    stim[54] = 68'h9a5bd8cc153ab4a15;
    stim[55] = 68'h54c51422f9608d3cc;
    stim[56] = 68'h7f4d508a3483c3269;
    stim[57] = 68'hfffede062268dc740;
    stim[58] = 68'h76db4b18c87865fef;
    stim[59] = 68'h20f34e2224604b257;
    stim[60] = 68'h98fdd90812ece31c6;
    stim[61] = 68'h834737bf349b396f1;
    stim[62] = 68'hc210186d25e98f51f;
    stim[63] = 68'h576e099ee37eacc3d;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h0;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h0;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h1;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h0;
      expv[27] = 1'h1;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h0;
      expv[35] = 1'h1;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h0;
      expv[45] = 1'h1;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h0;
      expv[56] = 1'h1;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
      expv[59] = 1'h0;
      expv[60] = 1'h1;
      expv[61] = 1'h0;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
