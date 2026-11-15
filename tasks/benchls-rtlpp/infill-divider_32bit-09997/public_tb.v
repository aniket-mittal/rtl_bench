// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09997 dut (
    .clk_i(clk),
    .clk_en_i(in_vec[66:66]),
    .rst_i(in_vec[65:65]),
    .divide_i(in_vec[64:64]),
    .dividend_i(in_vec[63:32]),
    .divisor_i(in_vec[31:0]),
    .quotient_o(out_vec[64:1]),
    .done_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h340c3e394adc3b592;
    stim[1] = 67'h35417189025c6e587;
    stim[2] = 67'h14c053bde77e7a14c;
    stim[3] = 67'h015c2e0916cb8c9cb;
    stim[4] = 67'h4005668b40f336b37;
    stim[5] = 67'h07ca22b1988fa2301;
    stim[6] = 67'h19e0b0719a0fed890;
    stim[7] = 67'h58bb76d501fb03d76;
    stim[8] = 67'h5da9511cef095114d;
    stim[9] = 67'h0ace44dad23276f4c;
    stim[10] = 67'h7707c0e9a88395362;
    stim[11] = 67'h11bf2d51126038118;
    stim[12] = 67'h1fa06749a1e935c91;
    stim[13] = 67'h0144a70d74c11ddfb;
    stim[14] = 67'h5c1fd6f5d47e01f9a;
    stim[15] = 67'h1517baf767ffc8d54;
    stim[16] = 67'h59ddc7705b14ba18d;
    stim[17] = 67'h09426d592d740accc;
    stim[18] = 67'h4a2124832ee9aef87;
    stim[19] = 67'h169adbdd51e180ba5;
    stim[20] = 67'h4b95ecd6f000c67f1;
    stim[21] = 67'h10e1cadf192052c59;
    stim[22] = 67'h1c52908649a9bca66;
    stim[23] = 67'h1f54940349247058d;
    stim[24] = 67'h0a228bd8dd9e9ab21;
    stim[25] = 67'h16deee2c6c92e2599;
    stim[26] = 67'h134c2fcc94bcdc10b;
    stim[27] = 67'h1231c08212e1e666c;
    stim[28] = 67'h1fdb293ba4cddb688;
    stim[29] = 67'h419e2c280a26407b0;
    stim[30] = 67'h08dee9304ab4e8ee6;
    stim[31] = 67'h4228ab6d35df5324e;
    stim[32] = 67'h1348968ed368bef82;
    stim[33] = 67'h402d37cd416d86c46;
    stim[34] = 67'h5ec5a2e6c2acc27b4;
    stim[35] = 67'h541112516a8695f74;
    stim[36] = 67'h48ea4691dd9284eb9;
    stim[37] = 67'h123aea5a28ffc93c7;
    stim[38] = 67'h1af07bb43c11406bd;
    stim[39] = 67'h483bb1848209837d8;
    stim[40] = 67'h5355d4553a1affab2;
    stim[41] = 67'h1b0eedbd5cd129685;
    stim[42] = 67'h433bb116328e57a25;
    stim[43] = 67'h5362679ef2d559e6d;
    stim[44] = 67'h068f1a35fd63c0199;
    stim[45] = 67'h5f5533e628ce3a62e;
    stim[46] = 67'h0464ffdc7a8a4c1d4;
    stim[47] = 67'h1527733d0af6c439b;
    stim[48] = 67'h4bc01a4711c761980;
    stim[49] = 67'h5d413091300020678;
    stim[50] = 67'h5cd8ff14b821b538e;
    stim[51] = 67'h0439804316cf2bd28;
    stim[52] = 67'h1ff5364a9cb7c84c5;
    stim[53] = 67'h590ed0e4cc82e8552;
    stim[54] = 67'h03c1e39ffc53aa302;
    stim[55] = 67'h1f42db6f302ff4ba1;
    stim[56] = 67'h535a75097975d4a2f;
    stim[57] = 67'h40928009546c2cd15;
    stim[58] = 67'h43771cf7a7a155084;
    stim[59] = 67'h4b11eae5a42eab1fd;
    stim[60] = 67'h0fd826b43624cf84c;
    stim[61] = 67'h1a96293b9bc13117e;
    stim[62] = 67'h1f3bb7c2f1923d93a;
    stim[63] = 67'h5c0b6bcd18f02a3df;
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
      expv[0] = 65'hxxxxxxxxxxxxxxxxx;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000002;
      expv[6] = 65'h00000000000000002;
      expv[7] = 65'h00000000000000002;
      expv[8] = 65'h00000000000000000;
      expv[9] = 65'h00000000000000000;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'h00000000000000000;
      expv[12] = 65'h00000000000000000;
      expv[13] = 65'h00000000000000000;
      expv[14] = 65'h00000000000000000;
      expv[15] = 65'h00000000000000000;
      expv[16] = 65'h00000000000000000;
      expv[17] = 65'h00000000000000000;
      expv[18] = 65'h00000000000000000;
      expv[19] = 65'h00000000000000000;
      expv[20] = 65'h00000000000000000;
      expv[21] = 65'h00000000000000000;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h00000000000000000;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h00000000000000000;
      expv[26] = 65'h00000000000000000;
      expv[27] = 65'h00000000000000000;
      expv[28] = 65'h00000000000000000;
      expv[29] = 65'h00000000000000000;
      expv[30] = 65'h00000000000000000;
      expv[31] = 65'h00000000000000000;
      expv[32] = 65'h00000000000000000;
      expv[33] = 65'h00000000000000000;
      expv[34] = 65'h00000000000000000;
      expv[35] = 65'h00000000000000000;
      expv[36] = 65'h00000000000000000;
      expv[37] = 65'h00000000000000000;
      expv[38] = 65'h00000000000000000;
      expv[39] = 65'h00000000000000000;
      expv[40] = 65'h00000000000000000;
      expv[41] = 65'h00000000000000000;
      expv[42] = 65'h00000000000000000;
      expv[43] = 65'h00000000000000000;
      expv[44] = 65'h00000000000000000;
      expv[45] = 65'h00000000000000000;
      expv[46] = 65'h00000000000000000;
      expv[47] = 65'h00000000000000000;
      expv[48] = 65'h00000000000000000;
      expv[49] = 65'h00000000000000000;
      expv[50] = 65'h00000000000000000;
      expv[51] = 65'h00000000000000000;
      expv[52] = 65'h00000000000000000;
      expv[53] = 65'h00000000000000000;
      expv[54] = 65'h00000000000000000;
      expv[55] = 65'h00000000000000000;
      expv[56] = 65'h00000000000000000;
      expv[57] = 65'h00000000000000000;
      expv[58] = 65'h00000000000000000;
      expv[59] = 65'h00000000000000000;
      expv[60] = 65'h00000000000000000;
      expv[61] = 65'h00000000000000000;
      expv[62] = 65'h00000000000000000;
      expv[63] = 65'h00000000000000000;
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
