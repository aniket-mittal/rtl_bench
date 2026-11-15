// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  filtersIP_0 dut (
    .clk(clk),
    .filt_select(in_vec[19:18]),
    .rstn(in_vec[17:17]),
    .start(in_vec[16:16]),
    .val(in_vec[15:0]),
    .done(out_vec[16:16]),
    .result(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h00e6b;
    stim[1] = 20'h46d77;
    stim[2] = 20'h30c3c;
    stim[3] = 20'hd41bf;
    stim[4] = 20'hbcfad;
    stim[5] = 20'h77fe2;
    stim[6] = 20'hfe142;
    stim[7] = 20'h70f03;
    stim[8] = 20'ha62dc;
    stim[9] = 20'h276ba;
    stim[10] = 20'h622b7;
    stim[11] = 20'h66727;
    stim[12] = 20'h248f3;
    stim[13] = 20'hfbf21;
    stim[14] = 20'ha77c1;
    stim[15] = 20'h35d71;
    stim[16] = 20'h236e4;
    stim[17] = 20'ha1735;
    stim[18] = 20'heca24;
    stim[19] = 20'h2cd25;
    stim[20] = 20'h3ac3b;
    stim[21] = 20'ha8b9f;
    stim[22] = 20'h6d79c;
    stim[23] = 20'h260b9;
    stim[24] = 20'haca64;
    stim[25] = 20'h2b23a;
    stim[26] = 20'hf4050;
    stim[27] = 20'h2e5c6;
    stim[28] = 20'h72954;
    stim[29] = 20'h2dc14;
    stim[30] = 20'hf1fc2;
    stim[31] = 20'hb0c70;
    stim[32] = 20'hf37ac;
    stim[33] = 20'hafebf;
    stim[34] = 20'hb2fe6;
    stim[35] = 20'he93d7;
    stim[36] = 20'ha9379;
    stim[37] = 20'hbe712;
    stim[38] = 20'hbeccc;
    stim[39] = 20'h3f90e;
    stim[40] = 20'hb42e8;
    stim[41] = 20'h78414;
    stim[42] = 20'he5292;
    stim[43] = 20'he3cce;
    stim[44] = 20'hee405;
    stim[45] = 20'h6c098;
    stim[46] = 20'h7c952;
    stim[47] = 20'hb0bc4;
    stim[48] = 20'h70e60;
    stim[49] = 20'habb72;
    stim[50] = 20'ha823e;
    stim[51] = 20'hbe8f9;
    stim[52] = 20'hf4726;
    stim[53] = 20'hee05c;
    stim[54] = 20'hec595;
    stim[55] = 20'h2606b;
    stim[56] = 20'h6d2ef;
    stim[57] = 20'hfcf4d;
    stim[58] = 20'hf841e;
    stim[59] = 20'he737e;
    stim[60] = 20'h37fbf;
    stim[61] = 20'h3025b;
    stim[62] = 20'h33867;
    stim[63] = 20'h64cf1;
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
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
