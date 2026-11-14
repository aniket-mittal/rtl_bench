// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_077001 dut (
    .clk(clk),
    .rst_n(in_vec[38:38]),
    .wr_H_rd_L(in_vec[37:37]),
    .load(in_vec[36:36]),
    .addr(in_vec[35:32]),
    .wdata(in_vec[31:0]),
    .rdata(out_vec[33:2]),
    .time_interrupt(out_vec[1:1]),
    .msip_reg(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h3470b5f850;
    stim[1] = 39'h3f0774c38d;
    stim[2] = 39'h7be54f4da0;
    stim[3] = 39'h320dee2f41;
    stim[4] = 39'h5b2dd338c8;
    stim[5] = 39'h7e38daced7;
    stim[6] = 39'h7aa6173c61;
    stim[7] = 39'h429adae336;
    stim[8] = 39'h67f273dfab;
    stim[9] = 39'h66a193c7ff;
    stim[10] = 39'h7f776f9082;
    stim[11] = 39'h6a3c320af0;
    stim[12] = 39'h5634f4f2dd;
    stim[13] = 39'h7936581b0c;
    stim[14] = 39'h464615e291;
    stim[15] = 39'h41739d69f4;
    stim[16] = 39'h5e1f2d9b8a;
    stim[17] = 39'h4c5225d295;
    stim[18] = 39'h411d4c9236;
    stim[19] = 39'h5420e2012c;
    stim[20] = 39'h73cac4fa4e;
    stim[21] = 39'h4ecf54497c;
    stim[22] = 39'h67ada87bb4;
    stim[23] = 39'h7988878ad7;
    stim[24] = 39'h62aa8f0aeb;
    stim[25] = 39'h6b1628d185;
    stim[26] = 39'h628e31b392;
    stim[27] = 39'h6a731846dc;
    stim[28] = 39'h756b126836;
    stim[29] = 39'h68b16a952c;
    stim[30] = 39'h6565654dbc;
    stim[31] = 39'h4ecb318ae5;
    stim[32] = 39'h7953d72963;
    stim[33] = 39'h400729feae;
    stim[34] = 39'h634401de1f;
    stim[35] = 39'h6fba6459bf;
    stim[36] = 39'h369430c359;
    stim[37] = 39'h5c30bdc3d4;
    stim[38] = 39'h4ab025aa0a;
    stim[39] = 39'h7c020e6e31;
    stim[40] = 39'h55733613e7;
    stim[41] = 39'h4ab95c5eb2;
    stim[42] = 39'h4821094b9a;
    stim[43] = 39'h7fd12e4ee9;
    stim[44] = 39'h58f6c15b4f;
    stim[45] = 39'h71bcd2f727;
    stim[46] = 39'h4cf506b293;
    stim[47] = 39'h71c912a9ee;
    stim[48] = 39'h7a3c7a6a76;
    stim[49] = 39'h623baf34a6;
    stim[50] = 39'h7100a18e9a;
    stim[51] = 39'h59519881b5;
    stim[52] = 39'h5d89cfb3b7;
    stim[53] = 39'h726582aba4;
    stim[54] = 39'h498e220cd2;
    stim[55] = 39'h4ae528df66;
    stim[56] = 39'h0be172e69b;
    stim[57] = 39'h6baa115f07;
    stim[58] = 39'h5f908275ad;
    stim[59] = 39'h46812d800c;
    stim[60] = 39'h586491dd5b;
    stim[61] = 39'h736c9ba89d;
    stim[62] = 39'h4b72ec4f94;
    stim[63] = 39'h5fd877cf1b;
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
      expv[13] = 34'h2864f1ffc;
      expv[14] = 34'h2864f1ffc;
      expv[15] = 34'h2864f1ffc;
      expv[16] = 34'h000000028;
      expv[17] = 34'h000000000;
      expv[18] = 34'h000000000;
      expv[19] = 34'h000000034;
      expv[20] = 34'h000000000;
      expv[21] = 34'h000000000;
      expv[22] = 34'h000000000;
      expv[23] = 34'h000000000;
      expv[24] = 34'h000000001;
      expv[25] = 34'h000000001;
      expv[26] = 34'h000000001;
      expv[27] = 34'h000000001;
      expv[28] = 34'h000000001;
      expv[29] = 34'h000000001;
      expv[30] = 34'h000000001;
      expv[31] = 34'h000000001;
      expv[32] = 34'h000000001;
      expv[33] = 34'h000000001;
      expv[34] = 34'h000000001;
      expv[35] = 34'h000000003;
      expv[36] = 34'h000000000;
      expv[37] = 34'h000000000;
      expv[38] = 34'h000000000;
      expv[39] = 34'h000000000;
      expv[40] = 34'h000000000;
      expv[41] = 34'h3fffffffc;
      expv[42] = 34'h000000000;
      expv[43] = 34'h3fffffffc;
      expv[44] = 34'h3fffffffc;
      expv[45] = 34'h3fffffffc;
      expv[46] = 34'h3fffffffc;
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
      expv[60] = 34'h3fffffffc;
      expv[61] = 34'h3fffffffc;
      expv[62] = 34'h3fffffffc;
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
