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
    stim[0] = 8'h77;
    stim[1] = 8'hc1;
    stim[2] = 8'hec;
    stim[3] = 8'h3c;
    stim[4] = 8'h40;
    stim[5] = 8'h52;
    stim[6] = 8'h42;
    stim[7] = 8'hfe;
    stim[8] = 8'hfc;
    stim[9] = 8'hd6;
    stim[10] = 8'hfa;
    stim[11] = 8'h66;
    stim[12] = 8'h62;
    stim[13] = 8'h70;
    stim[14] = 8'h34;
    stim[15] = 8'h98;
    stim[16] = 8'h30;
    stim[17] = 8'h4a;
    stim[18] = 8'hf0;
    stim[19] = 8'h38;
    stim[20] = 8'h40;
    stim[21] = 8'h1a;
    stim[22] = 8'h92;
    stim[23] = 8'h42;
    stim[24] = 8'h16;
    stim[25] = 8'hb6;
    stim[26] = 8'h7e;
    stim[27] = 8'h68;
    stim[28] = 8'ha8;
    stim[29] = 8'h56;
    stim[30] = 8'h4c;
    stim[31] = 8'h86;
    stim[32] = 8'hc8;
    stim[33] = 8'h06;
    stim[34] = 8'h38;
    stim[35] = 8'h56;
    stim[36] = 8'h5c;
    stim[37] = 8'ha2;
    stim[38] = 8'hca;
    stim[39] = 8'h22;
    stim[40] = 8'h24;
    stim[41] = 8'h3c;
    stim[42] = 8'haf;
    stim[43] = 8'hfe;
    stim[44] = 8'h96;
    stim[45] = 8'h34;
    stim[46] = 8'h34;
    stim[47] = 8'h4e;
    stim[48] = 8'h90;
    stim[49] = 8'h40;
    stim[50] = 8'hac;
    stim[51] = 8'hd2;
    stim[52] = 8'h6a;
    stim[53] = 8'h14;
    stim[54] = 8'h1a;
    stim[55] = 8'h6c;
    stim[56] = 8'h92;
    stim[57] = 8'h16;
    stim[58] = 8'h68;
    stim[59] = 8'hd8;
    stim[60] = 8'h0e;
    stim[61] = 8'hc6;
    stim[62] = 8'h26;
    stim[63] = 8'hb4;
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
      expv[5] = 17'h1fdfd;
      expv[6] = 17'h1fbfd;
      expv[7] = 17'h1f7f6;
      expv[8] = 17'h1f9f9;
      expv[9] = 17'h1fbfa;
      expv[10] = 17'h1fdfd;
      expv[11] = 17'h1f9f8;
      expv[12] = 17'h1f7f6;
      expv[13] = 17'h1f5f7;
      expv[14] = 17'h1f1f0;
      expv[15] = 17'h1efef;
      expv[16] = 17'h1f1ef;
      expv[17] = 17'h1efee;
      expv[18] = 17'h1edec;
      expv[19] = 17'h1efef;
      expv[20] = 17'h1edef;
      expv[21] = 17'h1ebea;
      expv[22] = 17'h1e9eb;
      expv[23] = 17'h1ebea;
      expv[24] = 17'h1e7e6;
      expv[25] = 17'h1e5e5;
      expv[26] = 17'h1e1e0;
      expv[27] = 17'h1dfde;
      expv[28] = 17'h1dddf;
      expv[29] = 17'h1dfde;
      expv[30] = 17'h1dddc;
      expv[31] = 17'h1dbdb;
      expv[32] = 17'h1dddc;
      expv[33] = 17'h1dfdf;
      expv[34] = 17'h1dddc;
      expv[35] = 17'h1dbdb;
      expv[36] = 17'h1d9d8;
      expv[37] = 17'h1d7d7;
      expv[38] = 17'h1d9d6;
      expv[39] = 17'h1d5d6;
      expv[40] = 17'h1d3d2;
      expv[41] = 17'h1cfce;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00202;
      expv[46] = 17'h00001;
      expv[47] = 17'h1ffff;
      expv[48] = 17'h1fdfd;
      expv[49] = 17'h1fffc;
      expv[50] = 17'h1fdfc;
      expv[51] = 17'h1ffff;
      expv[52] = 17'h00000;
      expv[53] = 17'h1ffff;
      expv[54] = 17'h1fdfc;
      expv[55] = 17'h1fbfb;
      expv[56] = 17'h1f9f8;
      expv[57] = 17'h1fbfb;
      expv[58] = 17'h1f7f6;
      expv[59] = 17'h1f5f7;
      expv[60] = 17'h1f7f6;
      expv[61] = 17'h1f5f5;
      expv[62] = 17'h1f7f6;
      expv[63] = 17'h1f5f5;
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
