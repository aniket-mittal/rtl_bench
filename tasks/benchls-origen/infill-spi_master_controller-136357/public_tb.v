// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_136357 dut (
    .clk(clk),
    .rst(in_vec[25:25]),
    .mpu_address(in_vec[24:18]),
    .mpu_wr_data(in_vec[17:10]),
    .mpu_rd_wr_sel(in_vec[9:9]),
    .start(in_vec[8:8]),
    .SPI_DI_g(in_vec[7:0]),
    .busy(out_vec[18:18]),
    .SPI_SS_g(out_vec[17:17]),
    .SPI_CK_g(out_vec[16:16]),
    .SPI_DO_g(out_vec[15:8]),
    .mpu_rd_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h3312ff5;
    stim[1] = 26'h233c827;
    stim[2] = 26'h04846c5;
    stim[3] = 26'h04ed216;
    stim[4] = 26'h0f3de20;
    stim[5] = 26'h0d427ac;
    stim[6] = 26'h23b8712;
    stim[7] = 26'h042e9a5;
    stim[8] = 26'h02f129a;
    stim[9] = 26'h15d5950;
    stim[10] = 26'h1dd8c67;
    stim[11] = 26'h018e93a;
    stim[12] = 26'h0f5e862;
    stim[13] = 26'h19b7413;
    stim[14] = 26'h193dcea;
    stim[15] = 26'h1fc0529;
    stim[16] = 26'h0e22ca7;
    stim[17] = 26'h1f57c1e;
    stim[18] = 26'h106c998;
    stim[19] = 26'h10ffbb2;
    stim[20] = 26'h01448db;
    stim[21] = 26'h0a68d13;
    stim[22] = 26'h10125bf;
    stim[23] = 26'h01f7f88;
    stim[24] = 26'h012bd2e;
    stim[25] = 26'h0ef6e16;
    stim[26] = 26'h0a90a0c;
    stim[27] = 26'h1896325;
    stim[28] = 26'h05abe12;
    stim[29] = 26'h0f52386;
    stim[30] = 26'h02b6f1d;
    stim[31] = 26'h126278e;
    stim[32] = 26'h11d4d3d;
    stim[33] = 26'h13cd731;
    stim[34] = 26'h1cec1f0;
    stim[35] = 26'h0670300;
    stim[36] = 26'h1e5ec26;
    stim[37] = 26'h1319a73;
    stim[38] = 26'h0a1317f;
    stim[39] = 26'h0f1fbd4;
    stim[40] = 26'h0589422;
    stim[41] = 26'h1249c6c;
    stim[42] = 26'h04a784a;
    stim[43] = 26'h0732381;
    stim[44] = 26'h0df0496;
    stim[45] = 26'h1fab94b;
    stim[46] = 26'h0bc4f07;
    stim[47] = 26'h0deae99;
    stim[48] = 26'h0d1fc1f;
    stim[49] = 26'h1048016;
    stim[50] = 26'h0de1e88;
    stim[51] = 26'h1e53f21;
    stim[52] = 26'h0e4e874;
    stim[53] = 26'h11ac974;
    stim[54] = 26'h14ac977;
    stim[55] = 26'h127557a;
    stim[56] = 26'h1516555;
    stim[57] = 26'h1070d93;
    stim[58] = 26'h060ba3d;
    stim[59] = 26'h0a3d757;
    stim[60] = 26'h0b676b6;
    stim[61] = 26'h0e0decc;
    stim[62] = 26'h1a14d8e;
    stim[63] = 26'h03eed40;
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
      expv[0] = 19'h200xx;
      expv[1] = 19'h200xx;
      expv[2] = 19'h200xx;
      expv[3] = 19'h200xx;
      expv[4] = 19'h200xx;
      expv[5] = 19'h200xx;
      expv[6] = 19'h200xx;
      expv[7] = 19'h200xx;
      expv[8] = 19'h200xx;
      expv[9] = 19'h400xx;
      expv[10] = 19'h400xx;
      expv[11] = 19'h400xx;
      expv[12] = 19'h400xx;
      expv[13] = 19'h400xx;
      expv[14] = 19'h400xx;
      expv[15] = 19'h400xx;
      expv[16] = 19'h400xx;
      expv[17] = 19'h400xx;
      expv[18] = 19'h400xx;
      expv[19] = 19'h400xx;
      expv[20] = 19'h400xx;
      expv[21] = 19'h400xx;
      expv[22] = 19'h400xx;
      expv[23] = 19'h400xx;
      expv[24] = 19'h400xx;
      expv[25] = 19'h400xx;
      expv[26] = 19'h400xx;
      expv[27] = 19'h400xx;
      expv[28] = 19'h400xx;
      expv[29] = 19'h400xx;
      expv[30] = 19'h400xx;
      expv[31] = 19'h400xx;
      expv[32] = 19'h400xx;
      expv[33] = 19'h400xx;
      expv[34] = 19'h400xx;
      expv[35] = 19'h400xx;
      expv[36] = 19'h400xx;
      expv[37] = 19'h400xx;
      expv[38] = 19'h400xx;
      expv[39] = 19'h400xx;
      expv[40] = 19'h400xx;
      expv[41] = 19'h400xx;
      expv[42] = 19'h400xx;
      expv[43] = 19'h400xx;
      expv[44] = 19'h400xx;
      expv[45] = 19'h400xx;
      expv[46] = 19'h400xx;
      expv[47] = 19'h400xx;
      expv[48] = 19'h400xx;
      expv[49] = 19'h400xx;
      expv[50] = 19'h400xx;
      expv[51] = 19'h400xx;
      expv[52] = 19'h400xx;
      expv[53] = 19'h400xx;
      expv[54] = 19'h400xx;
      expv[55] = 19'h400xx;
      expv[56] = 19'h400xx;
      expv[57] = 19'h400xx;
      expv[58] = 19'h400xx;
      expv[59] = 19'h500xx;
      expv[60] = 19'h500xx;
      expv[61] = 19'h500xx;
      expv[62] = 19'h500xx;
      expv[63] = 19'h500xx;
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
