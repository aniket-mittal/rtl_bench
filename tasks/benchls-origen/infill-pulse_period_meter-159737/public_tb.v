// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_159737 dut (
    .clk_100MHz(clk),
    .Rst(in_vec[16:16]),
    .ADC_Data(in_vec[15:8]),
    .F_Gate(in_vec[7:0]),
    .Period(out_vec[20:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h15c79;
    stim[1] = 17'h11ed7;
    stim[2] = 17'h0e374;
    stim[3] = 17'h0278a;
    stim[4] = 17'h0a8b5;
    stim[5] = 17'h138df;
    stim[6] = 17'h0504a;
    stim[7] = 17'h0c36d;
    stim[8] = 17'h016c9;
    stim[9] = 17'h07725;
    stim[10] = 17'h09b43;
    stim[11] = 17'h0be8c;
    stim[12] = 17'h0e10a;
    stim[13] = 17'h06391;
    stim[14] = 17'h01f31;
    stim[15] = 17'h004ae;
    stim[16] = 17'h0da97;
    stim[17] = 17'h0db6c;
    stim[18] = 17'h0cdd6;
    stim[19] = 17'h0ec65;
    stim[20] = 17'h0c237;
    stim[21] = 17'h0a45c;
    stim[22] = 17'h098ac;
    stim[23] = 17'h09dad;
    stim[24] = 17'h0dcfb;
    stim[25] = 17'h0f7e2;
    stim[26] = 17'h04d33;
    stim[27] = 17'h0d062;
    stim[28] = 17'h03b15;
    stim[29] = 17'h0323e;
    stim[30] = 17'h020a9;
    stim[31] = 17'h091da;
    stim[32] = 17'h17031;
    stim[33] = 17'h0b45f;
    stim[34] = 17'h02eb7;
    stim[35] = 17'h03cd5;
    stim[36] = 17'h02a36;
    stim[37] = 17'h09100;
    stim[38] = 17'h04392;
    stim[39] = 17'h069db;
    stim[40] = 17'h02645;
    stim[41] = 17'h01f42;
    stim[42] = 17'h017af;
    stim[43] = 17'h02e76;
    stim[44] = 17'h05f99;
    stim[45] = 17'h05bd6;
    stim[46] = 17'h01673;
    stim[47] = 17'h0eb32;
    stim[48] = 17'h0eee1;
    stim[49] = 17'h0c660;
    stim[50] = 17'h02c78;
    stim[51] = 17'h03968;
    stim[52] = 17'h0e2ba;
    stim[53] = 17'h0609d;
    stim[54] = 17'h0918a;
    stim[55] = 17'h039ee;
    stim[56] = 17'h070ff;
    stim[57] = 17'h077df;
    stim[58] = 17'h0b3fa;
    stim[59] = 17'h07899;
    stim[60] = 17'h07634;
    stim[61] = 17'h03831;
    stim[62] = 17'h005b2;
    stim[63] = 17'h0defb;
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
      expv[0] = 21'h000001;
      expv[1] = 21'h000001;
      expv[2] = 21'h000001;
      expv[3] = 21'h000001;
      expv[4] = 21'h000001;
      expv[5] = 21'h000001;
      expv[6] = 21'h000001;
      expv[7] = 21'h000001;
      expv[8] = 21'h000001;
      expv[9] = 21'h000001;
      expv[10] = 21'h000001;
      expv[11] = 21'h000001;
      expv[12] = 21'h000001;
      expv[13] = 21'h000001;
      expv[14] = 21'h000001;
      expv[15] = 21'h000001;
      expv[16] = 21'h000001;
      expv[17] = 21'h000001;
      expv[18] = 21'h000001;
      expv[19] = 21'h000001;
      expv[20] = 21'h000001;
      expv[21] = 21'h000001;
      expv[22] = 21'h000001;
      expv[23] = 21'h000001;
      expv[24] = 21'h000001;
      expv[25] = 21'h000001;
      expv[26] = 21'h000001;
      expv[27] = 21'h000001;
      expv[28] = 21'h000001;
      expv[29] = 21'h000001;
      expv[30] = 21'h000001;
      expv[31] = 21'h000001;
      expv[32] = 21'h000001;
      expv[33] = 21'h000001;
      expv[34] = 21'h000001;
      expv[35] = 21'h000001;
      expv[36] = 21'h000001;
      expv[37] = 21'h000001;
      expv[38] = 21'h000001;
      expv[39] = 21'h000001;
      expv[40] = 21'h000001;
      expv[41] = 21'h000001;
      expv[42] = 21'h000001;
      expv[43] = 21'h000001;
      expv[44] = 21'h000001;
      expv[45] = 21'h000001;
      expv[46] = 21'h000001;
      expv[47] = 21'h000001;
      expv[48] = 21'h000001;
      expv[49] = 21'h000001;
      expv[50] = 21'h000001;
      expv[51] = 21'h000001;
      expv[52] = 21'h000001;
      expv[53] = 21'h000001;
      expv[54] = 21'h000001;
      expv[55] = 21'h000001;
      expv[56] = 21'h000001;
      expv[57] = 21'h000001;
      expv[58] = 21'h000001;
      expv[59] = 21'h000001;
      expv[60] = 21'h000001;
      expv[61] = 21'h000001;
      expv[62] = 21'h000001;
      expv[63] = 21'h000001;
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
