// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_012504 dut (
    .clk(clk),
    .ren(in_vec[27:27]),
    .wen(in_vec[26:26]),
    .raddr(in_vec[25:20]),
    .waddr(in_vec[19:14]),
    .a(in_vec[13:7]),
    .b(in_vec[6:0]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'hb365c6b;
    stim[1] = 28'h71b7a33;
    stim[2] = 28'h2f25407;
    stim[3] = 28'h0f9242c;
    stim[4] = 28'hc452aed;
    stim[5] = 28'h83022ce;
    stim[6] = 28'h9217a11;
    stim[7] = 28'hea4fd78;
    stim[8] = 28'h4ba7bfd;
    stim[9] = 28'he469631;
    stim[10] = 28'hc4c1f39;
    stim[11] = 28'h764b7b3;
    stim[12] = 28'hbd33feb;
    stim[13] = 28'hcdbeb74;
    stim[14] = 28'hd61974b;
    stim[15] = 28'he445324;
    stim[16] = 28'h9de57a5;
    stim[17] = 28'hc07015e;
    stim[18] = 28'h8840b84;
    stim[19] = 28'hcff7961;
    stim[20] = 28'h8c6fd9b;
    stim[21] = 28'h20e10e0;
    stim[22] = 28'hb80b50e;
    stim[23] = 28'h5152065;
    stim[24] = 28'h761dc22;
    stim[25] = 28'h24a4b55;
    stim[26] = 28'h68a3872;
    stim[27] = 28'h3b2dd68;
    stim[28] = 28'he273f9b;
    stim[29] = 28'ha2f2c7b;
    stim[30] = 28'hcc3cbbf;
    stim[31] = 28'h85d6c74;
    stim[32] = 28'he49ed3b;
    stim[33] = 28'h87377a9;
    stim[34] = 28'h30cbfe1;
    stim[35] = 28'ha4ffa41;
    stim[36] = 28'h537c685;
    stim[37] = 28'h0feb243;
    stim[38] = 28'ha1023f9;
    stim[39] = 28'h86891e0;
    stim[40] = 28'h77a2170;
    stim[41] = 28'hd1cc076;
    stim[42] = 28'h25ec251;
    stim[43] = 28'he077402;
    stim[44] = 28'hd75ed73;
    stim[45] = 28'hf287531;
    stim[46] = 28'h044cecc;
    stim[47] = 28'h2b708ec;
    stim[48] = 28'hbd1bf72;
    stim[49] = 28'hf4b6c21;
    stim[50] = 28'hb310e24;
    stim[51] = 28'hb0d8f9d;
    stim[52] = 28'h4409e70;
    stim[53] = 28'hb0a474e;
    stim[54] = 28'h72d91a0;
    stim[55] = 28'h15b5b0b;
    stim[56] = 28'h8958db5;
    stim[57] = 28'h0780fd4;
    stim[58] = 28'h9c03cc7;
    stim[59] = 28'h07ee66b;
    stim[60] = 28'h30598e4;
    stim[61] = 28'ha4d15f5;
    stim[62] = 28'h492ee60;
    stim[63] = 28'he9a1a72;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'h00;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'h00;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'h00;
      expv[23] = 8'hxx;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hxx;
      expv[33] = 8'hxx;
      expv[34] = 8'h5a;
      expv[35] = 8'h00;
      expv[36] = 8'hxx;
      expv[37] = 8'h00;
      expv[38] = 8'h00;
      expv[39] = 8'hxx;
      expv[40] = 8'h79;
      expv[41] = 8'h00;
      expv[42] = 8'h4a;
      expv[43] = 8'h00;
      expv[44] = 8'hxx;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'hd3;
      expv[50] = 8'hxx;
      expv[51] = 8'h76;
      expv[52] = 8'h77;
      expv[53] = 8'h00;
      expv[54] = 8'h77;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'hxx;
      expv[58] = 8'h00;
      expv[59] = 8'h9a;
      expv[60] = 8'h00;
      expv[61] = 8'h00;
      expv[62] = 8'hxx;
      expv[63] = 8'h00;
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
