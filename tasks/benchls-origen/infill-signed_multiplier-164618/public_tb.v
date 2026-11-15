// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_164618 dut (
    .clk(clk),
    .a(in_vec[16:9]),
    .b(in_vec[8:1]),
    .start(in_vec[0:0]),
    .r(out_vec[16:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0e850;
    stim[1] = 17'h033c1;
    stim[2] = 17'h1d99e;
    stim[3] = 17'h05b84;
    stim[4] = 17'h17dcd;
    stim[5] = 17'h17225;
    stim[6] = 17'h1994b;
    stim[7] = 17'h055bf;
    stim[8] = 17'h1be4c;
    stim[9] = 17'h1fd45;
    stim[10] = 17'h0a572;
    stim[11] = 17'h1ac26;
    stim[12] = 17'h019c2;
    stim[13] = 17'h055a7;
    stim[14] = 17'h016c8;
    stim[15] = 17'h07b5a;
    stim[16] = 17'h04c70;
    stim[17] = 17'h1fd01;
    stim[18] = 17'h15baa;
    stim[19] = 17'h038aa;
    stim[20] = 17'h006e3;
    stim[21] = 17'h15a31;
    stim[22] = 17'h14b99;
    stim[23] = 17'h0d0e9;
    stim[24] = 17'h05487;
    stim[25] = 17'h08d45;
    stim[26] = 17'h05640;
    stim[27] = 17'h1b810;
    stim[28] = 17'h17a73;
    stim[29] = 17'h0ae5f;
    stim[30] = 17'h1143b;
    stim[31] = 17'h101e8;
    stim[32] = 17'h180a0;
    stim[33] = 17'h1fc4e;
    stim[34] = 17'h1a5f0;
    stim[35] = 17'h1d0c1;
    stim[36] = 17'h19788;
    stim[37] = 17'h05d9b;
    stim[38] = 17'h06c0c;
    stim[39] = 17'h119d7;
    stim[40] = 17'h1a01c;
    stim[41] = 17'h149a0;
    stim[42] = 17'h0b6ef;
    stim[43] = 17'h08a07;
    stim[44] = 17'h1025e;
    stim[45] = 17'h013bb;
    stim[46] = 17'h17788;
    stim[47] = 17'h095d8;
    stim[48] = 17'h1d3ce;
    stim[49] = 17'h0b852;
    stim[50] = 17'h1c5e4;
    stim[51] = 17'h07c82;
    stim[52] = 17'h09aea;
    stim[53] = 17'h01d07;
    stim[54] = 17'h15186;
    stim[55] = 17'h1c8bc;
    stim[56] = 17'h1f0df;
    stim[57] = 17'h08aa0;
    stim[58] = 17'h097f2;
    stim[59] = 17'h1e47b;
    stim[60] = 17'h03fb5;
    stim[61] = 17'h14272;
    stim[62] = 17'h090aa;
    stim[63] = 17'h0d2b6;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'hxxxxx;
      expv[2] = 17'hxxxxx;
      expv[3] = 17'h00640;
      expv[4] = 17'h00641;
      expv[5] = 17'hxxxxx;
      expv[6] = 17'hxxxxx;
      expv[7] = 17'hxxxxx;
      expv[8] = 17'hxxxxx;
      expv[9] = 17'h00ad4;
      expv[10] = 17'hxxxxx;
      expv[11] = 17'h00178;
      expv[12] = 17'h00179;
      expv[13] = 17'h00179;
      expv[14] = 17'hxxxxx;
      expv[15] = 17'h00ec4;
      expv[16] = 17'h00ec5;
      expv[17] = 17'h00ec5;
      expv[18] = 17'hxxxxx;
      expv[19] = 17'h1fe00;
      expv[20] = 17'h1fe01;
      expv[21] = 17'hxxxxx;
      expv[22] = 17'hxxxxx;
      expv[23] = 17'hxxxxx;
      expv[24] = 17'hxxxxx;
      expv[25] = 17'hxxxxx;
      expv[26] = 17'hxxxxx;
      expv[27] = 17'h03368;
      expv[28] = 17'h03369;
      expv[29] = 17'hxxxxx;
      expv[30] = 17'hxxxxx;
      expv[31] = 17'hxxxxx;
      expv[32] = 17'h01abc;
      expv[33] = 17'h01abd;
      expv[34] = 17'h01abd;
      expv[35] = 17'h01abd;
      expv[36] = 17'hxxxxx;
      expv[37] = 17'h01200;
      expv[38] = 17'hxxxxx;
      expv[39] = 17'h01254;
      expv[40] = 17'hxxxxx;
      expv[41] = 17'h01308;
      expv[42] = 17'h01309;
      expv[43] = 17'hxxxxx;
      expv[44] = 17'hxxxxx;
      expv[45] = 17'h0019e;
      expv[46] = 17'hxxxxx;
      expv[47] = 17'h00276;
      expv[48] = 17'h00277;
      expv[49] = 17'h00277;
      expv[50] = 17'h00277;
      expv[51] = 17'h00277;
      expv[52] = 17'h00277;
      expv[53] = 17'h00277;
      expv[54] = 17'hxxxxx;
      expv[55] = 17'h00dac;
      expv[56] = 17'h00dad;
      expv[57] = 17'hxxxxx;
      expv[58] = 17'h006f0;
      expv[59] = 17'h006f1;
      expv[60] = 17'hxxxxx;
      expv[61] = 17'hxxxxx;
      expv[62] = 17'h00934;
      expv[63] = 17'h00935;
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
