// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_148332 dut (
    .enable(in_vec[18:18]),
    .data(in_vec[17:10]),
    .rst_cvc(in_vec[9:9]),
    .rst_cds(in_vec[8:8]),
    .sample(in_vec[7:7]),
    .end_adc(in_vec[6:6]),
    .lval(in_vec[5:5]),
    .pixel_clock(in_vec[4:4]),
    .main_clock_source(in_vec[3:3]),
    .main_clock(in_vec[2:2]),
    .n_reset(in_vec[1:1]),
    .load_pulse(in_vec[0:0]),
    .pixel_data(out_vec[8:1]),
    .pixel_captured(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h3cb3b;
    stim[1] = 19'h5af1b;
    stim[2] = 19'h7013e;
    stim[3] = 19'h19913;
    stim[4] = 19'h5f0f2;
    stim[5] = 19'h3f91e;
    stim[6] = 19'h1f542;
    stim[7] = 19'h73de6;
    stim[8] = 19'h340c3;
    stim[9] = 19'h3b8c7;
    stim[10] = 19'h0e4d2;
    stim[11] = 19'h62568;
    stim[12] = 19'h131c8;
    stim[13] = 19'h1a12b;
    stim[14] = 19'h4a54f;
    stim[15] = 19'h5b19c;
    stim[16] = 19'h11477;
    stim[17] = 19'h7b98d;
    stim[18] = 19'h76dd4;
    stim[19] = 19'h52101;
    stim[20] = 19'h2c029;
    stim[21] = 19'h248c5;
    stim[22] = 19'h3e520;
    stim[23] = 19'h55046;
    stim[24] = 19'h231c9;
    stim[25] = 19'h5499f;
    stim[26] = 19'h66c5e;
    stim[27] = 19'h6d82a;
    stim[28] = 19'h53d02;
    stim[29] = 19'h4a9e6;
    stim[30] = 19'h6019f;
    stim[31] = 19'h0fd8c;
    stim[32] = 19'h49d22;
    stim[33] = 19'h4c098;
    stim[34] = 19'h4c971;
    stim[35] = 19'h65df2;
    stim[36] = 19'h5402c;
    stim[37] = 19'h6ccee;
    stim[38] = 19'h599cd;
    stim[39] = 19'h508b2;
    stim[40] = 19'h73828;
    stim[41] = 19'h7d4cf;
    stim[42] = 19'h660ca;
    stim[43] = 19'h7cc22;
    stim[44] = 19'h1c5a1;
    stim[45] = 19'h0d54b;
    stim[46] = 19'h195af;
    stim[47] = 19'h1dc43;
    stim[48] = 19'h1dcd4;
    stim[49] = 19'h385af;
    stim[50] = 19'h3c0fd;
    stim[51] = 19'h5182c;
    stim[52] = 19'h140d8;
    stim[53] = 19'h09039;
    stim[54] = 19'h1fc91;
    stim[55] = 19'h7ac12;
    stim[56] = 19'h3ef23;
    stim[57] = 19'h5c0eb;
    stim[58] = 19'h2707c;
    stim[59] = 19'h0cd46;
    stim[60] = 19'h54935;
    stim[61] = 19'h4cc40;
    stim[62] = 19'h32532;
    stim[63] = 19'h7dc73;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 9'hxxx;
      expv[1] = 9'hxxx;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
