// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03052 dut (
    .clk(clk),
    .rst(in_vec[48:48]),
    .R_addr_A(in_vec[47:43]),
    .R_addr_B(in_vec[42:38]),
    .Wt_addr(in_vec[37:33]),
    .Wt_data(in_vec[32:1]),
    .L_S(in_vec[0:0]),
    .rdata_A(out_vec[63:32]),
    .rdata_B(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h1c85941d09a39;
    stim[1] = 49'h14cc9276abb9e;
    stim[2] = 49'h05e6ade9fdef3;
    stim[3] = 49'h0356e30a2b3db;
    stim[4] = 49'h0cf090552d7b1;
    stim[5] = 49'h0f9501506ecbc;
    stim[6] = 49'h0d56f3aead623;
    stim[7] = 49'h00016a798d9e7;
    stim[8] = 49'h066a2d07e1bc2;
    stim[9] = 49'h062983d2c570d;
    stim[10] = 49'h0f606bc982c92;
    stim[11] = 49'h0b53d1d1c1050;
    stim[12] = 49'h0f6e04e929b45;
    stim[13] = 49'h0b393e7ca934d;
    stim[14] = 49'h0f9f37a7b72b9;
    stim[15] = 49'h018d131895038;
    stim[16] = 49'h0dde468ad05c2;
    stim[17] = 49'h03115ba091cc3;
    stim[18] = 49'h07b7329781a71;
    stim[19] = 49'h0687fc5ac5ad7;
    stim[20] = 49'h02774a12c9ca1;
    stim[21] = 49'h00c78c3839fff;
    stim[22] = 49'h0d3208a97ca62;
    stim[23] = 49'h0efd333ec8025;
    stim[24] = 49'h0a1ecdf97afce;
    stim[25] = 49'h0dde65853fb9a;
    stim[26] = 49'h0da1f3a3eabaa;
    stim[27] = 49'h00a583187404f;
    stim[28] = 49'h0d164c78a44ab;
    stim[29] = 49'h07bb47a07c480;
    stim[30] = 49'h06f4c264501fb;
    stim[31] = 49'h053af27570211;
    stim[32] = 49'h00e2f776da52d;
    stim[33] = 49'h07f9a40545398;
    stim[34] = 49'h06d7b286812f6;
    stim[35] = 49'h0ce698c659ec9;
    stim[36] = 49'h0b155fda0efca;
    stim[37] = 49'h0c3e2e2ff6ae1;
    stim[38] = 49'h062196c700367;
    stim[39] = 49'h04637f65563a7;
    stim[40] = 49'h03ad629ce3602;
    stim[41] = 49'h0e4cf18b091b5;
    stim[42] = 49'h0a1aa6cb71ec9;
    stim[43] = 49'h03718ec92d2b6;
    stim[44] = 49'h048d5a4eb08be;
    stim[45] = 49'h0803ef6adf44d;
    stim[46] = 49'h09d4b7436fad5;
    stim[47] = 49'h0a416b59999b3;
    stim[48] = 49'h006c6918f0ba3;
    stim[49] = 49'h080953d4b3c65;
    stim[50] = 49'h0d30289a8444c;
    stim[51] = 49'h0934322516055;
    stim[52] = 49'h0b2f55f17b219;
    stim[53] = 49'h0b6a304762acd;
    stim[54] = 49'h058b31ebfc4fe;
    stim[55] = 49'h11a5f70446fe3;
    stim[56] = 49'h0235111e0ffd5;
    stim[57] = 49'h0f4824b041108;
    stim[58] = 49'h04fd77f787fbc;
    stim[59] = 49'h01ce8df27826f;
    stim[60] = 49'h0f13c5ada563a;
    stim[61] = 49'h019c6be2e6a17;
    stim[62] = 49'h06e067d4a2fec;
    stim[63] = 49'h0976c644e374e;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h000000006f4fef79;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h000000006f4fef79;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h000000009d756b11;
      expv[17] = 64'h0000000082a96bd8;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h82a96bd800000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h50964e501e962b86;
      expv[23] = 64'h00000000e2d62d6b;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h000000009d756b11;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000099f64012;
      expv[28] = 64'h50964e5000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'hdd048e6100000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h000000006f4fef79;
      expv[35] = 64'h94bc0d3894bc0d38;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h18c3a02700000000;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h0000000053cc6cf3;
      expv[41] = 64'h61c1cfff00000000;
      expv[42] = 64'hc632cf64132280fd;
      expv[43] = 64'h132280fd61c1cfff;
      expv[44] = 64'h99f6401200000000;
      expv[45] = 64'h27494da200000000;
      expv[46] = 64'h00000000365b8f64;
      expv[47] = 64'hc632cf6427494da2;
      expv[48] = 64'h00000000fb2ab1d3;
      expv[49] = 64'h27494da200000000;
      expv[50] = 64'h50964e50b63801b3;
      expv[51] = 64'h63c5225500000000;
      expv[52] = 64'h000000005accccd9;
      expv[53] = 64'h00000000af8bd90c;
      expv[54] = 64'h5accccd900000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h0000000000000000;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'h0000000000000000;
      expv[63] = 64'h0000000000000000;
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
