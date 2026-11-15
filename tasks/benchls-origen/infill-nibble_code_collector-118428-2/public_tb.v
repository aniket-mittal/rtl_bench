// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_118428 dut (
    .clk(clk),
    .rst(in_vec[6:6]),
    .read_cod_ena(in_vec[5:5]),
    .init_data_ena(in_vec[4:4]),
    .spo_cod(in_vec[3:0]),
    .nib_gene(out_vec[34:31]),
    .addr_cod(out_vec[30:26]),
    .data(out_vec[25:2]),
    .done_cod(out_vec[1:1]),
    .done_fin(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h45;
    stim[1] = 7'h78;
    stim[2] = 7'h1a;
    stim[3] = 7'h0d;
    stim[4] = 7'h1a;
    stim[5] = 7'h3c;
    stim[6] = 7'h00;
    stim[7] = 7'h27;
    stim[8] = 7'h18;
    stim[9] = 7'h12;
    stim[10] = 7'h1f;
    stim[11] = 7'h1b;
    stim[12] = 7'h5f;
    stim[13] = 7'h15;
    stim[14] = 7'h01;
    stim[15] = 7'h38;
    stim[16] = 7'h1e;
    stim[17] = 7'h2c;
    stim[18] = 7'h1d;
    stim[19] = 7'h17;
    stim[20] = 7'h3b;
    stim[21] = 7'h2e;
    stim[22] = 7'h34;
    stim[23] = 7'h1a;
    stim[24] = 7'h27;
    stim[25] = 7'h03;
    stim[26] = 7'h30;
    stim[27] = 7'h3b;
    stim[28] = 7'h23;
    stim[29] = 7'h71;
    stim[30] = 7'h08;
    stim[31] = 7'h1c;
    stim[32] = 7'h21;
    stim[33] = 7'h34;
    stim[34] = 7'h16;
    stim[35] = 7'h33;
    stim[36] = 7'h1d;
    stim[37] = 7'h00;
    stim[38] = 7'h23;
    stim[39] = 7'h2e;
    stim[40] = 7'h29;
    stim[41] = 7'h0c;
    stim[42] = 7'h11;
    stim[43] = 7'h2e;
    stim[44] = 7'h30;
    stim[45] = 7'h0d;
    stim[46] = 7'h09;
    stim[47] = 7'h2b;
    stim[48] = 7'h25;
    stim[49] = 7'h0a;
    stim[50] = 7'h37;
    stim[51] = 7'h26;
    stim[52] = 7'h14;
    stim[53] = 7'h2f;
    stim[54] = 7'h10;
    stim[55] = 7'h11;
    stim[56] = 7'h11;
    stim[57] = 7'h26;
    stim[58] = 7'h1e;
    stim[59] = 7'h03;
    stim[60] = 7'h1c;
    stim[61] = 7'h29;
    stim[62] = 7'h15;
    stim[63] = 7'h2a;
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
      expv[0] = 35'h000000000;
      expv[1] = 35'h000000000;
      expv[2] = 35'h000000000;
      expv[3] = 35'h000000000;
      expv[4] = 35'h000000000;
      expv[5] = 35'h000000000;
      expv[6] = 35'h000000000;
      expv[7] = 35'h000000000;
      expv[8] = 35'h005c00000;
      expv[9] = 35'h004000000;
      expv[10] = 35'h004000000;
      expv[11] = 35'h004000001;
      expv[12] = 35'h000000000;
      expv[13] = 35'h000000000;
      expv[14] = 35'h000000000;
      expv[15] = 35'h000000000;
      expv[16] = 35'h000000000;
      expv[17] = 35'h000000000;
      expv[18] = 35'h007000000;
      expv[19] = 35'h004000000;
      expv[20] = 35'h004000000;
      expv[21] = 35'h004000000;
      expv[22] = 35'h00b800000;
      expv[23] = 35'h008000000;
      expv[24] = 35'h008000000;
      expv[25] = 35'h00dc00000;
      expv[26] = 35'h00dc00000;
      expv[27] = 35'h00c000000;
      expv[28] = 35'h00c000000;
      expv[29] = 35'h000000000;
      expv[30] = 35'h000000000;
      expv[31] = 35'h000000000;
      expv[32] = 35'h000000000;
      expv[33] = 35'h004400000;
      expv[34] = 35'h004000000;
      expv[35] = 35'h004000000;
      expv[36] = 35'h004000000;
      expv[37] = 35'h004000000;
      expv[38] = 35'h004000000;
      expv[39] = 35'h008c00000;
      expv[40] = 35'h00cf80000;
      expv[41] = 35'h010fa4000;
      expv[42] = 35'h010fa4000;
      expv[43] = 35'h010000000;
      expv[44] = 35'h017800000;
      expv[45] = 35'h014000000;
      expv[46] = 35'h014000000;
      expv[47] = 35'h014000000;
      expv[48] = 35'h01ac00000;
      expv[49] = 35'h01ed40000;
      expv[50] = 35'h01ed40000;
      expv[51] = 35'h01c000000;
      expv[52] = 35'h021800000;
      expv[53] = 35'h020000000;
      expv[54] = 35'h027c00002;
      expv[55] = 35'h024000000;
      expv[56] = 35'h024000000;
      expv[57] = 35'h024000000;
      expv[58] = 35'h029800000;
      expv[59] = 35'h028000000;
      expv[60] = 35'h028000000;
      expv[61] = 35'h028000000;
      expv[62] = 35'h02e400000;
      expv[63] = 35'h02c000000;
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
