// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_175594 dut (
    .R1200(in_vec[11:11]),
    .R2400(in_vec[10:10]),
    .R4800(in_vec[9:9]),
    .R9600(in_vec[8:8]),
    .r_r(in_vec[7:7]),
    .d_in(in_vec[6:6]),
    .d_num(in_vec[5:5]),
    .s_num(in_vec[4:4]),
    .para(in_vec[3:2]),
    .bd_rate(in_vec[1:0]),
    .data_out(out_vec[9:2]),
    .err_p(out_vec[1:1]),
    .err_frame(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h17f;
    stim[1] = 12'ha3e;
    stim[2] = 12'h4ee;
    stim[3] = 12'heee;
    stim[4] = 12'h0e2;
    stim[5] = 12'h5c1;
    stim[6] = 12'h4f1;
    stim[7] = 12'h0fc;
    stim[8] = 12'hfce;
    stim[9] = 12'h68d;
    stim[10] = 12'h7f1;
    stim[11] = 12'h9b4;
    stim[12] = 12'hcf5;
    stim[13] = 12'hce4;
    stim[14] = 12'hea8;
    stim[15] = 12'h6fb;
    stim[16] = 12'he9f;
    stim[17] = 12'he9b;
    stim[18] = 12'h5ce;
    stim[19] = 12'h3c8;
    stim[20] = 12'h6ea;
    stim[21] = 12'h3f9;
    stim[22] = 12'h9f9;
    stim[23] = 12'hedc;
    stim[24] = 12'hcf8;
    stim[25] = 12'h6fb;
    stim[26] = 12'hb91;
    stim[27] = 12'hfe3;
    stim[28] = 12'h19b;
    stim[29] = 12'h2c9;
    stim[30] = 12'hdeb;
    stim[31] = 12'h0a3;
    stim[32] = 12'hfa5;
    stim[33] = 12'hdaf;
    stim[34] = 12'hebf;
    stim[35] = 12'h0b8;
    stim[36] = 12'hf80;
    stim[37] = 12'h9f9;
    stim[38] = 12'h9d7;
    stim[39] = 12'h29b;
    stim[40] = 12'hcd8;
    stim[41] = 12'h1cf;
    stim[42] = 12'h6c4;
    stim[43] = 12'h0ab;
    stim[44] = 12'h9bd;
    stim[45] = 12'habc;
    stim[46] = 12'heab;
    stim[47] = 12'h3a8;
    stim[48] = 12'h28a;
    stim[49] = 12'h6f2;
    stim[50] = 12'hcf1;
    stim[51] = 12'h8f0;
    stim[52] = 12'h4b6;
    stim[53] = 12'h19d;
    stim[54] = 12'h6db;
    stim[55] = 12'h6ee;
    stim[56] = 12'hec4;
    stim[57] = 12'h2f2;
    stim[58] = 12'hab2;
    stim[59] = 12'h1ca;
    stim[60] = 12'h9e1;
    stim[61] = 12'h9a1;
    stim[62] = 12'h201;
    stim[63] = 12'h7b0;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h008;
      expv[39] = 10'h008;
      expv[40] = 10'h018;
      expv[41] = 10'h018;
      expv[42] = 10'h018;
      expv[43] = 10'h018;
      expv[44] = 10'h018;
      expv[45] = 10'h018;
      expv[46] = 10'h018;
      expv[47] = 10'h018;
      expv[48] = 10'h018;
      expv[49] = 10'h018;
      expv[50] = 10'h018;
      expv[51] = 10'h018;
      expv[52] = 10'h018;
      expv[53] = 10'h018;
      expv[54] = 10'h018;
      expv[55] = 10'h098;
      expv[56] = 10'h098;
      expv[57] = 10'h098;
      expv[58] = 10'h098;
      expv[59] = 10'h098;
      expv[60] = 10'h098;
      expv[61] = 10'h098;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
