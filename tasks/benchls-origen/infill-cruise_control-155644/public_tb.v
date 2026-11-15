// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_155644 dut (
    .clock(clk),
    .throttle(in_vec[7:7]),
    .set(in_vec[6:6]),
    .accel(in_vec[5:5]),
    .coast(in_vec[4:4]),
    .cancel(in_vec[3:3]),
    .resume(in_vec[2:2]),
    .brake(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .speed(out_vec[16:9]),
    .cruise_speed(out_vec[8:1]),
    .cruise_status(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hb7;
    stim[1] = 8'hdb;
    stim[2] = 8'hf8;
    stim[3] = 8'h38;
    stim[4] = 8'h6e;
    stim[5] = 8'h60;
    stim[6] = 8'hf4;
    stim[7] = 8'h76;
    stim[8] = 8'h32;
    stim[9] = 8'h12;
    stim[10] = 8'h06;
    stim[11] = 8'h38;
    stim[12] = 8'he6;
    stim[13] = 8'h88;
    stim[14] = 8'h2a;
    stim[15] = 8'h6c;
    stim[16] = 8'h15;
    stim[17] = 8'h28;
    stim[18] = 8'h32;
    stim[19] = 8'hae;
    stim[20] = 8'hdc;
    stim[21] = 8'h08;
    stim[22] = 8'he4;
    stim[23] = 8'he2;
    stim[24] = 8'h54;
    stim[25] = 8'h08;
    stim[26] = 8'hd2;
    stim[27] = 8'hf8;
    stim[28] = 8'h3e;
    stim[29] = 8'h50;
    stim[30] = 8'hfa;
    stim[31] = 8'hbe;
    stim[32] = 8'h6e;
    stim[33] = 8'h78;
    stim[34] = 8'h3a;
    stim[35] = 8'h38;
    stim[36] = 8'hb2;
    stim[37] = 8'h02;
    stim[38] = 8'h2a;
    stim[39] = 8'hf4;
    stim[40] = 8'h40;
    stim[41] = 8'h12;
    stim[42] = 8'h00;
    stim[43] = 8'h70;
    stim[44] = 8'hde;
    stim[45] = 8'h06;
    stim[46] = 8'hc2;
    stim[47] = 8'hf8;
    stim[48] = 8'h1e;
    stim[49] = 8'h40;
    stim[50] = 8'h40;
    stim[51] = 8'h7e;
    stim[52] = 8'h88;
    stim[53] = 8'h50;
    stim[54] = 8'h06;
    stim[55] = 8'ha4;
    stim[56] = 8'h02;
    stim[57] = 8'he6;
    stim[58] = 8'ha8;
    stim[59] = 8'hf6;
    stim[60] = 8'h1c;
    stim[61] = 8'hca;
    stim[62] = 8'h46;
    stim[63] = 8'h2e;
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
      expv[4] = 17'h1fffe;
      expv[5] = 17'h1fdfc;
      expv[6] = 17'h1fbfb;
      expv[7] = 17'h1fdfd;
      expv[8] = 17'h1fbfb;
      expv[9] = 17'h1f7fa;
      expv[10] = 17'h1f3f2;
      expv[11] = 17'h1efee;
      expv[12] = 17'h1eded;
      expv[13] = 17'h1efee;
      expv[14] = 17'h1f1ef;
      expv[15] = 17'h1efee;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h1fffe;
      expv[20] = 17'h1fbfa;
      expv[21] = 17'h1fdfc;
      expv[22] = 17'h1fbfb;
      expv[23] = 17'h1fdfc;
      expv[24] = 17'h1ffff;
      expv[25] = 17'h1fbfa;
      expv[26] = 17'h1f9fb;
      expv[27] = 17'h1fbfa;
      expv[28] = 17'h1fdfd;
      expv[29] = 17'h1fbfa;
      expv[30] = 17'h1f9f9;
      expv[31] = 17'h1fbfb;
      expv[32] = 17'h1fdfc;
      expv[33] = 17'h1fbfb;
      expv[34] = 17'h1f9f8;
      expv[35] = 17'h1f7f9;
      expv[36] = 17'h1f5f8;
      expv[37] = 17'h1f7f8;
      expv[38] = 17'h1f3f8;
      expv[39] = 17'h1efee;
      expv[40] = 17'h1ebea;
      expv[41] = 17'h1e9e8;
      expv[42] = 17'h1e7e9;
      expv[43] = 17'h1e3e8;
      expv[44] = 17'h1dfde;
      expv[45] = 17'h1e1e1;
      expv[46] = 17'h1dfde;
      expv[47] = 17'h1e1df;
      expv[48] = 17'h1dddc;
      expv[49] = 17'h1dbda;
      expv[50] = 17'h1d9d9;
      expv[51] = 17'h1d7d7;
      expv[52] = 17'h1d5d5;
      expv[53] = 17'h1d7d4;
      expv[54] = 17'h1d5d4;
      expv[55] = 17'h1d3d3;
      expv[56] = 17'h1cfce;
      expv[57] = 17'h1cdcc;
      expv[58] = 17'h1c9c8;
      expv[59] = 17'h1cbca;
      expv[60] = 17'h1cdcc;
      expv[61] = 17'h1cbcb;
      expv[62] = 17'h1cdcc;
      expv[63] = 17'h1cbcb;
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
