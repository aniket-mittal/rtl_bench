// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 47;
  localparam OW = 76;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04112 dut (
    .clk(clk),
    .reset_n(in_vec[46:46]),
    .cs(in_vec[45:45]),
    .we(in_vec[44:44]),
    .address(in_vec[43:36]),
    .write_data(in_vec[35:4]),
    .discard(in_vec[3:3]),
    .test_mode(in_vec[2:2]),
    .entropy_ack(in_vec[1:1]),
    .debug_update(in_vec[0:0]),
    .read_data(out_vec[75:44]),
    .error(out_vec[43:43]),
    .security_error(out_vec[42:42]),
    .entropy_enabled(out_vec[41:41]),
    .entropy_data(out_vec[40:9]),
    .entropy_valid(out_vec[8:8]),
    .debug(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 47'h1d11b683b23a;
    stim[1] = 47'h1d328d452993;
    stim[2] = 47'h4c76a9f97986;
    stim[3] = 47'h53d41852a935;
    stim[4] = 47'h77abef801091;
    stim[5] = 47'h06e09c61cda9;
    stim[6] = 47'h5c147e17f247;
    stim[7] = 47'h621af7e10c89;
    stim[8] = 47'h7b5096851272;
    stim[9] = 47'h78ea693d55b9;
    stim[10] = 47'h7b1b76dbf50c;
    stim[11] = 47'h65ffe9cc5c56;
    stim[12] = 47'h52989a2508df;
    stim[13] = 47'h7915213d0ca9;
    stim[14] = 47'h7daf643ede8d;
    stim[15] = 47'h61d8ae652fee;
    stim[16] = 47'h4ff0ad3a2056;
    stim[17] = 47'h40cdbc6a821f;
    stim[18] = 47'h645e3c0d6311;
    stim[19] = 47'h59c25fb373ee;
    stim[20] = 47'h6aba36926cc1;
    stim[21] = 47'h75b257c166fe;
    stim[22] = 47'h6d3bc23d9394;
    stim[23] = 47'h4e806bd40f75;
    stim[24] = 47'h53654b721c58;
    stim[25] = 47'h6b964e75a210;
    stim[26] = 47'h46f927fe8d91;
    stim[27] = 47'h449693a49284;
    stim[28] = 47'h5369bcd9e8af;
    stim[29] = 47'h56a5d2d3bffa;
    stim[30] = 47'h71536396f0fb;
    stim[31] = 47'h6766f538f68a;
    stim[32] = 47'h611fcdf31b9d;
    stim[33] = 47'h46050ea16991;
    stim[34] = 47'h6ceffbacd576;
    stim[35] = 47'h52f39c0f9c82;
    stim[36] = 47'h7c52a5c3ee29;
    stim[37] = 47'h5159412c7755;
    stim[38] = 47'h54def58a1994;
    stim[39] = 47'h4c637858ccab;
    stim[40] = 47'h608bd72e8da5;
    stim[41] = 47'h77eb52ab8822;
    stim[42] = 47'h703517d476c1;
    stim[43] = 47'h4405726f6175;
    stim[44] = 47'h5a4ec1ff9173;
    stim[45] = 47'h5d21e7efc4d8;
    stim[46] = 47'h62dc89467bfd;
    stim[47] = 47'h73846b940ab0;
    stim[48] = 47'h76638c3445c6;
    stim[49] = 47'h654ed301fe84;
    stim[50] = 47'h54055285d472;
    stim[51] = 47'h5d211898a4ab;
    stim[52] = 47'h48a8f49b70ea;
    stim[53] = 47'h43b565d0f3a7;
    stim[54] = 47'h7ff98158bac6;
    stim[55] = 47'h5e659e683733;
    stim[56] = 47'h618fe87c5333;
    stim[57] = 47'h68f3ff4671f2;
    stim[58] = 47'h46774f98ed25;
    stim[59] = 47'h419da83b587f;
    stim[60] = 47'h47d5928d4f21;
    stim[61] = 47'h42613d4016d9;
    stim[62] = 47'h5ea646311105;
    stim[63] = 47'h7d12534ecfc3;
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
      expv[0] = 76'h00000000354ab54ab42;
      expv[1] = 76'h00000000354ab54ab42;
      expv[2] = 76'h00000000354ab54ab42;
      expv[3] = 76'h00000000354ab54ab42;
      expv[4] = 76'h00000000354ab54ab42;
      expv[5] = 76'h00000000354ab54ab42;
      expv[6] = 76'h00000000354ab54ab42;
      expv[7] = 76'h00000000354ab54ab42;
      expv[8] = 76'h00000000354ab54ab42;
      expv[9] = 76'h00000000354ab54ab42;
      expv[10] = 76'h00000000354ab54ab42;
      expv[11] = 76'h00000000354ab54ab42;
      expv[12] = 76'h00000000354ab54ab42;
      expv[13] = 76'h00000000354ab54ab42;
      expv[14] = 76'h00000000354ab54ab42;
      expv[15] = 76'h00000000354ab54ab42;
      expv[16] = 76'h00000000354ab54ab42;
      expv[17] = 76'h00000000354ab54ab42;
      expv[18] = 76'h00000000354ab54ab42;
      expv[19] = 76'h00000000354ab54ab42;
      expv[20] = 76'h00000000354ab54ab42;
      expv[21] = 76'h00000000354ab54ab42;
      expv[22] = 76'h00000000354ab54ab42;
      expv[23] = 76'h00000000354ab54ab42;
      expv[24] = 76'h00000000354ab54ab42;
      expv[25] = 76'h00000000354ab54ab42;
      expv[26] = 76'h00000000354ab54ab42;
      expv[27] = 76'h00000000354ab54ab42;
      expv[28] = 76'h00000000354ab54ab42;
      expv[29] = 76'h00000000354ab54ab42;
      expv[30] = 76'h00000000354ab54ab42;
      expv[31] = 76'h00000000354ab54ab42;
      expv[32] = 76'h00000000354ab54ab42;
      expv[33] = 76'h00000000354ab54ab42;
      expv[34] = 76'h00000000354ab54ab42;
      expv[35] = 76'h00000000354ab54ab42;
      expv[36] = 76'h00000000354ab54ab42;
      expv[37] = 76'h00000000354ab54ab42;
      expv[38] = 76'h00000000354ab54ab42;
      expv[39] = 76'h00000000354ab54ab42;
      expv[40] = 76'h00000000354ab54ab42;
      expv[41] = 76'h00000000354ab54ab42;
      expv[42] = 76'h00000000354ab54ab42;
      expv[43] = 76'h00000000354ab54ab42;
      expv[44] = 76'h00000000354ab54ab42;
      expv[45] = 76'h00000000354ab54ab42;
      expv[46] = 76'h00000000354ab54ab42;
      expv[47] = 76'h00000000354ab54ab42;
      expv[48] = 76'h00000000354ab54ab42;
      expv[49] = 76'h00000000354ab54ab42;
      expv[50] = 76'h00000000354ab54ab42;
      expv[51] = 76'h00000000354ab54ab42;
      expv[52] = 76'h00000000354ab54ab42;
      expv[53] = 76'h00000000354ab54ab42;
      expv[54] = 76'h00000000354ab54ab42;
      expv[55] = 76'h00000000354ab54ab42;
      expv[56] = 76'h00000000354ab54ab42;
      expv[57] = 76'h00000000354ab54ab42;
      expv[58] = 76'h00000000354ab54ab42;
      expv[59] = 76'h00000000354ab54ab42;
      expv[60] = 76'h00000000354ab54ab42;
      expv[61] = 76'h00000000354ab54ab42;
      expv[62] = 76'h00000000354ab54ab42;
      expv[63] = 76'h00000000354ab54ab42;
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
