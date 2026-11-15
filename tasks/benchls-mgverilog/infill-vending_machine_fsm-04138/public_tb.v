// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04138 dut (
    .clk(clk),
    .rst(in_vec[5:5]),
    .deposited(in_vec[4:4]),
    .selected(in_vec[3:3]),
    .cancel(in_vec[2:2]),
    .maintenance(in_vec[1:1]),
    .purchase(in_vec[0:0]),
    .ldRdeposit(out_vec[20:20]),
    .ldRselect(out_vec[19:19]),
    .ldRprice(out_vec[18:18]),
    .ldA(out_vec[17:17]),
    .ldRproduct(out_vec[16:16]),
    .ldRchange(out_vec[15:15]),
    .ldRpurchase(out_vec[14:14]),
    .ldMprice(out_vec[13:13]),
    .ldMquantity(out_vec[12:12]),
    .clrRdeposit(out_vec[11:11]),
    .clrRselect(out_vec[10:10]),
    .clrRprice(out_vec[9:9]),
    .clrA(out_vec[8:8]),
    .clrRproduct(out_vec[7:7]),
    .clrRchange(out_vec[6:6]),
    .clrRpurchase(out_vec[5:5]),
    .refundall(out_vec[4:4]),
    .depositall(out_vec[3:3]),
    .state(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h38;
    stim[1] = 6'h3b;
    stim[2] = 6'h06;
    stim[3] = 6'h13;
    stim[4] = 6'h01;
    stim[5] = 6'h19;
    stim[6] = 6'h0a;
    stim[7] = 6'h3e;
    stim[8] = 6'h17;
    stim[9] = 6'h14;
    stim[10] = 6'h13;
    stim[11] = 6'h11;
    stim[12] = 6'h0f;
    stim[13] = 6'h18;
    stim[14] = 6'h1b;
    stim[15] = 6'h02;
    stim[16] = 6'h10;
    stim[17] = 6'h13;
    stim[18] = 6'h1d;
    stim[19] = 6'h08;
    stim[20] = 6'h0f;
    stim[21] = 6'h19;
    stim[22] = 6'h15;
    stim[23] = 6'h0c;
    stim[24] = 6'h1f;
    stim[25] = 6'h15;
    stim[26] = 6'h18;
    stim[27] = 6'h16;
    stim[28] = 6'h10;
    stim[29] = 6'h0f;
    stim[30] = 6'h00;
    stim[31] = 6'h0e;
    stim[32] = 6'h04;
    stim[33] = 6'h04;
    stim[34] = 6'h2c;
    stim[35] = 6'h12;
    stim[36] = 6'h35;
    stim[37] = 6'h03;
    stim[38] = 6'h18;
    stim[39] = 6'h06;
    stim[40] = 6'h02;
    stim[41] = 6'h05;
    stim[42] = 6'h34;
    stim[43] = 6'h07;
    stim[44] = 6'h10;
    stim[45] = 6'h03;
    stim[46] = 6'h0d;
    stim[47] = 6'h1c;
    stim[48] = 6'h1a;
    stim[49] = 6'h0e;
    stim[50] = 6'h18;
    stim[51] = 6'h10;
    stim[52] = 6'h17;
    stim[53] = 6'h09;
    stim[54] = 6'h1a;
    stim[55] = 6'h16;
    stim[56] = 6'h1b;
    stim[57] = 6'h00;
    stim[58] = 6'h15;
    stim[59] = 6'h14;
    stim[60] = 6'h26;
    stim[61] = 6'h08;
    stim[62] = 6'h1a;
    stim[63] = 6'h10;
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
      expv[0] = 21'h000fe0;
      expv[1] = 21'h1c00e1;
      expv[2] = 21'h000fe0;
      expv[3] = 21'h000fe0;
      expv[4] = 21'h000fe0;
      expv[5] = 21'h000fe0;
      expv[6] = 21'h000fe0;
      expv[7] = 21'h000fe0;
      expv[8] = 21'h000fe0;
      expv[9] = 21'h000fe0;
      expv[10] = 21'h000fe0;
      expv[11] = 21'h000fe0;
      expv[12] = 21'h000fe0;
      expv[13] = 21'h000fe0;
      expv[14] = 21'h000fe0;
      expv[15] = 21'h000fe0;
      expv[16] = 21'h000fe0;
      expv[17] = 21'h000fe0;
      expv[18] = 21'h000fe0;
      expv[19] = 21'h000fe0;
      expv[20] = 21'h000fe0;
      expv[21] = 21'h000fe0;
      expv[22] = 21'h000fe0;
      expv[23] = 21'h000fe0;
      expv[24] = 21'h000fe0;
      expv[25] = 21'h000fe0;
      expv[26] = 21'h000fe0;
      expv[27] = 21'h000fe0;
      expv[28] = 21'h000fe0;
      expv[29] = 21'h000fe0;
      expv[30] = 21'h000fe0;
      expv[31] = 21'h000fe0;
      expv[32] = 21'h000fe0;
      expv[33] = 21'h000fe0;
      expv[34] = 21'h000fe0;
      expv[35] = 21'h000fe0;
      expv[36] = 21'h000fe0;
      expv[37] = 21'h000fe0;
      expv[38] = 21'h000fe0;
      expv[39] = 21'h000fe0;
      expv[40] = 21'h000fe0;
      expv[41] = 21'h000fe0;
      expv[42] = 21'h000fe0;
      expv[43] = 21'h000fe0;
      expv[44] = 21'h000fe0;
      expv[45] = 21'h000fe0;
      expv[46] = 21'h000fe0;
      expv[47] = 21'h000fe0;
      expv[48] = 21'h000fe0;
      expv[49] = 21'h000fe0;
      expv[50] = 21'h000fe0;
      expv[51] = 21'h000fe0;
      expv[52] = 21'h000fe0;
      expv[53] = 21'h000fe0;
      expv[54] = 21'h000fe0;
      expv[55] = 21'h000fe0;
      expv[56] = 21'h000fe0;
      expv[57] = 21'h000fe0;
      expv[58] = 21'h000fe0;
      expv[59] = 21'h000fe0;
      expv[60] = 21'h000fe0;
      expv[61] = 21'h000fe0;
      expv[62] = 21'h000fe0;
      expv[63] = 21'h000fe0;
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
