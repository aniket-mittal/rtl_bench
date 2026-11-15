// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_133680 dut (
    .clk(clk),
    .num1(in_vec[10:7]),
    .num2(in_vec[6:3]),
    .operation(in_vec[2:1]),
    .reset(in_vec[0:0]),
    .result(out_vec[7:4]),
    .led_display(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h22b;
    stim[1] = 11'h655;
    stim[2] = 11'h552;
    stim[3] = 11'h0e2;
    stim[4] = 11'h2f0;
    stim[5] = 11'h2fc;
    stim[6] = 11'h466;
    stim[7] = 11'h0f2;
    stim[8] = 11'h128;
    stim[9] = 11'h716;
    stim[10] = 11'h7ba;
    stim[11] = 11'h7f0;
    stim[12] = 11'h164;
    stim[13] = 11'h514;
    stim[14] = 11'h42a;
    stim[15] = 11'h004;
    stim[16] = 11'h4a8;
    stim[17] = 11'h212;
    stim[18] = 11'h096;
    stim[19] = 11'h1ec;
    stim[20] = 11'h7c0;
    stim[21] = 11'h72c;
    stim[22] = 11'h3f4;
    stim[23] = 11'h522;
    stim[24] = 11'h056;
    stim[25] = 11'h5e8;
    stim[26] = 11'h3e2;
    stim[27] = 11'h0b0;
    stim[28] = 11'h6c6;
    stim[29] = 11'h430;
    stim[30] = 11'h4e2;
    stim[31] = 11'h1ce;
    stim[32] = 11'h3f0;
    stim[33] = 11'h27a;
    stim[34] = 11'h712;
    stim[35] = 11'h382;
    stim[36] = 11'h37e;
    stim[37] = 11'h3f2;
    stim[38] = 11'h070;
    stim[39] = 11'h118;
    stim[40] = 11'h448;
    stim[41] = 11'h51e;
    stim[42] = 11'h48e;
    stim[43] = 11'h3f0;
    stim[44] = 11'h168;
    stim[45] = 11'h362;
    stim[46] = 11'h36e;
    stim[47] = 11'h094;
    stim[48] = 11'h2aa;
    stim[49] = 11'h4b8;
    stim[50] = 11'h780;
    stim[51] = 11'h20e;
    stim[52] = 11'h0ba;
    stim[53] = 11'h452;
    stim[54] = 11'h58a;
    stim[55] = 11'h06a;
    stim[56] = 11'h7f0;
    stim[57] = 11'h13c;
    stim[58] = 11'h41a;
    stim[59] = 11'h3ac;
    stim[60] = 11'h746;
    stim[61] = 11'h4e2;
    stim[62] = 11'h4da;
    stim[63] = 11'h7f8;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h33;
      expv[7] = 8'hbb;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h77;
      expv[11] = 8'h77;
      expv[12] = 8'h88;
      expv[13] = 8'hdd;
      expv[14] = 8'h88;
      expv[15] = 8'h44;
      expv[16] = 8'h33;
      expv[17] = 8'h00;
      expv[18] = 8'hee;
      expv[19] = 8'h22;
      expv[20] = 8'h00;
      expv[21] = 8'h77;
      expv[22] = 8'h77;
      expv[23] = 8'h66;
      expv[24] = 8'h22;
      expv[25] = 8'h66;
      expv[26] = 8'h00;
      expv[27] = 8'h88;
      expv[28] = 8'h00;
      expv[29] = 8'h77;
      expv[30] = 8'h11;
      expv[31] = 8'hee;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h55;
      expv[35] = 8'h00;
      expv[36] = 8'hcc;
      expv[37] = 8'h77;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'hee;
      expv[41] = 8'h55;
      expv[42] = 8'h11;
      expv[43] = 8'h33;
      expv[44] = 8'h99;
      expv[45] = 8'h55;
      expv[46] = 8'hff;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h22;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'hff;
      expv[53] = 8'h44;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'haa;
      expv[57] = 8'h00;
      expv[58] = 8'hdd;
      expv[59] = 8'hee;
      expv[60] = 8'h55;
      expv[61] = 8'h33;
      expv[62] = 8'h11;
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
