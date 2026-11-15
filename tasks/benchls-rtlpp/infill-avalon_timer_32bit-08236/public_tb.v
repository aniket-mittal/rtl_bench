// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08236 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h08bae7;
    stim[1] = 22'h345b9a;
    stim[2] = 22'h3beed8;
    stim[3] = 22'h137a64;
    stim[4] = 22'h07daad;
    stim[5] = 22'h1e39e9;
    stim[6] = 22'h3e91b2;
    stim[7] = 22'h0fd9a3;
    stim[8] = 22'h27337d;
    stim[9] = 22'h3f7bb4;
    stim[10] = 22'h261d3f;
    stim[11] = 22'h1ef194;
    stim[12] = 22'h1f8d40;
    stim[13] = 22'h3eef28;
    stim[14] = 22'h0a68ec;
    stim[15] = 22'h120217;
    stim[16] = 22'h22c1a8;
    stim[17] = 22'h325340;
    stim[18] = 22'h0f98f9;
    stim[19] = 22'h3a68ac;
    stim[20] = 22'h0e92ee;
    stim[21] = 22'h2f0578;
    stim[22] = 22'h071d2b;
    stim[23] = 22'h32c4ad;
    stim[24] = 22'h1bb00f;
    stim[25] = 22'h16586a;
    stim[26] = 22'h3af486;
    stim[27] = 22'h269a38;
    stim[28] = 22'h0fa8b8;
    stim[29] = 22'h3a978a;
    stim[30] = 22'h1ba9c0;
    stim[31] = 22'h17762a;
    stim[32] = 22'h3b46c7;
    stim[33] = 22'h022e50;
    stim[34] = 22'h26ac9c;
    stim[35] = 22'h376fca;
    stim[36] = 22'h06a219;
    stim[37] = 22'h0f5a9a;
    stim[38] = 22'h17a80d;
    stim[39] = 22'h12b40f;
    stim[40] = 22'h2eee5f;
    stim[41] = 22'h0fadcc;
    stim[42] = 22'h0edfdd;
    stim[43] = 22'h3294c5;
    stim[44] = 22'h2b284b;
    stim[45] = 22'h27b167;
    stim[46] = 22'h12c988;
    stim[47] = 22'h378bae;
    stim[48] = 22'h0b0288;
    stim[49] = 22'h1ae98b;
    stim[50] = 22'h379f43;
    stim[51] = 22'h0feeed;
    stim[52] = 22'h379793;
    stim[53] = 22'h2e7a15;
    stim[54] = 22'h2aadf1;
    stim[55] = 22'h236bbb;
    stim[56] = 22'h2a2175;
    stim[57] = 22'h2ec4c3;
    stim[58] = 22'h378414;
    stim[59] = 22'h332d20;
    stim[60] = 22'h33ff14;
    stim[61] = 22'h2b97eb;
    stim[62] = 22'h1fb21b;
    stim[63] = 22'h275752;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h0c34f;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h039e9;
      expv[13] = 17'h0f194;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h0c34f;
      expv[17] = 17'h0c34f;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h039e9;
      expv[23] = 17'h00002;
      expv[24] = 17'h00000;
      expv[25] = 17'h0f194;
      expv[26] = 17'h0c34f;
      expv[27] = 17'h00000;
      expv[28] = 17'h0c34f;
      expv[29] = 17'h0000e;
      expv[30] = 17'h00000;
      expv[31] = 17'h0f194;
      expv[32] = 17'h0586a;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h0586a;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h0000e;
      expv[39] = 17'h0586a;
      expv[40] = 17'h0586a;
      expv[41] = 17'h0f194;
      expv[42] = 17'h0000e;
      expv[43] = 17'h0000e;
      expv[44] = 17'h00000;
      expv[45] = 17'h0f194;
      expv[46] = 17'h0586a;
      expv[47] = 17'h0586a;
      expv[48] = 17'h00000;
      expv[49] = 17'h0000d;
      expv[50] = 17'h0f194;
      expv[51] = 17'h00000;
      expv[52] = 17'h0000d;
      expv[53] = 17'h00000;
      expv[54] = 17'h0f194;
      expv[55] = 17'h0f194;
      expv[56] = 17'h05860;
      expv[57] = 17'h0f194;
      expv[58] = 17'h0f194;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h0f194;
      expv[63] = 17'h0f194;
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
