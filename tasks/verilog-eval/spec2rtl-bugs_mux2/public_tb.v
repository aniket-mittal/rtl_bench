// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .sel(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h077f1;
    stim[1] = 17'h0109c;
    stim[2] = 17'h06ddb;
    stim[3] = 17'h0bead;
    stim[4] = 17'h15eea;
    stim[5] = 17'h048c0;
    stim[6] = 17'h12d5b;
    stim[7] = 17'h0acfc;
    stim[8] = 17'h0ffea;
    stim[9] = 17'h0b3e9;
    stim[10] = 17'h1dd97;
    stim[11] = 17'h182ae;
    stim[12] = 17'h0da42;
    stim[13] = 17'h13ad2;
    stim[14] = 17'h0e40c;
    stim[15] = 17'h1ebb5;
    stim[16] = 17'h0b178;
    stim[17] = 17'h1bd09;
    stim[18] = 17'h1cdfd;
    stim[19] = 17'h08e1d;
    stim[20] = 17'h0b93c;
    stim[21] = 17'h1bd53;
    stim[22] = 17'h0b350;
    stim[23] = 17'h0fb6f;
    stim[24] = 17'h09029;
    stim[25] = 17'h16ce9;
    stim[26] = 17'h16717;
    stim[27] = 17'h064e0;
    stim[28] = 17'h15c4d;
    stim[29] = 17'h02554;
    stim[30] = 17'h09205;
    stim[31] = 17'h10ca5;
    stim[32] = 17'h17644;
    stim[33] = 17'h0bdc6;
    stim[34] = 17'h1bf6c;
    stim[35] = 17'h12d8d;
    stim[36] = 17'h1595b;
    stim[37] = 17'h160f1;
    stim[38] = 17'h02bb4;
    stim[39] = 17'h1c67b;
    stim[40] = 17'h17947;
    stim[41] = 17'h08cce;
    stim[42] = 17'h13b86;
    stim[43] = 17'h0b19f;
    stim[44] = 17'h03f60;
    stim[45] = 17'h0642b;
    stim[46] = 17'h1e206;
    stim[47] = 17'h1a9e4;
    stim[48] = 17'h07ef0;
    stim[49] = 17'h1d324;
    stim[50] = 17'h0a5bd;
    stim[51] = 17'h1fbc6;
    stim[52] = 17'h08202;
    stim[53] = 17'h15066;
    stim[54] = 17'h018c2;
    stim[55] = 17'h03b04;
    stim[56] = 17'h1fe90;
    stim[57] = 17'h101b5;
    stim[58] = 17'h1a0bb;
    stim[59] = 17'h0a848;
    stim[60] = 17'h11a35;
    stim[61] = 17'h1c874;
    stim[62] = 17'h0dcf1;
    stim[63] = 17'h11ed2;
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
      expv[0] = 8'hf1;
      expv[1] = 8'h9c;
      expv[2] = 8'hdb;
      expv[3] = 8'had;
      expv[4] = 8'h5e;
      expv[5] = 8'hc0;
      expv[6] = 8'h2d;
      expv[7] = 8'hfc;
      expv[8] = 8'hea;
      expv[9] = 8'he9;
      expv[10] = 8'hdd;
      expv[11] = 8'h82;
      expv[12] = 8'h42;
      expv[13] = 8'h3a;
      expv[14] = 8'h0c;
      expv[15] = 8'heb;
      expv[16] = 8'h78;
      expv[17] = 8'hbd;
      expv[18] = 8'hcd;
      expv[19] = 8'h1d;
      expv[20] = 8'h3c;
      expv[21] = 8'hbd;
      expv[22] = 8'h50;
      expv[23] = 8'h6f;
      expv[24] = 8'h29;
      expv[25] = 8'h6c;
      expv[26] = 8'h67;
      expv[27] = 8'he0;
      expv[28] = 8'h5c;
      expv[29] = 8'h54;
      expv[30] = 8'h05;
      expv[31] = 8'h0c;
      expv[32] = 8'h76;
      expv[33] = 8'hc6;
      expv[34] = 8'hbf;
      expv[35] = 8'h2d;
      expv[36] = 8'h59;
      expv[37] = 8'h60;
      expv[38] = 8'hb4;
      expv[39] = 8'hc6;
      expv[40] = 8'h79;
      expv[41] = 8'hce;
      expv[42] = 8'h3b;
      expv[43] = 8'h9f;
      expv[44] = 8'h60;
      expv[45] = 8'h2b;
      expv[46] = 8'he2;
      expv[47] = 8'ha9;
      expv[48] = 8'hf0;
      expv[49] = 8'hd3;
      expv[50] = 8'hbd;
      expv[51] = 8'hfb;
      expv[52] = 8'h02;
      expv[53] = 8'h50;
      expv[54] = 8'hc2;
      expv[55] = 8'h04;
      expv[56] = 8'hfe;
      expv[57] = 8'h01;
      expv[58] = 8'ha0;
      expv[59] = 8'h48;
      expv[60] = 8'h1a;
      expv[61] = 8'hc8;
      expv[62] = 8'hf1;
      expv[63] = 8'h1e;
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
