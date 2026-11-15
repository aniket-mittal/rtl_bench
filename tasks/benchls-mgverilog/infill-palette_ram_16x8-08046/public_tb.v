// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08046 dut (
    .clk(clk),
    .attr(in_vec[16:13]),
    .address(in_vec[12:9]),
    .write(in_vec[8:8]),
    .write_data(in_vec[7:0]),
    .index(out_vec[15:8]),
    .read_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h14344;
    stim[1] = 17'h01c44;
    stim[2] = 17'h13d39;
    stim[3] = 17'h10e2b;
    stim[4] = 17'h09405;
    stim[5] = 17'h12b35;
    stim[6] = 17'h12ec2;
    stim[7] = 17'h06cea;
    stim[8] = 17'h18925;
    stim[9] = 17'h1fbc5;
    stim[10] = 17'h1e9f4;
    stim[11] = 17'h0317b;
    stim[12] = 17'h0d991;
    stim[13] = 17'h0a04e;
    stim[14] = 17'h0b2fa;
    stim[15] = 17'h1099c;
    stim[16] = 17'h0e7b3;
    stim[17] = 17'h168e1;
    stim[18] = 17'h1040b;
    stim[19] = 17'h07d36;
    stim[20] = 17'h11c76;
    stim[21] = 17'h1fad5;
    stim[22] = 17'h19dca;
    stim[23] = 17'h0b06d;
    stim[24] = 17'h15ef6;
    stim[25] = 17'h0fece;
    stim[26] = 17'h0b831;
    stim[27] = 17'h15e52;
    stim[28] = 17'h03801;
    stim[29] = 17'h13b80;
    stim[30] = 17'h06bdf;
    stim[31] = 17'h03f06;
    stim[32] = 17'h0f45c;
    stim[33] = 17'h154de;
    stim[34] = 17'h16ea7;
    stim[35] = 17'h17b2c;
    stim[36] = 17'h10e14;
    stim[37] = 17'h02d7d;
    stim[38] = 17'h02d1a;
    stim[39] = 17'h116a7;
    stim[40] = 17'h10d41;
    stim[41] = 17'h1cda2;
    stim[42] = 17'h1aa8a;
    stim[43] = 17'h07944;
    stim[44] = 17'h1019e;
    stim[45] = 17'h07f5a;
    stim[46] = 17'h0b21a;
    stim[47] = 17'h024cc;
    stim[48] = 17'h13bfa;
    stim[49] = 17'h0f46a;
    stim[50] = 17'h1b4f4;
    stim[51] = 17'h01238;
    stim[52] = 17'h001ba;
    stim[53] = 17'h17b3a;
    stim[54] = 17'h133e1;
    stim[55] = 17'h102d3;
    stim[56] = 17'h1c638;
    stim[57] = 17'h19b7f;
    stim[58] = 17'h10fc9;
    stim[59] = 17'h0e218;
    stim[60] = 17'h10285;
    stim[61] = 17'h11d72;
    stim[62] = 17'h0cb37;
    stim[63] = 17'h05934;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxxxx;
      expv[11] = 16'hxx25;
      expv[12] = 16'h44xx;
      expv[13] = 16'hxxxx;
      expv[14] = 16'h35xx;
      expv[15] = 16'h35xx;
      expv[16] = 16'h7bf4;
      expv[17] = 16'hxxxx;
      expv[18] = 16'hxx9c;
      expv[19] = 16'h7bxx;
      expv[20] = 16'hb339;
      expv[21] = 16'h7b36;
      expv[22] = 16'hxxc5;
      expv[23] = 16'h9136;
      expv[24] = 16'h357b;
      expv[25] = 16'hxxxx;
      expv[26] = 16'hxxxx;
      expv[27] = 16'h3591;
      expv[28] = 16'hxxxx;
      expv[29] = 16'h4491;
      expv[30] = 16'hxxc5;
      expv[31] = 16'hb335;
      expv[32] = 16'h44xx;
      expv[33] = 16'hxxxx;
      expv[34] = 16'hxxxx;
      expv[35] = 16'hxxxx;
      expv[36] = 16'hxx80;
      expv[37] = 16'h7bxx;
      expv[38] = 16'h44xx;
      expv[39] = 16'h447d;
      expv[40] = 16'h7bxx;
      expv[41] = 16'h7b1a;
      expv[42] = 16'hca41;
      expv[43] = 16'h2cdf;
      expv[44] = 16'hb391;
      expv[45] = 16'h7bxx;
      expv[46] = 16'hb306;
      expv[47] = 16'hdfxx;
      expv[48] = 16'h44xx;
      expv[49] = 16'hxx2c;
      expv[50] = 16'hxxxx;
      expv[51] = 16'hfaxx;
      expv[52] = 16'h9exx;
      expv[53] = 16'h9e9e;
      expv[54] = 16'hxxfa;
      expv[55] = 16'hxxxx;
      expv[56] = 16'h7b44;
      expv[57] = 16'hcab3;
      expv[58] = 16'h443a;
      expv[59] = 16'h7bxx;
      expv[60] = 16'hc944;
      expv[61] = 16'h7b44;
      expv[62] = 16'h7bca;
      expv[63] = 16'ha2df;
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
