// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_145975 dut (
    .A(in_vec[39:24]),
    .B(in_vec[23:8]),
    .S(in_vec[7:4]),
    .BCD_input(in_vec[3:0]),
    .final_output(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'hdfe826f23a;
    stim[1] = 40'had7679def0;
    stim[2] = 40'hcf09af4af2;
    stim[3] = 40'h7eaf1c6e41;
    stim[4] = 40'hb5a07adc2f;
    stim[5] = 40'h41dbf7969d;
    stim[6] = 40'hbc0ef4328e;
    stim[7] = 40'hd8d73e53da;
    stim[8] = 40'h4b65d68c31;
    stim[9] = 40'h4e62be08d0;
    stim[10] = 40'h401e4e0810;
    stim[11] = 40'h100bcccc56;
    stim[12] = 40'hcf40f40de0;
    stim[13] = 40'h2290749e1f;
    stim[14] = 40'hf6184ba89a;
    stim[15] = 40'ha5c2b3392b;
    stim[16] = 40'hb1fced61a3;
    stim[17] = 40'hf746bdf383;
    stim[18] = 40'h6b2d334134;
    stim[19] = 40'h222b621312;
    stim[20] = 40'hae5c6a4a9d;
    stim[21] = 40'h6b7cfc8390;
    stim[22] = 40'h65d717f4f9;
    stim[23] = 40'h9bf8547e60;
    stim[24] = 40'hdc65c76f32;
    stim[25] = 40'ha9015408ce;
    stim[26] = 40'h49516ecdf4;
    stim[27] = 40'h469d9a66a6;
    stim[28] = 40'he38b374b92;
    stim[29] = 40'h89123d25f4;
    stim[30] = 40'h555dd22d51;
    stim[31] = 40'h9fcf4ed122;
    stim[32] = 40'hee52f350f4;
    stim[33] = 40'h5f8eb9967a;
    stim[34] = 40'h1923debf42;
    stim[35] = 40'h8d6e0cf4dc;
    stim[36] = 40'h5557b8f569;
    stim[37] = 40'ha54e4aa5e1;
    stim[38] = 40'h33b04691a4;
    stim[39] = 40'h1c4648f823;
    stim[40] = 40'ha136b0449d;
    stim[41] = 40'hded10e8460;
    stim[42] = 40'h2cd4160847;
    stim[43] = 40'h68a9861196;
    stim[44] = 40'h888876cb14;
    stim[45] = 40'h01f8e41d38;
    stim[46] = 40'h99c3098215;
    stim[47] = 40'h4d328b3fb8;
    stim[48] = 40'h0c54d52882;
    stim[49] = 40'h63c9855b7c;
    stim[50] = 40'hbd6bdd6336;
    stim[51] = 40'h32b52dd6f7;
    stim[52] = 40'h52f7eb30b5;
    stim[53] = 40'hbebb16c705;
    stim[54] = 40'h46c5e34b60;
    stim[55] = 40'hc09fdc8a82;
    stim[56] = 40'h6a6e1c1885;
    stim[57] = 40'h48205107f1;
    stim[58] = 40'ha14b9d214b;
    stim[59] = 40'hfae15ae3cc;
    stim[60] = 40'h5e4ac9ebf9;
    stim[61] = 40'ha1010d392c;
    stim[62] = 40'h72a6026385;
    stim[63] = 40'h801d7c6380;
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
      expv[0] = 8'h1c;
      expv[1] = 8'h5a;
      expv[2] = 8'ha0;
      expv[3] = 8'hf8;
      expv[4] = 8'h33;
      expv[5] = 8'hf1;
      expv[6] = 8'h13;
      expv[7] = 8'hc7;
      expv[8] = 8'haa;
      expv[9] = 8'h73;
      expv[10] = 8'h20;
      expv[11] = 8'h5e;
      expv[12] = 8'h3d;
      expv[13] = 8'h17;
      expv[14] = 8'h0d;
      expv[15] = 8'hab;
      expv[16] = 8'h82;
      expv[17] = 8'h49;
      expv[18] = 8'hb1;
      expv[19] = 8'h93;
      expv[20] = 8'h32;
      expv[21] = 8'hbe;
      expv[22] = 8'hd4;
      expv[23] = 8'he2;
      expv[24] = 8'hbd;
      expv[25] = 8'h95;
      expv[26] = 8'h96;
      expv[27] = 8'had;
      expv[28] = 8'hc7;
      expv[29] = 8'h16;
      expv[30] = 8'heb;
      expv[31] = 8'he9;
      expv[32] = 8'he0;
      expv[33] = 8'h1d;
      expv[34] = 8'h33;
      expv[35] = 8'h6e;
      expv[36] = 8'h66;
      expv[37] = 8'h96;
      expv[38] = 8'hf0;
      expv[39] = 8'h8a;
      expv[40] = 8'h9f;
      expv[41] = 8'h47;
      expv[42] = 8'h49;
      expv[43] = 8'h5a;
      expv[44] = 8'h48;
      expv[45] = 8'h08;
      expv[46] = 8'hd1;
      expv[47] = 8'hae;
      expv[48] = 8'h56;
      expv[49] = 8'h95;
      expv[50] = 8'h7d;
      expv[51] = 8'h6c;
      expv[52] = 8'h63;
      expv[53] = 8'hc3;
      expv[54] = 8'h15;
      expv[55] = 8'ha1;
      expv[56] = 8'h73;
      expv[57] = 8'h91;
      expv[58] = 8'hbc;
      expv[59] = 8'hb1;
      expv[60] = 8'hc5;
      expv[61] = 8'h6b;
      expv[62] = 8'hab;
      expv[63] = 8'h1d;
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
