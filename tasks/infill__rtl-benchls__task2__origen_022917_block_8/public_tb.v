// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 90;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_022917 dut (
    .CLK(clk),
    .RST_N(in_vec[10:10]),
    .ADDR_IN(in_vec[9:0]),
    .ADDR0(out_vec[89:80]),
    .ADDR1(out_vec[79:70]),
    .ADDR2(out_vec[69:60]),
    .ADDR3(out_vec[59:50]),
    .ADDR4(out_vec[49:40]),
    .ADDR5(out_vec[39:30]),
    .ADDR6(out_vec[29:20]),
    .ADDR7(out_vec[19:10]),
    .ADDR8(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h377;
    stim[1] = 11'h1f0;
    stim[2] = 11'h62b;
    stim[3] = 11'h69f;
    stim[4] = 11'h744;
    stim[5] = 11'h509;
    stim[6] = 11'h4a1;
    stim[7] = 11'h3d5;
    stim[8] = 11'h5d7;
    stim[9] = 11'h5f5;
    stim[10] = 11'h507;
    stim[11] = 11'h704;
    stim[12] = 11'h3f1;
    stim[13] = 11'h453;
    stim[14] = 11'h6c5;
    stim[15] = 11'h7f9;
    stim[16] = 11'h4ff;
    stim[17] = 11'h7ba;
    stim[18] = 11'h756;
    stim[19] = 11'h4f8;
    stim[20] = 11'h684;
    stim[21] = 11'h55b;
    stim[22] = 11'h7ab;
    stim[23] = 11'h79d;
    stim[24] = 11'h46e;
    stim[25] = 11'h71c;
    stim[26] = 11'h6c5;
    stim[27] = 11'h5b8;
    stim[28] = 11'h4a0;
    stim[29] = 11'h622;
    stim[30] = 11'h636;
    stim[31] = 11'h461;
    stim[32] = 11'h5fb;
    stim[33] = 11'h436;
    stim[34] = 11'h63e;
    stim[35] = 11'h591;
    stim[36] = 11'h43d;
    stim[37] = 11'h43f;
    stim[38] = 11'h67d;
    stim[39] = 11'h798;
    stim[40] = 11'h6c8;
    stim[41] = 11'h5cb;
    stim[42] = 11'h7c7;
    stim[43] = 11'h7a9;
    stim[44] = 11'h6a3;
    stim[45] = 11'h767;
    stim[46] = 11'h4bb;
    stim[47] = 11'h5ff;
    stim[48] = 11'h64c;
    stim[49] = 11'h6c2;
    stim[50] = 11'h58a;
    stim[51] = 11'h5da;
    stim[52] = 11'h513;
    stim[53] = 11'h72c;
    stim[54] = 11'h577;
    stim[55] = 11'h4c4;
    stim[56] = 11'h64e;
    stim[57] = 11'h7e2;
    stim[58] = 11'h7b4;
    stim[59] = 11'h4e0;
    stim[60] = 11'h48d;
    stim[61] = 11'h4fa;
    stim[62] = 11'h4b9;
    stim[63] = 11'h7dc;
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
      expv[0] = 90'h00000000000000000000000;
      expv[1] = 90'h00000000000000000000000;
      expv[2] = 90'h00000000000000000000000;
      expv[3] = 90'h22b00000000000000000000;
      expv[4] = 90'h29f8ac00000000000000000;
      expv[5] = 90'h344a7e2b000000000000000;
      expv[6] = 90'h109d129f8ac000000000000;
      expv[7] = 90'h00000000000000000000000;
      expv[8] = 90'h00000000000000000000000;
      expv[9] = 90'h1d700000000000000000000;
      expv[10] = 90'h1f575c00000000000000000;
      expv[11] = 90'h1077d5d7000000000000000;
      expv[12] = 90'h00000000000000000000000;
      expv[13] = 90'h00000000000000000000000;
      expv[14] = 90'h05300000000000000000000;
      expv[15] = 90'h2c514c00000000000000000;
      expv[16] = 90'h3f9b1453000000000000000;
      expv[17] = 90'h0fffe6c514c000000000000;
      expv[18] = 90'h3ba3fff9b14530000000000;
      expv[19] = 90'h356ee8fffe6c514c0000000;
      expv[20] = 90'h0f8d5bba3fff9b145300000;
      expv[21] = 90'h2843e356ee8fffe6c514c00;
      expv[22] = 90'h15ba10f8d5bba3fff9b1453;
      expv[23] = 90'h3ab56e843e356ee8fffe6c5;
      expv[24] = 90'h39dead5ba10f8d5bba3fff9;
      expv[25] = 90'h06ee77ab56e843e356ee8ff;
      expv[26] = 90'h31c1bb9dead5ba10f8d5bba;
      expv[27] = 90'h2c5c706ee77ab56e843e356;
      expv[28] = 90'h1b8b171c1bb9dead5ba10f8;
      expv[29] = 90'h0a06e2c5c706ee77ab56e84;
      expv[30] = 90'h222281b8b171c1bb9dead5b;
      expv[31] = 90'h236888a06e2c5c706ee77ab;
      expv[32] = 90'h0618da22281b8b171c1bb9d;
      expv[33] = 90'h1fb18636888a06e2c5c706e;
      expv[34] = 90'h0367ec618da22281b8b171c;
      expv[35] = 90'h23e0d9fb18636888a06e2c5;
      expv[36] = 90'h1918f8367ec618da22281b8;
      expv[37] = 90'h03d6463e0d9fb18636888a0;
      expv[38] = 90'h03f0f5918f8367ec618da22;
      expv[39] = 90'h27d0fc3d6463e0d9fb18636;
      expv[40] = 90'h3989f43f0f5918f8367ec61;
      expv[41] = 90'h2c8e627d0fc3d6463e0d9fb;
      expv[42] = 90'h1cbb23989f43f0f5918f836;
      expv[43] = 90'h3c772ec8e627d0fc3d6463e;
      expv[44] = 90'h3a9f1dcbb23989f43f0f591;
      expv[45] = 90'h2a3ea7c772ec8e627d0fc3d;
      expv[46] = 90'h367a8fa9f1dcbb23989f43f;
      expv[47] = 90'h0bbd9ea3ea7c772ec8e627d;
      expv[48] = 90'h1ff2ef67a8fa9f1dcbb2398;
      expv[49] = 90'h24c7fcbbd9ea3ea7c772ec8;
      expv[50] = 90'h2c2931ff2ef67a8fa9f1dcb;
      expv[51] = 90'h18ab0a4c7fcbbd9ea3ea7c7;
      expv[52] = 90'h1da62ac2931ff2ef67a8fa9;
      expv[53] = 90'h1137698ab0a4c7fcbbd9ea3;
      expv[54] = 90'h32c44dda62ac2931ff2ef67;
      expv[55] = 90'h177cb1137698ab0a4c7fcbb;
      expv[56] = 90'h0c45df2c44dda62ac2931ff;
      expv[57] = 90'h24e31177cb1137698ab0a4c;
      expv[58] = 90'h3e2938c45df2c44dda62ac2;
      expv[59] = 90'h3b4f8a4e31177cb1137698a;
      expv[60] = 90'h0e0ed3e2938c45df2c44dda;
      expv[61] = 90'h08d383b4f8a4e31177cb113;
      expv[62] = 90'h0fa234e0ed3e2938c45df2c;
      expv[63] = 90'h0b93e88d383b4f8a4e31177;
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
